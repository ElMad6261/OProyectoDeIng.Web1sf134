<?php
include 'config.php';
session_start();

// Seguridad
if (!isset($_SESSION['rol']) || $_SESSION['rol'] !== 'administrador') {
    header("Location: login.php");
    exit();
}

$id_sucursal = isset($_GET['id_sucursal']) ? intval($_GET['id_sucursal']) : null;

if ($id_sucursal) {
    header("Location: admin_productos.php?id_sucursal=" . $id_sucursal);
    exit();
} else {
    header("Location: admin_dashboard.php");
    exit();
}
?>