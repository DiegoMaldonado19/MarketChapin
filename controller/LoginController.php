<?php

require_once '../database/DatabaseConnection.php';
include '../model/user.php';

set_exception_handler(function($e) {
    error_log('Error no manejado: ' . $e->getMessage());
    header('Content-Type: application/json');
    echo json_encode(array("success" => false, "message" => "Error interno del servidor."));
    exit();
});

try {
    $db_instance = DatabaseConnection::getInstance();
    $db_connection = $db_instance->getConnection();
} catch (Exception $e) {
    error_log('Error de conexión: ' . $e->getMessage());
    header('Content-Type: application/json');
    echo json_encode(array("success" => false, "message" => "Error de conexión a la base de datos."));
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    $stmt = $db_connection->prepare("SELECT * FROM user WHERE username = :username AND password = :password");
    $stmt->bindParam(':username', $username);
    $stmt->bindParam(':password', $password);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        session_start();
        $_SESSION['user_cui'] = $user['cui'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['name'] = $user['name'];
        $_SESSION['lastname'] = $user['lastname'];
        $_SESSION['email'] = $user['email'];
        $_SESSION['phone'] = $user['phone'];
        $_SESSION['address'] = $user['address'];


        $response = array("success" => true, "message" => "Inicio de sesión exitoso.");
    } else {
        $response = array("success" => false, "message" => "Credenciales incorrectas. Por favor, inténtalo de nuevo.");
    }

    header('Content-Type: application/json');
    echo json_encode($response);
}
?>
