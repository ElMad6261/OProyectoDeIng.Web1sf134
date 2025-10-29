<?php
if (session_status() === PHP_SESSION_NONE) session_start();
include 'config.php';

if (!isset($id_sucursal)) {
    $id_sucursal = isset($_GET['id_sucursal']) ? intval($_GET['id_sucursal']) : null;
}

$current_page = basename($_SERVER['PHP_SELF']);
?>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/estilos.css">
</head>

<header class="camarero-header">
    <div class="camarero-menu-left">
        <h2>Panel del Camarero</h2>
        <?php if($id_sucursal): ?>
            <p>ID Sucursal: <strong><?= $id_sucursal ?></strong></p>
        <?php endif; ?>
    </div>

    <div class="camarero-menu-right">
        <?php if(in_array($current_page, ['camarero_pedidos.php','camarero_ordenes.php'])): ?>
            <a href="camarero_dashboard.php" class="camarero-dashboard-btn">← Volver al Dashboard</a>
        <?php endif; ?>
        <a href="logout.php" class="btn-logout">Cerrar sesión</a>
    </div>
</header>