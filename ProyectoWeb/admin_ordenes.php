<?php
include 'config.php';
session_start();

// Seguridad: solo admin
if (!isset($_SESSION['rol']) || $_SESSION['rol'] !== 'administrador') {
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
if(isset($_GET['completar_orden'])){
    $codigo = intval($_GET['completar_orden']);
    $orden = $conn->query("SELECT estado FROM orden WHERE num_orden=$codigo")->fetch_assoc();
    if($orden['estado'] !== 'Completada' && $orden['estado'] !== 'Cancelada'){
        $conn->query("UPDATE orden SET estado='Completada' WHERE num_orden=$codigo");
        $mensaje = "Orden marcada como completada.";
    } else {
        $error = "No se puede completar esta orden.";
    }
}

// Cancelar orden
if(isset($_GET['cancelar_orden'])){
    $codigo = intval($_GET['cancelar_orden']);
    $orden = $conn->query("SELECT estado FROM orden WHERE num_orden=$codigo")->fetch_assoc();
    if($orden['estado'] !== 'Completada' && $orden['estado'] !== 'Cancelada'){
        $conn->query("UPDATE orden SET estado='Cancelada' WHERE num_orden=$codigo");
        $mensaje = "Orden cancelada correctamente.";
    } else {
        $error = "No se puede cancelar esta orden.";
    }
}

// Obtener todas las órdenes de la sucursal
$ordenes = $conn->query("SELECT * FROM orden WHERE id_sucursal=$id_sucursal ORDER BY fecha DESC");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Órdenes - Sucursal <?= $id_sucursal ?></title>
    <link rel="stylesheet" href="css/estilos.css">
    <script>
        function confirmarAccion(mensaje, url) {
            if(confirm(mensaje)) {
                window.location.href = url;
            }
        }
    </script>
</head>
<body>
<?php include 'includes/admin_header.php'; ?>

<main class="admin-dashboard">
    <h2>Gestión de Órdenes - Sucursal <?= $id_sucursal ?></h2>

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
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <?php while($o = $ordenes->fetch_assoc()): ?>
                <tr>
                    <td><?= $o['num_orden'] ?></td>
                    <td><?= $o['fecha'] ?></td>
                    <td><?= $o['monto_total'] ?></td>
                    <td><?= htmlspecialchars($o['forma_pago']) ?></td>
                    <td><?= htmlspecialchars($o['cedula_cliente']) ?></td>
                    <td><?= htmlspecialchars($o['cedula_camarero']) ?></td>
                    <td><?= $o['estado'] ?></td>
                    <td>
                        <?php if($o['estado'] !== 'Completada' && $o['estado'] !== 'Cancelada'): ?>
                            <a href="javascript:confirmarAccion('¿Está seguro que desea completar esta orden?', 'admin_ordenes.php?id_sucursal=<?= $id_sucursal ?>&completar_orden=<?= $o['num_orden'] ?>')" class="btn-modificar">Completar</a>
                            <a href="javascript:confirmarAccion('¿Está seguro que desea cancelar esta orden?', 'admin_ordenes.php?id_sucursal=<?= $id_sucursal ?>&cancelar_orden=<?= $o['num_orden'] ?>')" class="btn-eliminar">Cancelar</a>
                        <?php endif; ?>
                    </td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</main>
</body>
</html>