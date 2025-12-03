<?php
// (Opcional mientras depuras: muestra errores)
// ini_set('display_errors', 1);
// ini_set('display_startup_errors', 1);
// error_reporting(E_ALL);

session_start();
include 'config.php';
include 'includes/header.php';

// Obtener id de sucursal (desde GET o sesión)
$id_sucursal = isset($_GET['id_sucursal'])
    ? (int) $_GET['id_sucursal']
    : (isset($_SESSION['id_sucursal']) ? (int) $_SESSION['id_sucursal'] : null);

// Guardar en sesión para mantener la selección
if ($id_sucursal) {
    $_SESSION['id_sucursal'] = $id_sucursal;
}
?>

<div class="container">
    <?php if ($id_sucursal): ?>
        <?php
        // Tabla 'sucursal' en minúsculas
        $sqlSucursal = "SELECT * FROM sucursal WHERE id_sucursal = $id_sucursal";
        $resSucursal = $conn->query($sqlSucursal);

        $sucursal = $resSucursal ? $resSucursal->fetch_assoc() : null;

        if ($sucursal):
        ?>
            <h2><?= htmlspecialchars($sucursal['nombre']) ?></h2>
            <p><b>Dirección:</b> <?= htmlspecialchars($sucursal['direccion']) ?></p>
            <p><b>Email:</b> <?= htmlspecialchars($sucursal['email']) ?></p>

            <h3>Platos destacados:</h3>
            <div class="platos">
                <?php
                // Tablas 'plato' y 'ofrece' en minúsculas
                $sqlPlatos = "
                    SELECT p.* 
                    FROM plato p
                    JOIN ofrece o ON p.codigo_plato = o.codigo_plato
                    WHERE o.id_sucursal = $id_sucursal
                      AND p.disponible = 1
                    ORDER BY RAND() 
                    LIMIT 8
                ";

                $platos = $conn->query($sqlPlatos);

                // Si quieres ver errores mientras pruebas, descomenta las líneas de arriba de error_reporting
                if ($platos):
                    while ($plato = $platos->fetch_assoc()):
                ?>
                        <div class="plato" data-codigo="<?= $plato['codigo_plato'] ?>">
                            <img src="<?= htmlspecialchars($plato['imagen']) ?>" alt="<?= htmlspecialchars($plato['nombre']) ?>">
                            <h4><?= htmlspecialchars($plato['nombre']) ?></h4>
                            <p><b>Tipo:</b> <?= htmlspecialchars($plato['tipo']) ?></p>
                            <p><b>Precio:</b> $<?= number_format($plato['precio'], 2) ?></p>
                        </div>
                <?php
                    endwhile;
                else:
                    echo "<p>No se pudieron cargar los platos.</p>";
                endif;
                ?>
            </div>

        <?php else: ?>
            <p style="text-align:center;">Sucursal no encontrada.</p>
        <?php endif; ?>

    <?php else: ?>
        <p style="text-align:center;">Seleccione una sucursal para ver información y platos.</p>
    <?php endif; ?>

    <!-- Sección de órdenes para usuario logueado -->
    <?php if (isset($_SESSION['id_usuario'])): ?>
        <h3>Mis Órdenes:</h3>
        <?php
        $id_usuario = (int) $_SESSION['id_usuario'];

        // Tabla 'orden' en minúsculas y 'sucursal' en minúsculas
        $sqlOrdenes = "
            SELECT o.*, s.nombre AS sucursal 
            FROM orden o 
            JOIN sucursal s ON o.id_sucursal = s.id_sucursal
            WHERE o.id_usuario = $id_usuario
            ORDER BY o.fecha DESC
        ";

        $ordenes = $conn->query($sqlOrdenes);

        if ($ordenes && $ordenes->num_rows > 0):
            while ($orden = $ordenes->fetch_assoc()):
        ?>
                <div class="orden">
                    <p><b>Sucursal:</b> <?= htmlspecialchars($orden['sucursal']) ?></p>
                    <p><b>Detalle:</b> <?= htmlspecialchars($orden['nota'] ?? $orden['detalle'] ?? '') ?></p>
                    <p><b>Fecha:</b> <?= $orden['fecha'] ?></p>
                    <p><b>Estado:</b> <?= htmlspecialchars($orden['estado']) ?></p>
                </div>
        <?php
            endwhile;
        else:
            echo "<p>No tienes órdenes aún.</p>";
        endif;
        ?>
    <?php endif; ?>
</div>

<?php
include 'includes/footer.php';
?>
