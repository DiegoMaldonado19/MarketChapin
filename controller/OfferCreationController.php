<?php
require_once '../database/DatabaseConnection.php';
include '../model/Offer.php';

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

    $user_cui = $_POST["user_cui"];
    $description = $_POST["description"];
    $date = $_POST["date"];
    $amount = $_POST["amount"];
    $payment_method = $_POST["payment_method"];

    try {
        $db_connection->beginTransaction();

        $stmt_product = $db_connection->prepare(" INSERT INTO offer (user_cui, description, state, date) VALUES (
            :user_cui, :description, 1, :date
        )");

        $stmt_product->bindParam(':user_cui', $user_cui);
        $stmt_product->bindParam(':description', $description);
        $stmt_product->bindParam(':date', $date);

        if ($stmt_product->execute()) {

            $offer_id = $db_connection->lastInsertId();

            $stmt_detail = $db_connection->prepare("INSERT INTO offer_details (offer_id, amount, payment_method) VALUES (
            :offer_id, :amount, :payment_method
            )");

            $stmt_detail->bindParam(':offer_id', $offer_id);
            $stmt_detail->bindParam(':amount', $amount);
            $stmt_detail->bindParam(':payment_method', $payment_method);

            if ($stmt_detail->execute()) {
                $db_connection->commit();
                header('Content-Type: application/json');
                echo json_encode(array("success" => true, "message" => "Oferta creada exitosamente."));
            } else {

                $db_connection->rollBack();
                header('Content-Type: application/json');
                echo json_encode(array("success" => false, "message" => "Error al crear oferta"));
            }
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
