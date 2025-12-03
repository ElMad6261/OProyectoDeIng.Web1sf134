<?php
// Datos de conexión
$servername = "sql100.infinityfree.com";   // Normalmente localhost
$username = "if0_40495384";          // Usuario por defecto
$password = "RestauranteHou";              // Contraseña por defecto
$dbname = "if0_40495384_restaurante";     // Nombre de tu base de datos

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Si quieres, puedes establecer la codificación a UTF-8
$conn->set_charset("utf8");
?>