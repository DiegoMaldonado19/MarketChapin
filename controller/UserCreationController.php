<?php

require_once '../database/DatabaseConnection.php';
include '../model/User.php';

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

    $cui = $_POST["cui"];
    $username = $_POST["username"];
    $email = $_POST["email"];
    $name = $_POST["name"];
    $lastname = $_POST["lastname"];
    $phone = $_POST["phone"];
    $address = $_POST["address"];
    $password = $_POST["password"];

    try {
        $stmt = $db_connection->prepare("INSERT INTO user (cui, username, email, name, lastname, phone, address, role_id, password) VALUES (
            :cui, :username, :email, :name, :lastname, :phone, :address, 2, :password
        )");

        $stmt->bindParam(':cui', $cui);
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':lastname', $lastname);
        $stmt->bindParam(':phone', $phone);
        $stmt->bindParam(':address', $address);
        $stmt->bindParam(':password', $password);

        if ($stmt->execute()) {
            header('Content-Type: application/json');
            echo json_encode(array("success" => true, "message" => "Usuario creado exitosamente."));
        } else {
            header('Content-Type: application/json');
            echo json_encode(array("success" => false, "message" => "Error al crear el usuario."));
        }
    } catch (PDOException $e) {
        error_log('Error de inserción: ' . $e->getMessage());
        header('Content-Type: application/json');
        echo json_encode(array("success" => false, "message" => "Error al crear el usuario: " . $e->getMessage()));
    }
}
?>
