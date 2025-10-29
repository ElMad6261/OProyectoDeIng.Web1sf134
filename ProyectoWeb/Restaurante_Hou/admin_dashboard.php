<?php
include 'config.php';
session_start();

// Seguridad: solo admin puede entrar
if (!isset($_SESSION['rol']) || $_SESSION['rol'] !== 'administrador') {
    header("Location: login.php");
    exit();
}

// Obtener nombre del admin
$admin = isset($_SESSION['usuario']) ? $_SESSION['usuario'] : 'Administrador';

// Obtener todas las sucursales
$sucursales = $conn->query("SELECT * FROM sucursal");
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Administración - Sucursales</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<header class="admin-header">
    <div class="admin-header-left">
        <h1>Panel de Administración</h1>
        <p class="admin-bienvenida">👋 Bienvenido, <strong><?= htmlspecialchars($admin) ?></strong></p>
    </div>
    <a href="logout.php" class="btn-logout">Cerrar sesión</a>
</header>

<main class="admin-dashboard">
    <h2>Lista de Sucursales</h2>
    <p class="admin-descripcion">Selecciona una sucursal para gestionarla.</p>

    <table class="admin-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Dirección</th>
                <th>Correo</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($s = $sucursales->fetch_assoc()): ?>
                <tr>
                    <td><?= $s['id_sucursal'] ?></td>
                    <td><?= htmlspecialchars($s['nombre']) ?></td>
                    <td><?= htmlspecialchars($s['direccion']) ?></td>
                    <td><?= htmlspecialchars($s['email']) ?></td>
                    <td>
                        <a href="admin_panel.php?id_sucursal=<?= $s['id_sucursal'] ?>" class="btn-gestionar">Gestionar</a>
                    </td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</main>
</body>
</html>

<?php include 'includes/footer.php'; ?>