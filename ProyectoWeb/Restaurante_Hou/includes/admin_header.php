<?php
if (!isset($_SESSION)) session_start();

if (!isset($id_sucursal)) {
    $id_sucursal = isset($_GET['id_sucursal']) ? intval($_GET['id_sucursal']) : null;
}

$current_page = basename($_SERVER['PHP_SELF']);
?>
<header class="admin-top-menu">
    <div class="admin-menu-left">
        <h2>Gestión de Sucursal</h2>
        <p>ID Sucursal: <strong><?= $id_sucursal ?></strong></p>
    </div>

    <nav class="admin-nav">
        <a href="admin_productos.php?id_sucursal=<?= $id_sucursal ?>" 
           class="<?= $current_page == 'admin_productos.php' ? 'active' : '' ?>">Productos</a>
        <a href="admin_platos.php?id_sucursal=<?= $id_sucursal ?>" 
           class="<?= $current_page == 'admin_platos.php' ? 'active' : '' ?>">Platos</a>
        <a href="admin_ordenes.php?id_sucursal=<?= $id_sucursal ?>" 
           class="<?= $current_page == 'admin_ordenes.php' ? 'active' : '' ?>">Órdenes</a>
    </nav>

    <div class="admin-menu-right">
        <a href="admin_dashboard.php" class="btn-volver">← Volver al Panel de administración</a>
        <a href="logout.php" class="btn-logout">Cerrar sesión</a>
    </div>
</header>