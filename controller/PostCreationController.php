<?php
require_once '../database/DatabaseConnection.php';
include '../model/Post.php';

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
    $product_name = $_POST["product_name"];
    $product_description = $_POST["product_description"];
    $product_price = $_POST["product_price"];
    $date = $_POST["date"];
    $amount = $_POST["product_price"];
    $payment_method = $_POST["payment_method"];

    try {
        $db_connection->beginTransaction();

        $stmt_product = $db_connection->prepare("INSERT INTO product (name, description, price, available, interchangeable, category_id) VALUES (
        :name, :description, :price, TRUE, FALSE, NULL
        )");

        $stmt_product->bindParam(':name', $product_name);
        $stmt_product->bindParam(':description', $product_description);
        $stmt_product->bindParam(':price', $product_price);

        if ($stmt_product->execute()) {

            $product_id = $db_connection->lastInsertId();

            $stmt_post = $db_connection->prepare("INSERT INTO post (user_cui, description, product_id, date, state) VALUES (
            :user_cui, :description, :product_id, :date, TRUE
            )");

            $stmt_post->bindParam(':user_cui', $user_cui);
            $stmt_post->bindParam(':description', $description);
            $stmt_post->bindParam(':product_id', $product_id);
            $stmt_post->bindParam(':date', $date);

            if ($stmt_post->execute()) {
                $post_id = $db_connection->lastInsertId();

                $stmt_post_details = $db_connection->prepare("INSERT INTO post_details (post_id, amount, payment_method) VALUES (
                :post_id, :amount, :payment_method
                )");

                $stmt_post_details->bindParam(':post_id', $post_id);
                $stmt_post_details->bindParam(':amount', $amount);
                $stmt_post_details->bindParam(':payment_method', $payment_method);

                if ($stmt_post_details->execute()) {
                    $stmt_user_inventory = $db_connection->prepare("INSERT INTO user_inventory (user_cui, product_id) VALUES (
                    :user_cui, :product_id
                    )");

                    $stmt_user_inventory->bindParam(':user_cui', $user_cui);
                    $stmt_user_inventory->bindParam(':product_id', $product_id);

                    if ($stmt_user_inventory->execute()) {
                        $db_connection->commit();
                        header('Content-Type: application/json');
                        echo json_encode(array("success" => true, "message" => "Post creado exitosamente."));
                    } else {

                        $db_connection->rollBack();
                        header('Content-Type: application/json');
                        echo json_encode(array("success" => false, "message" => "Error al crear post"));
                    }
                } else {

                    $db_connection->rollBack();
                    header('Content-Type: application/json');
                    echo json_encode(array("success" => false, "message" => "Error al crear post"));
                }
            } else {

                $db_connection->rollBack();
                header('Content-Type: application/json');
                echo json_encode(array("success" => false, "message" => "Error al crear post."));
            }
        } else {

            $db_connection->rollBack();
            header('Content-Type: application/json');
            echo json_encode(array("success" => false, "message" => "Error al crear post"));
        }
    } catch (PDOException $e) {

        $db_connection->rollBack();
        error_log('Error de inserción: ' . $e->getMessage());
        header('Content-Type: application/json');
        echo json_encode(array("success" => false, "message" => "Error al crear post: " . $e->getMessage()));
    }
}
?>
