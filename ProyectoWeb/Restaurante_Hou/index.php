<?php
session_start();
include 'config.php';
include 'includes/header.php';

// Obtener id de sucursal si viene por GET
$id_sucursal = isset($_GET['id_sucursal']) ? (int)$_GET['id_sucursal'] : null;
?>

<div class="container">
    <?php if($id_sucursal): ?>
        <?php
        $sucursal = $conn->query("SELECT * FROM Sucursal WHERE id_sucursal = $id_sucursal")->fetch_assoc();
        if($sucursal):
        ?>
            <h2><?= htmlspecialchars($sucursal['nombre']) ?></h2>
            <p><b>Dirección:</b> <?= htmlspecialchars($sucursal['direccion']) ?></p>
            <p><b>Email:</b> <?= htmlspecialchars($sucursal['email']) ?></p>

            <h3>Platos destacados:</h3>
            <div class="platos">
                <?php
                $platos = $conn->query("SELECT p.* FROM Plato p
                        JOIN Ofrece o ON p.codigo_plato = o.codigo_plato
                        WHERE o.id_sucursal = $id_sucursal
                        AND p.disponible = 1
                        ORDER BY RAND() LIMIT 8");
                while($plato = $platos->fetch_assoc()):
                ?>
                    <div class="plato" data-codigo="<?= $plato['codigo_plato'] ?>">
                        <img src="<?= $plato['imagen'] ?>" alt="<?= htmlspecialchars($plato['nombre']) ?>">
                        <h4><?= htmlspecialchars($plato['nombre']) ?></h4>
                        <p><b>Tipo:</b> <?= htmlspecialchars($plato['tipo']) ?></p>
                        <p><b>Precio:</b> $<?= $plato['precio'] ?></p>
                    </div>
                <?php endwhile; ?>
            </div>

        <?php else: ?>
            <p style="text-align:center;">Sucursal no encontrada.</p>
        <?php endif; ?>

    <?php else: ?>
        <p style="text-align:center;">Seleccione una sucursal para ver información y platos.</p>
    <?php endif; ?>

    <!-- Sección de órdenes para usuario logueado -->
    <?php if(isset($_SESSION['id_usuario'])): ?>
        <h3>Mis Órdenes:</h3>
        <?php
        $id_usuario = $_SESSION['id_usuario'];
        $ordenes = $conn->query("SELECT o.*, s.nombre AS sucursal FROM Orden o 
                                 JOIN Sucursal s ON o.id_sucursal = s.id_sucursal
                                 WHERE o.id_usuario = $id_usuario
                                 ORDER BY o.fecha DESC");
        if($ordenes->num_rows > 0):
            while($orden = $ordenes->fetch_assoc()):
        ?>
                <div class="orden">
                    <p><b>Sucursal:</b> <?= htmlspecialchars($orden['sucursal']) ?></p>
                    <p><b>Detalle:</b> <?= htmlspecialchars($orden['detalle']) ?></p>
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