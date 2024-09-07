<?php
require_once '../database/DatabaseConnection.php';
include '../model/Category.php';

set_exception_handler(function ($e) {
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

    $name = $_POST["name"];

    try {
        $db_connection->beginTransaction();

        $stmt = $db_connection->prepare(" INSERT INTO category (name) VALUES (
            :name
        )");

        $stmt->bindParam(':name', $name);

        if ($stmt->execute()) {
            $db_connection->commit();
            header('Content-Type: application/json');
            echo json_encode(array("success" => true, "message" => "Categoria creada exitosamente."));
        } else {

            $db_connection->rollBack();
            header('Content-Type: application/json');
            echo json_encode(array("success" => false, "message" => "Error al crear oferta"));
        }
    } catch (PDOException $e) {

        $db_connection->rollBack();
        error_log('Error de inserción: ' . $e->getMessage());
        header('Content-Type: application/json');
        echo json_encode(array("success" => false, "message" => "Error al crear oferta: " . $e->getMessage()));
    }
}
?>
