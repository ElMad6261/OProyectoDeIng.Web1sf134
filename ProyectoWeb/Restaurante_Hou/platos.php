<?php
include 'config.php';
include 'includes/header.php';

// Obtener sucursal (de GET o sesión)
$id_sucursal = $_GET['id_sucursal'] ?? ($_SESSION['id_sucursal'] ?? '');
$tipo = $_GET['tipo'] ?? '';
?>

<h2 style="text-align:center; margin-bottom:20px;">Todos los Platos Disponibles</h2>

<!-- Filtro por tipo -->
<form method="GET" action="platos.php" style="margin-bottom:20px; text-align:center;">
    <?php if($id_sucursal != ''): ?>
        <input type="hidden" name="id_sucursal" value="<?php echo htmlspecialchars($id_sucursal); ?>">
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
if ($id_sucursal == '') {
    echo "<p style='text-align:center;'>Por favor seleccione una sucursal para ver los platos disponibles.</p>";
} else {
    $sql = "SELECT p.codigo_plato, p.nombre, p.descripcion, p.precio, p.imagen, p.tipo
            FROM plato p
            INNER JOIN ofrece o ON p.codigo_plato = o.codigo_plato
            WHERE o.id_sucursal = ".$conn->real_escape_string($id_sucursal)."
            AND p.disponible = 1";

    if ($tipo != '') {
        $sql .= " AND p.tipo = '".$conn->real_escape_string($tipo)."'";
    }

    $sql .= " ORDER BY p.nombre ASC";
    $result = $conn->query($sql);

    if($result && $result->num_rows > 0){
        while($plato = $result->fetch_assoc()){
            echo "<div class='plato' data-codigo='".htmlspecialchars($plato['codigo_plato'])."'>";
            echo "<img src='".htmlspecialchars($plato['imagen'])."' alt='Imagen del plato'>";
            echo "<h4>".htmlspecialchars($plato['nombre'])."</h4>";
            echo "<p><b>Tipo:</b> ".htmlspecialchars($plato['tipo'])."</p>";
            echo "<p><b>Precio:</b> $ ".number_format($plato['precio'], 2)."</p>";
            echo "</div>";
        }
    } else {
        echo "<p style='text-align:center;'>No hay platos disponibles para esta sucursal.</p>";
    }
}

include 'includes/footer.php';
?>
