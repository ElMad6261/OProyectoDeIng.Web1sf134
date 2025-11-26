<?php
// Datos de conexión
$servername = "localhost";   // Normalmente localhost
$username = "root";          // Usuario por defecto
$password = "";              // Contraseña por defecto
$dbname = "restaurante";     // Nombre de tu base de datos

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Si quieres, puedes establecer la codificación a UTF-8
$conn->set_charset("utf8");
?>