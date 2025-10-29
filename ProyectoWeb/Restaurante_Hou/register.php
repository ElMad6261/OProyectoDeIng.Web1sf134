<?php
include 'config.php';
session_start();

$mensaje = '';
$error = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nombre = trim($_POST['nombre']);
    $correo = trim($_POST['correo']);
    $clave = trim($_POST['clave']);

    // Validar correo solo para clientes
    if (!filter_var($correo, FILTER_VALIDATE_EMAIL)) {
        $error = "Por favor, introduce un correo electrónico válido (debe contener '@').";
    } else {
        // Verificar si el correo ya existe
        $stmt = $conn->prepare("SELECT * FROM Usuario WHERE correo = ?");
        if (!$stmt) {
            die("Error en la preparación de la consulta: " . $conn->error);
        }
        $stmt->bind_param("s", $correo);
        $stmt->execute();
        $resultado = $stmt->get_result();

        if ($resultado->num_rows > 0) {
            $error = "El correo ya está registrado.";
        } else {
            // Insertar nuevo usuario como cliente (contraseña plana)
            $stmt = $conn->prepare("INSERT INTO Usuario (nombre, correo, clave, rol) VALUES (?, ?, ?, 'cliente')");
            if (!$stmt) {
                die("Error en la preparación de la consulta: " . $conn->error);
            }
            $stmt->bind_param("sss", $nombre, $correo, $clave);
            if ($stmt->execute()) {
                $mensaje = "Registro exitoso. Ahora puedes iniciar sesión.";
            } else {
                $error = "Error al registrar el usuario: " . $conn->error;
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro - Restaurante Hou</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<header>
    <h1>Registro de Cliente</h1>
</header>

<main>
    <div class="login-container">
        <h2>Crear cuenta</h2>
        <?php if($mensaje): ?>
            <p class="success"><?= htmlspecialchars($mensaje) ?></p>
        <?php endif; ?>
        <?php if($error): ?>
            <p class="error"><?= htmlspecialchars($error) ?></p>
        <?php endif; ?>

        <form method="POST" action="">
            <label>Nombre:</label>
            <input type="text" name="nombre" required>

            <label>Correo electrónico:</label>
            <input type="email" name="correo" required>

            <label>Contraseña:</label>
            <input type="password" name="clave" required>

            <button type="submit">Registrarse</button>
        </form>

        <a href="login.php" class="volver">← Volver al inicio de sesión</a>
    </div>
</main>
</body>
</html>