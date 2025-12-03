<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

include 'config.php';

// Guardar sucursal seleccionada en sesión si llega por GET
if (isset($_GET['id_sucursal']) && $_GET['id_sucursal'] !== '') {
    $_SESSION['id_sucursal'] = $_GET['id_sucursal'];
}

// Obtener la sucursal activa (desde GET o desde la sesión)
$id_sucursal_actual = $_GET['id_sucursal'] ?? ($_SESSION['id_sucursal'] ?? '');

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
    <div class="top-bar">
        <div class="logo">
            <h1>Restaurante Hou</h1>

            <?php if ($id_sucursal_actual): ?>
                <?php
                // Obtener nombre de sucursal sin mostrarlo todavía
                $queryNombre = "SELECT nombre FROM sucursal WHERE id_sucursal = $id_sucursal_actual";
                $resultNombre = $conn->query($queryNombre);

                if (!$resultNombre) {
                    echo "<!-- Error SQL en header (nombre sucursal): " . $conn->error . " -->";
                } else {
                    $nombreSucursal = $resultNombre->fetch_assoc();
                }
                ?>
            <?php endif; ?>
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

            <div class="sucursal-dropdown" style="text-align:right;">
                <br>
                <p style="margin:0; font-size:14px; color:#333; font-weight:bold;">Escoja una sucursal:</p>

                <form method="GET" action="<?= htmlspecialchars($pagina_actual) ?>" style="margin-top:4px;">
                    <select name="id_sucursal" id="sucursal" onchange="this.form.submit()" 
                            style="padding:6px; border-radius:5px; min-width:180px;">

                        <option value="">Seleccione sucursal</option>

                        <?php
                        // Cargar lista de sucursales
                        $querySucursales = "SELECT id_sucursal, nombre FROM sucursal ORDER BY nombre ASC";
                        $result = $conn->query($querySucursales);

                        if (!$result) {
                            echo "<!-- Error SQL en header (lista sucursales): " . $conn->error . " -->";
                        } else {
                            while ($row = $result->fetch_assoc()) {
                                $selected = ($id_sucursal_actual == $row['id_sucursal']) ? 'selected' : '';
                                echo "<option value='{$row['id_sucursal']}' $selected>{$row['nombre']}</option>";
                            }
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
