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

// -------------------- CRUD PLATOS --------------------

// Agregar plato
if (isset($_POST['agregar'])) {
    $nombre = $_POST['nombre'];
    $tipo = $_POST['tipo'];
    $precio = $_POST['precio'];
    $descripcion = $_POST['descripcion'];
    $cedula_cocinero = $_POST['cedula_cocinero'];
    $imagen = $_POST['imagen'];
    $disponible = 1;

    $stmt = $conn->prepare("INSERT INTO plato (nombre, tipo, precio, descripcion, cedula_cocinero, imagen, disponible) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssdsssi", $nombre, $tipo, $precio, $descripcion, $cedula_cocinero, $imagen, $disponible);
    $stmt->execute();
}

// Cargar plato para modificar
$editarPlato = null;
if (isset($_GET['modificar'])) {
    $codigo = intval($_GET['modificar']);
    $editarPlato = $conn->query("SELECT * FROM plato WHERE codigo_plato = $codigo")->fetch_assoc();
}

// Modificar plato
if (isset($_POST['modificar'])) {
    $codigo = intval($_POST['codigo_plato']);
    $nombre = $_POST['nombre'];
    $tipo = $_POST['tipo'];
    $precio = $_POST['precio'];
    $descripcion = $_POST['descripcion'];
    $cedula_cocinero = $_POST['cedula_cocinero'];
    $imagen = $_POST['imagen'];

    $stmt = $conn->prepare("UPDATE plato SET nombre=?, tipo=?, precio=?, descripcion=?, cedula_cocinero=?, imagen=? WHERE codigo_plato=?");
    $stmt->bind_param("ssdsssi", $nombre, $tipo, $precio, $descripcion, $cedula_cocinero, $imagen, $codigo);
    $stmt->execute();
}

// Habilitar/Deshabilitar plato
if (isset($_GET['toggle'])) {
    $codigo = intval($_GET['toggle']);
    $p = $conn->query("SELECT disponible FROM plato WHERE codigo_plato = $codigo")->fetch_assoc();
    $nuevoEstado = $p['disponible'] ? 0 : 1;
    $conn->query("UPDATE plato SET disponible = $nuevoEstado WHERE codigo_plato = $codigo");
}

// Eliminar plato
if (isset($_GET['eliminar'])) {
    $codigo = intval($_GET['eliminar']);
    $conn->query("DELETE FROM plato WHERE codigo_plato = $codigo");
}

// Obtener todos los platos
$platos = $conn->query("SELECT * FROM plato");
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Platos - Sucursal <?= $id_sucursal ?></title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<?php include 'includes/admin_header.php'; ?>

