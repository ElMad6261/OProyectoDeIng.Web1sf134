<?php
include 'config.php';

// 1️⃣ Verificar que exista el parámetro
if(!isset($_GET['codigo_plato'])) {
    echo "<p style='color:red;'>Error: No se proporcionó el código del plato.</p>";
    exit;
}

// 2️⃣ Validar que sea un número entero
$codigo = (int)$_GET['codigo_plato'];
if($codigo <= 0) {
    echo "<p style='color:red;'>Error: Código de plato inválido.</p>";
    exit;
}

// 3️⃣ Ejecutar la consulta
$result = $conn->query("SELECT * FROM Plato WHERE codigo_plato = $codigo");

if(!$result) {
    echo "<p style='color:red;'>Error en la consulta: " . $conn->error . "</p>";
    exit;
}

// 4️⃣ Verificar si se encontró el plato
$plato = $result->fetch_assoc();

if(!$plato) {
    echo "<p style='color:red;'>Plato no encontrado en la base de datos.</p>";
    exit;
}

// 5️⃣ Mostrar información del plato
?>
<h2><?= htmlspecialchars($plato['nombre']) ?></h2>
<img src="<?= htmlspecialchars($plato['imagen']) ?>" alt="<?= htmlspecialchars($plato['nombre']) ?>" style="width:200px;height:200px;border-radius:10px;object-fit:cover;">
<p><b>Tipo:</b> <?= htmlspecialchars($plato['tipo']) ?></p>
<p><b>Descripción:</b> <?= htmlspecialchars($plato['descripcion']) ?></p>
<p><b>Precio:</b> $ <?= $plato['precio'] ?></p>