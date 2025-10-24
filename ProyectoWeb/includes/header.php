<?php
// header.php
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Restaurante Hou</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<header>
    <div class="top-bar">
        <div class="logo">
            <h1>Restaurante Hou</h1>
        </div>
        <div class="login">
            <a href="login.php">Iniciar Sesión</a>
        </div>
        <div class="sucursal-dropdown">
            <form method="GET" action="index.php">
                <label for="sucursal">Sucursal:</label>
                <select name="id_sucursal" id="sucursal" onchange="this.form.submit()">
                    <option value="">Seleccione sucursal</option>
                    <!-- Aquí se llenarán con PHP desde la tabla Sucursal -->
                    <?php
                    // Suponiendo que $conn está definido en config.php
                    include 'config.php';
                    $result = $conn->query("SELECT id_sucursal, nombre FROM Sucursal");
                    while($row = $result->fetch_assoc()){
                        $selected = (isset($_GET['id_sucursal']) && $_GET['id_sucursal'] == $row['id_sucursal']) ? 'selected' : '';
                        echo "<option value='{$row['id_sucursal']}' $selected>{$row['nombre']}</option>";
                    }
                    ?>
                </select>
            </form>
        </div>
    </div>
    <nav>
        <a href="index.php">Inicio</a> |
        <a href="platos.php">Platos</a>
    </nav>
</header>
<main>