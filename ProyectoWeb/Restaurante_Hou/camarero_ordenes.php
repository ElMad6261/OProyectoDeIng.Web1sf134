<?php
include 'config.php';
session_start();

// Seguridad: solo admin
if (!isset($_SESSION['rol']) || $_SESSION['rol'] !== 'camarero') {
    header("Location: login.php");
    exit();
}

// Obtener sucursal
$id_sucursal = isset($_GET['id_sucursal']) ? intval($_GET['id_sucursal']) : null;
if (!$id_sucursal) {
    die("No se ha seleccionado una sucursal.");
}

$error = '';
$mensaje = '';

// Completar orden
if (isset($_GET['completar_orden'])) {
    $codigo = intval($_GET['completar_orden']);
    $check = $conn->query("SELECT estado FROM orden WHERE num_orden=$codigo")->fetch_assoc();

    if ($check && strtolower($check['estado']) === 'pendiente') {
        $conn->query("UPDATE orden SET estado='completada' WHERE num_orden=$codigo");
        $mensaje = "Orden #$codigo marcada como completada.";
    } else {
        $error = "No se puede completar una orden que ya está cancelada o completada.";
    }
}

// Cancelar orden
if (isset($_GET['cancelar_orden'])) {
    $codigo = intval($_GET['cancelar_orden']);
    $check = $conn->query("SELECT estado FROM orden WHERE num_orden=$codigo")->fetch_assoc();

    if ($check && strtolower($check['estado']) === 'pendiente') {
        $conn->query("UPDATE orden SET estado='cancelada' WHERE num_orden=$codigo");
        $mensaje = "Orden #$codigo cancelada correctamente.";
    } else {
        $error = "No se puede cancelar una orden que ya está cancelada o completada.";
    }
}

// Obtener todas las órdenes actualizadas
$ordenes = $conn->query("SELECT * FROM orden WHERE id_sucursal=$id_sucursal ORDER BY fecha DESC");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Órdenes - Sucursal <?= $id_sucursal ?></title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<?php include 'includes/camarero_header.php'; ?>

<main class="admin-dashboard">
    <h2>Órdenes - Sucursal <?= $id_sucursal ?></h2>

    <?php if($mensaje): ?><p class="success"><?= htmlspecialchars($mensaje) ?></p><?php endif; ?>
    <?php if($error): ?><p class="error"><?= htmlspecialchars($error) ?></p><?php endif; ?>

    <table class="admin-table">
        <thead>
            <tr>
                <th># Orden</th>
                <th>Fecha</th>
                <th>Monto Total</th>
                <th>Forma de Pago</th>
                <th>Cédula Cliente</th>
                <th>Cédula Camarero</th>
                <th>Estado</th>
            </tr>
        </thead>
        <tbody>
            <?php while($o = $ordenes->fetch_assoc()): ?>
                <tr>
                    <td><?= $o['num_orden'] ?></td>
                    <td><?= htmlspecialchars($o['fecha']) ?></td>
                    <td>$<?= number_format($o['monto_total'], 2) ?></td>
                    <td><?= htmlspecialchars($o['forma_pago']) ?></td>
                    <td><?= htmlspecialchars($o['cedula_cliente']) ?></td>
                    <td><?= htmlspecialchars($o['cedula_camarero']) ?></td>
                    <td>
                        <?php
                            $estado = strtolower($o['estado']);
                            if ($estado === 'completada') echo "<span class='estado completada'>Completada</span>";
                            elseif ($estado === 'cancelada') echo "<span class='estado cancelada'>Cancelada</span>";
                            else echo "<span class='estado pendiente'>Pendiente</span>";
                        ?>
                    </td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</main>
</body>
</html> 