<main class="admin-dashboard">
    <h2>Gestión de Platos - Sucursal <?= $id_sucursal ?></h2>

    <!-- Formulario Agregar/Modificar -->
    <?php if($editarPlato): ?>
        <h3>Modificar Plato</h3>
        <form method="POST" class="admin-form">
            <input type="hidden" name="codigo_plato" value="<?= $editarPlato['codigo_plato'] ?>">

            <div class="form-group">
                <label for="nombre_plato">Nombre:</label>
                <input type="text"
                       id="nombre_plato"
                       name="nombre"
                       value="<?= htmlspecialchars($editarPlato['nombre']) ?>"
                       placeholder="Nombre"
                       required>
            </div>

            <div class="form-group">
                <label for="tipo_plato">Tipo:</label>
                <input type="text"
                       id="tipo_plato"
                       name="tipo"
                       value="<?= htmlspecialchars($editarPlato['tipo']) ?>"
                       placeholder="Tipo"
                       required>
            </div>

            <div class="form-group">
                <label for="precio_plato">Precio:</label>
                <input type="number"
                       id="precio_plato"
                       name="precio"
                       step="0.01"
                       value="<?= $editarPlato['precio'] ?>"
                       placeholder="Precio"
                       required>
            </div>

            <div class="form-group">
                <label for="descripcion_plato">Descripción:</label>
                <input type="text"
                       id="descripcion_plato"
                       name="descripcion"
                       value="<?= htmlspecialchars($editarPlato['descripcion']) ?>"
                       placeholder="Descripción"
                       required>
            </div>

            <div class="form-group">
                <label for="cedula_cocinero_plato">Cédula Cocinero:</label>
                <input type="text"
                       id="cedula_cocinero_plato"
                       name="cedula_cocinero"
                       value="<?= htmlspecialchars($editarPlato['cedula_cocinero']) ?>"
                       placeholder="Cédula Cocinero"
                       required>
            </div>

            <div class="form-group">
                <label for="imagen_plato">URL Imagen:</label>
                <input type="text"
                       id="imagen_plato"
                       name="imagen"
                       value="<?= htmlspecialchars($editarPlato['imagen']) ?>"
                       placeholder="URL Imagen"
                       required>
            </div>

            <button type="submit" name="modificar">Guardar Cambios</button>
        </form>
    <?php else: ?>
        <h3>Agregar Plato</h3>
        <form method="POST" class="admin-form">

            <div class="form-group">
                <label for="nombre_plato_nuevo">Nombre:</label>
                <input type="text"
                       id="nombre_plato_nuevo"
                       name="nombre"
                       placeholder="Nombre"
                       required>
            </div>

            <div class="form-group">
                <label for="tipo_plato_nuevo">Tipo:</label>
                <input type="text"
                       id="tipo_plato_nuevo"
                       name="tipo"
                       placeholder="Tipo"
                       required>
            </div>

            <div class="form-group">
                <label for="precio_plato_nuevo">Precio:</label>
                <input type="number"
                       id="precio_plato_nuevo"
                       name="precio"
                       step="0.01"
                       placeholder="Precio"
                       required>
            </div>

            <div class="form-group">
                <label for="descripcion_plato_nuevo">Descripción:</label>
                <input type="text"
                       id="descripcion_plato_nuevo"
                       name="descripcion"
                       placeholder="Descripción"
                       required>
            </div>

            <div class="form-group">
                <label for="cedula_cocinero_nuevo">Cédula Cocinero:</label>
                <input type="text"
                       id="cedula_cocinero_nuevo"
                       name="cedula_cocinero"
                       placeholder="Cédula Cocinero"
                       required>
            </div>

            <div class="form-group">
                <label for="imagen_plato_nuevo">URL Imagen:</label>
                <input type="text"
                       id="imagen_plato_nuevo"
                       name="imagen"
                       placeholder="URL Imagen"
                       required>
            </div>

            <button type="submit" name="agregar">Agregar</button>
        </form>
    <?php endif; ?>

    <!-- Tabla de Platos -->
    <table class="admin-table">
        <thead>
            <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Tipo</th>
                <th>Precio</th>
                <th>Descripción</th>
                <th>Cocinero</th>
                <th>Imagen</th>
                <th>Disponibilidad</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <?php while($p = $platos->fetch_assoc()): ?>
                <tr>
                    <td><?= $p['codigo_plato'] ?></td>
                    <td><?= htmlspecialchars($p['nombre']) ?></td>
                    <td><?= htmlspecialchars($p['tipo']) ?></td>
                    <td><?= $p['precio'] ?></td>
                    <td><?= htmlspecialchars($p['descripcion']) ?></td>
                    <td><?= htmlspecialchars($p['cedula_cocinero']) ?></td>
                    <td><?= htmlspecialchars($p['imagen']) ?></td>
                    <td><?= $p['disponible'] ? 'Disponible' : 'No Disponible' ?></td>
                    <td>
                        <a href="admin_platos.php?id_sucursal=<?= $id_sucursal ?>&modificar=<?= $p['codigo_plato'] ?>" class="btn-modificar">Modificar</a>
                        <a href="admin_platos.php?id_sucursal=<?= $id_sucursal ?>&toggle=<?= $p['codigo_plato'] ?>" class="btn-disponibilidad">
                            <?= $p['disponible'] ? 'Deshabilitar' : 'Habilitar' ?>
                        </a>
                        <a href="admin_platos.php?id_sucursal=<?= $id_sucursal ?>&eliminar=<?= $p['codigo_plato'] ?>" class="btn-eliminar">Eliminar</a>
                    </td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</main>
</body>
</html>
