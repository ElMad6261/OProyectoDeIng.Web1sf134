<?php
include 'config.php';
session_start();

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $correo = trim($_POST['correo']); // puede ser correo o código de empleado
    $clave = trim($_POST['clave']);

    // Buscar usuario por correo/código
    $stmt = $conn->prepare("SELECT * FROM usuario WHERE correo = ?");
    if (!$stmt) {
        die("Error en la preparación de la consulta: " . $conn->error);
    }

    $stmt->bind_param("s", $correo);
    $stmt->execute();
    $resultado = $stmt->get_result();

    if ($resultado->num_rows > 0) {
        $usuario = $resultado->fetch_assoc();

        // Comparar contraseña plana
        if ($clave === $usuario['clave']) {
            $_SESSION['usuario'] = $usuario['nombre'];
            $_SESSION['rol'] = $usuario['rol'];

            // Redirigir según rol
            if ($usuario['rol'] === 'administrador') {
                header("Location: admin_dashboard.php");
                exit();
            } elseif ($usuario['rol'] === 'camarero') {
                header("Location: camarero_dashboard.php");
                exit();
            } else {
                header("Location: index.php");
                exit();
            }

        } else {
            $error = "Contraseña incorrecta.";
        }

    } else {
        $error = "No existe una cuenta con ese correo o código.";
    }

    $stmt->close();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión - Restaurante Hou</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<header>
    <h1>Restaurante Hou</h1>
</header>

<main>
    <div class="login-container">
        <h2>Iniciar Sesión</h2>

        <?php if (isset($error)) echo "<p class='error'>$error</p>"; ?>

        <form method="POST" action="">
            <label for="correo">Correo electrónico</label>
            <input type="text" name="correo" id="correo" required>

            <label for="clave">Contraseña:</label>
            <input type="password" name="clave" id="clave" required>

            <button type="submit">Entrar</button>
        </form>

        <a href="register.php" class="volver">¿No tienes cuenta? Regístrate aquí</a>
        <a href="index.php" class="volver">← Volver al inicio</a>
    </div>
</main>

<footer>
    <p>&copy; 2025 Restaurante Hou</p>
</footer>
</body>
</html>