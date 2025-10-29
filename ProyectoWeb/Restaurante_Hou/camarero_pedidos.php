<?php
session_start();
include 'config.php';
include 'includes/camarero_header.php';

// Seguridad: solo camarero
if (!isset($_SESSION['rol']) || $_SESSION['rol'] !== 'camarero') {
    header("Location: login.php");
    exit();
}

// Obtener sucursal seleccionada
$id_sucursal = isset($_GET['id_sucursal']) ? intval($_GET['id_sucursal']) : null;

// Mensajes
$mensaje = '';
$error = '';

// Enviar pedido
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_usuario = $_SESSION['id_usuario'] ?? null;
    $id_sucursal_post = intval($_POST['id_sucursal']);
    $forma_pago = trim($_POST['forma_pago']);
    $nota = trim($_POST['nota']);
    $platos_cantidades = $_POST['platos'] ?? []; // array: codigo_plato => cantidad

    // Validar al menos un plato con cantidad > 0
    $totalPlatos = 0;
    foreach ($platos_cantidades as $cantidad) {
        $totalPlatos += intval($cantidad);
    }

    if ($totalPlatos === 0) {
        $error = "Debe seleccionar al menos un plato con cantidad mayor a 0.";
    } elseif (empty($forma_pago)) {
        $error = "Debe seleccionar la forma de pago.";
    } else {
        // Calcular monto total y detalle
        $total = 0;
        $detalle = [];
        foreach ($platos_cantidades as $codigo_plato => $cantidad) {
            $cantidad = intval($cantidad);
            if ($cantidad > 0) {
                $stmt = $conn->prepare("SELECT nombre, precio FROM Plato WHERE codigo_plato = ?");
                $stmt->bind_param("i", $codigo_plato);
                $stmt->execute();
                $result = $stmt->get_result();
                if ($row = $result->fetch_assoc()) {
                    $detalle[] = $row['nombre']." x".$cantidad;
                    $total += $row['precio'] * $cantidad;
                }
                $stmt->close();
            }
        }
        $detalle_texto = implode(", ", $detalle);

        // Insertar orden
        $stmt = $conn->prepare("INSERT INTO orden (id_sucursal, forma_pago, nota, monto_total, estado, fecha) VALUES (?, ?, ?, ?, 'pendiente', NOW())");
        $stmt->bind_param("issd", $id_sucursal_post, $forma_pago, $nota, $total);
        if ($stmt->execute()) {
            $mensaje = "Pedido enviado correctamente. Monto total: $".$total;
        } else {
            $error = "Error al guardar el pedido: ".$stmt->error;
        }
        $stmt->close();
    }
}

// Obtener platos disponibles según sucursal
$platos = [];
if ($id_sucursal) {
    $sql = "SELECT p.* FROM Plato p
            INNER JOIN Ofrece o ON p.codigo_plato = o.codigo_plato
            WHERE o.id_sucursal = $id_sucursal AND p.disponible = 1
            ORDER BY p.nombre ASC";
    $result = $conn->query($sql);
    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $platos[] = $row;
        }
    }
}
?>

<div class="container">
    <h2 style="text-align:center; margin-bottom:20px;">Realizar Pedido</h2>

    <?php if ($mensaje): ?>
        <p style="text-align:center; color:green; font-weight:bold;"><?= htmlspecialchars($mensaje) ?></p>
    <?php endif; ?>
    <?php if ($error): ?>
        <p style="text-align:center; color:red; font-weight:bold;"><?= htmlspecialchars($error) ?></p>
    <?php endif; ?>

    <?php if (!$id_sucursal): ?>
        <p style="text-align:center; color:red;">Seleccione una sucursal para ver los platos disponibles.</p>
    <?php elseif (empty($platos)): ?>
        <p style="text-align:center;">No hay platos disponibles en esta sucursal.</p>
    <?php else: ?>
        <form method="POST" class="camarero-form" onsubmit="return validarPedido();">
            <input type="hidden" name="id_sucursal" value="<?= $id_sucursal ?>">

            <label>Platos disponibles:</label>
            <div class="platos-checkboxes">
                <?php foreach ($platos as $plato): ?>
                    <label>
                        <?= htmlspecialchars($plato['nombre']) ?> ($<?= $plato['precio'] ?>)
                        <input type="number" name="platos[<?= $plato['codigo_plato'] ?>]" value="0" min="0" class="plato-cantidad" data-precio="<?= $plato['precio'] ?>">
                    </label>
                <?php endforeach; ?>
            </div>

            <label>Forma de pago:</label>
            <select name="forma_pago" required>
                <option value="">Seleccione</option>
                <option value="Efectivo">Efectivo</option>
                <option value="Tarjeta">Tarjeta</option>
            </select>

            <label>Notas adicionales:</label>
            <textarea name="nota" rows="3" placeholder="Escribe alguna petición extra..."></textarea>

            <p class="total-monto">Monto total: $<span id="totalMonto">0.00</span></p>

            <button type="submit">Enviar Pedido</button>
        </form>
    <?php endif; ?>
</div>

<script>
// Calcular monto total en tiempo real
const cantidades = document.querySelectorAll('.plato-cantidad');
const totalSpan = document.getElementById('totalMonto');

function actualizarTotal() {
    let total = 0;
    cantidades.forEach(input => {
        const cantidad = parseInt(input.value) || 0;
        const precio = parseFloat(input.dataset.precio);
        total += cantidad * precio;
    });
    totalSpan.textContent = total.toFixed(2);
}

cantidades.forEach(input => input.addEventListener('input', actualizarTotal));

// Validar al menos un plato con cantidad > 0 antes de enviar
function validarPedido() {
    let totalPlatos = 0;
    cantidades.forEach(input => totalPlatos += parseInt(input.value) || 0);
    if (totalPlatos === 0) {
        alert("Debe seleccionar al menos un plato con cantidad mayor a 0.");
        return false;
    }
    return true;
}
</script>
