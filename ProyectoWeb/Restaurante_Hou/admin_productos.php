<?php
include 'config.php';
session_start();

// Seguridad: solo admin
if (!isset($_SESSION['rol']) || $_SESSION['rol'] !== 'administrador') {
    header("Location: login.php");
    exit();
}

// Obtener sucursal
$id_sucursal = isset($_GET['id_sucursal']) ? intval($_GET['id_sucursal']) : null;
if (!$id_sucursal) {
    die("No se ha seleccionado una sucursal.");
}

$error = '';
$mensaje = '';

// -------------------- CRUD PRODUCTOS --------------------

// Agregar producto
if (isset($_POST['agregar'])) {
    $nombre = trim($_POST['nombre']);
    $precio = trim($_POST['precio']);
    $descripcion = trim($_POST['descripcion']);
    $tipo = trim($_POST['tipo_producto']);

    if (empty($nombre) || empty($precio) || empty($descripcion) || empty($tipo)) {
        $error = "Todos los campos son obligatorios.";
    } else {
        $stmt = $conn->prepare("INSERT INTO producto (nombre, precio, descripcion, tipo_producto) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("sdss", $nombre, $precio, $descripcion, $tipo);
        if ($stmt->execute()) {
            $mensaje = "Producto agregado correctamente.";
        } else {
            $error = $stmt->error;
        }
    }
}

// Cargar producto para modificar
$editarProducto = null;
if (isset($_GET['modificar'])) {
    $codigo = intval($_GET['modificar']);
    $editarProducto = $conn->query("SELECT * FROM producto WHERE codigo_producto = $codigo")->fetch_assoc();
}

// Modificar producto
if (isset($_POST['modificar'])) {
    $codigo = intval($_POST['codigo_producto']);
    $nombre = trim($_POST['nombre']);
    $precio = trim($_POST['precio']);
    $descripcion = trim($_POST['descripcion']);
    $tipo = trim($_POST['tipo_producto']);

    if (empty($nombre) || empty($precio) || empty($descripcion) || empty($tipo)) {
        $error = "Todos los campos son obligatorios para modificar.";
    } else {
        $stmt = $conn->prepare("UPDATE producto SET nombre=?, precio=?, descripcion=?, tipo_producto=? WHERE codigo_producto=?");
        $stmt->bind_param("sdssi", $nombre, $precio, $descripcion, $tipo, $codigo);
        if ($stmt->execute()) {
            $mensaje = "Producto modificado correctamente.";
            // Recargar producto modificado
            $editarProducto = null;
        } else {
            $error = $stmt->error;
        }
    }
}

// Cambiar disponibilidad
if (isset($_GET['cambiar_disponibilidad'])) {
    $codigo = intval($_GET['cambiar_disponibilidad']);
    $p = $conn->query("SELECT disponible FROM producto WHERE codigo_producto=$codigo")->fetch_assoc();
    $nuevo_estado = $p['disponible'] ? 0 : 1;
    $conn->query("UPDATE producto SET disponible=$nuevo_estado WHERE codigo_producto=$codigo");
    $mensaje = "Disponibilidad actualizada.";
}

// Eliminar producto
if (isset($_GET['eliminar'])) {
    $codigo = intval($_GET['eliminar']);
    $conn->query("DELETE FROM producto WHERE codigo_producto=$codigo");
    $mensaje = "Producto eliminado.";
}

// Obtener productos
$productos = $conn->query("SELECT * FROM producto");
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Productos - Sucursal <?= $id_sucursal ?></title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<?php include 'includes/admin_header.php'; ?>

<main class="admin-dashboard">
    <h2>Gestión de Productos - Sucursal <?= $id_sucursal ?></h2>

    <?php if($mensaje): ?><p class="success"><?= htmlspecialchars($mensaje) ?></p><?php endif; ?>
    <?php if($error): ?><p class="error"><?= htmlspecialchars($error) ?></p><?php endif; ?>

    <!-- Formulario Agregar/Modificar -->
    <?php if($editarProducto): ?>
        <h3>Modificar Producto</h3>
        <form method="POST" class="admin-form">
            <input type="hidden" name="codigo_producto" value="<?= $editarProducto['codigo_producto'] ?>">
            <input type="text" name="nombre" value="<?= htmlspecialchars($editarProducto['nombre']) ?>" placeholder="Nombre" required>
            <input type="number" step="0.01" name="precio" value="<?= $editarProducto['precio'] ?>" placeholder="Precio" required>
            <input type="text" name="descripcion" value="<?= htmlspecialchars($editarProducto['descripcion']) ?>" placeholder="Descripción" required>
            <input type="text" name="tipo_producto" value="<?= htmlspecialchars($editarProducto['tipo_producto']) ?>" placeholder="Tipo" required>
            <button type="submit" name="modificar">Guardar Cambios</button>
        </form>
    <?php else: ?>
        <h3>Agregar Producto</h3>
        <form method="POST" class="admin-form">
            <input type="text" name="nombre" placeholder="Nombre" required>
            <input type="number" step="0.01" name="precio" placeholder="Precio" required>
            <input type="text" name="descripcion" placeholder="Descripción" required>
            <input type="text" name="tipo_producto" placeholder="Tipo" required>
            <button type="submit" name="agregar">Agregar</button>
        </form>
    <?php endif; ?>

    <!-- Tabla de Productos -->
    <h3>Lista de Productos</h3>
    <table class="admin-table">
        <thead>
            <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Descripción</th>
                <th>Tipo</th>
                <th>Disponible</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <?php while($p = $productos->fetch_assoc()): ?>
            <tr>
                <td><?= $p['codigo_producto'] ?></td>
                <td><?= htmlspecialchars($p['nombre']) ?></td>
                <td><?= $p['precio'] ?></td>
                <td><?= htmlspecialchars($p['descripcion']) ?></td>
                <td><?= htmlspecialchars($p['tipo_producto']) ?></td>
                <td><?= $p['disponible'] ? 'Sí' : 'No' ?></td>
                <td>
                    <a href="admin_productos.php?id_sucursal=<?= $id_sucursal ?>&modificar=<?= $p['codigo_producto'] ?>" class="btn-modificar">Modificar</a>
                    <a href="admin_productos.php?id_sucursal=<?= $id_sucursal ?>&cambiar_disponibilidad=<?= $p['codigo_producto'] ?>" class="btn-disponibilidad">
                        <?= $p['disponible'] ? 'Deshabilitar' : 'Habilitar' ?>
                    </a>
                    <a href="admin_productos.php?id_sucursal=<?= $id_sucursal ?>&eliminar=<?= $p['codigo_producto'] ?>" class="btn-eliminar"
                       onclick="return confirm('¿Seguro que deseas eliminar este producto?');">Eliminar</a>
                </td>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</main>
</body>
</html>