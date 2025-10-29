<?php
session_start();
include 'config.php';
include 'includes/camarero_header.php';

// Seguridad: solo camarero
if (!isset($_SESSION['rol']) || $_SESSION['rol'] !== 'camarero') {
    header("Location: login.php");
    exit();
}

// Obtener todas las sucursales
$sucursales = $conn->query("SELECT * FROM Sucursal");
?>

<div class="container">

    <div class="camarero-sucursal-list">
        <?php if($sucursales && $sucursales->num_rows > 0): ?>
            <?php while($s = $sucursales->fetch_assoc()): ?>
                <div class="camarero-sucursal-card">
                    <h3><?= htmlspecialchars($s['nombre']) ?></h3>
                    <p><b>Dirección:</b> <?= htmlspecialchars($s['direccion']) ?></p>
                    <p><b>Email:</b> <?= htmlspecialchars($s['email']) ?></p>

                    <a href="camarero_pedidos.php?id_sucursal=<?= $s['id_sucursal'] ?>" class="camarero-dashboard-btn">Ordenar</a>
                    <a href="camarero_ordenes.php?id_sucursal=<?= $s['id_sucursal'] ?>" class="camarero-dashboard-btn ver-pedidos">Ver Ordenes</a>
                </div>
            <?php endwhile; ?>
        <?php else: ?>
            <p style="text-align:center;">No hay sucursales disponibles.</p>
        <?php endif; ?>
    </div>
</div>