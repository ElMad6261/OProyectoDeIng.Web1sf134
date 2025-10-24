<?php
include 'config.php';
include 'includes/header.php';

$id_sucursal = isset($_GET['id_sucursal']) ? $_GET['id_sucursal'] : null;

if($id_sucursal){
    // Información de la sucursal
    $sucursal = $conn->query("SELECT * FROM Sucursal WHERE id_sucursal = $id_sucursal")->fetch_assoc();
    echo "<h2>{$sucursal['nombre']}</h2>";
    echo "<p>Dirección: {$sucursal['direccion']}</p>";
    echo "<p>Email: {$sucursal['email']}</p>";

    // Mostrar algunos platos de la sucursal (por ejemplo 4 platos aleatorios)
    $platos = $conn->query("SELECT p.* FROM Plato p
                            JOIN Ofrece o ON p.codigo_plato = o.codigo_plato
                            WHERE o.id_sucursal = $id_sucursal
                            ORDER BY RAND() LIMIT 8");
    echo "<h3>Platos destacados:</h3><div class='platos'>";
    while($plato = $platos->fetch_assoc()){
        echo "<div class='plato'>";
        echo "<h4>{$plato['tipo']}: {$plato['descripcion']}</h4>";
        echo "<p>Precio: {$plato['precio']}</p>";
        echo "</div>";
    }
    echo "</div>";
}else{
    echo "<p>Seleccione una sucursal para ver información y platos.</p>";
}

include 'includes/footer.php';
?>