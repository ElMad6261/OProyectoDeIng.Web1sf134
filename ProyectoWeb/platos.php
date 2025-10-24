<?php
include 'config.php';
include 'includes/header.php';

// Obtener sucursal seleccionada desde GET
$id_sucursal = isset($_GET['id_sucursal']) ? $_GET['id_sucursal'] : '';

// Obtener tipo seleccionado
$tipo = isset($_GET['tipo']) ? $_GET['tipo'] : '';
?>

<h2 style="text-align:center; margin-bottom:20px;">Todos los Platos Disponibles</h2>

<!-- Filtro por tipo -->
<form method="GET" action="platos.php" style="margin-bottom:20px; text-align:center;">
    
    <!-- Mantener la sucursal seleccionada -->
    <?php if($id_sucursal != ''): ?>
        <input type="hidden" name="id_sucursal" value="<?php echo $id_sucursal; ?>">
    <?php endif; ?>

    <label for="tipo"><strong>Filtrar por tipo:</strong></label>
    <select name="tipo" id="tipo" onchange="this.form.submit()" style="padding:6px; border-radius:5px;">
        <option value="" <?php if($tipo=='') echo 'selected'; ?>>Todos</option>
        <option value="Principal" <?php if($tipo=='Principal') echo 'selected'; ?>>Principal</option>
        <option value="Entrada" <?php if($tipo=='Entrada') echo 'selected'; ?>>Entrada</option>
        <option value="Postre" <?php if($tipo=='Postre') echo 'selected'; ?>>Postre</option>
    </select>
</form>

<div class="platos-container">
<?php

// Consulta base filtrada por sucursal usando OFRECE
if ($id_sucursal != '') {
    $sql = "SELECT p.codigo_plato, p.nombre, p.descripcion, p.precio, p.imagen, p.tipo
            FROM Plato p
            INNER JOIN ofrece o ON p.codigo_plato = o.codigo_plato
            WHERE o.id_sucursal = ".$conn->real_escape_string($id_sucursal);
} else {
    $sql = "SELECT * FROM Plato WHERE 1=1"; // 1=1 para permitir agregar condiciones fácilmente
}

// Aplicar filtro por tipo si se seleccionó
if ($tipo != '') {
    $sql .= " AND p.tipo = '".$conn->real_escape_string($tipo)."'";
}

$sql .= " ORDER BY p.nombre ASC";

$result = $conn->query($sql);

// Mostrar platos
$result = $conn->query($sql);

if($result && $result->num_rows > 0){
    while($plato = $result->fetch_assoc()){
        echo "<div class='plato' data-codigo='{$plato['codigo_plato']}'>";
        echo "<img src='{$plato['imagen']}' alt='Imagen del plato'>";
        echo "<h4>{$plato['nombre']}</h4>";
        echo "<p><b>Tipo:</b> {$plato['tipo']}</p>";
        echo "<p><b>Precio:</b> $ {$plato['precio']}</p>";
        echo "</div>";
    }
} else {
    echo "<p style='text-align:center;'>No hay platos disponibles.</p>";
}

include 'includes/footer.php';