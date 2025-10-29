<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
include 'config.php';

// Detectar la sección activa
$pagina_actual = basename($_SERVER['PHP_SELF']);
$activo_inicio = in_array($pagina_actual, ['index.php']) ? 'active' : '';
$activo_platos = in_array($pagina_actual, ['platos.php', 'detalle_plato.php']) ? 'active' : '';
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
    <div class="top-bar" style="display: flex; justify-content: space-between; align-items: center; padding: 0 40px;">
        <div class="logo">
            <h1 style="margin: 0;">Restaurante Hou</h1>
        </div>
        <div style="display: flex; flex-direction: column; align-items: flex-end; gap: 6px;">
            <div class="user-section">
                <?php if(isset($_SESSION['usuario'])): ?>
                    <span class="welcome-text">👋 Bienvenido, <strong><?= htmlspecialchars($_SESSION['usuario']) ?></strong></span>
                    <a href="logout.php" class="logout-btn" style="margin-left: 10px;">Cerrar sesión</a>
                <?php else: ?>
                    <a href="login.php" class="login-btn">Iniciar sesión</a>
                <?php endif; ?>
            </div>
            <div class="sucursal-dropdown">
                <form method="GET" action="<?= htmlspecialchars($pagina_actual) ?>">
                    <select name="id_sucursal" id="sucursal" onchange="this.form.submit()">
                        <option value="">Seleccione sucursal</option>
                        <?php
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
    </div>

    <nav style="text-align:center; margin-top:10px;">
        <a href="index.php" class="<?= $activo_inicio ?>">Inicio</a>
        <a href="platos.php" class="<?= $activo_platos ?>">Platos</a>
    </nav>
</header>
<main>