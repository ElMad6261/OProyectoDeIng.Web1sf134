<?php
session_start();
if ($_SESSION['rol'] != 'camarero') {
    header("Location: login.php");
    exit();
}
echo "<h1>Panel del Camarero</h1>";
echo "<p>Bienvenido, " . $_SESSION['usuario'] . "</p>";
echo "<a href='form_pedido.php'>Registrar Pedido</a><br>";
echo "<a href='ver_pedidos.php'>Ver Pedidos</a><br>";
echo "<a href='logout.php'>Cerrar sesión</a>";
?>