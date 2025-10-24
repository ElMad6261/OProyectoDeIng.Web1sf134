<?php
include 'config.php';
session_start();

if (!isset($_SESSION['rol']) || $_SESSION['rol'] !== 'administrador') {
    header("Location: login.php");
    exit();
}

// Obtener sucursal
$id_sucursal = $_GET['id_sucursal'] ?? null;
if (!$id_sucursal) {
    header("Location: admin_dashboard.php");
    exit();
}

// Sucursal seleccionada
$stmt = $conn->prepare("SELECT nombre FROM Sucursal WHERE id_sucursal = ?");
$stmt->bind_param("i", $id_sucursal);
$stmt->execute();
$sucursal = $stmt->get_result()->fetch_assoc();
?>

<h1>Administrando Sucursal: <?= htmlspecialchars($sucursal['nombre']) ?></h1>

<!-- Tabs o secciones -->
<nav>
    <a href="#inventario">Inventario</a> |
    <a href="#platos">Platos</a> |
    <a href="#ordenes">Órdenes</a>
</nav>

<section id="inventario">
    <h2>Inventario de Productos</h2>
    <!-- Tabla de productos con opciones de Crear, Editar, Eliminar, Disponibilidad -->
</section>

<section id="platos">
    <h2>Platos</h2>
    <!-- Tabla de platos con opciones de Crear, Editar, Eliminar, Disponibilidad -->
</section>

<section id="ordenes">
    <h2>Órdenes</h2>
    <!-- Tabla de órdenes con opción de cancelar -->
</section>