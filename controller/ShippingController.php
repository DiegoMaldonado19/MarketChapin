<?php

include '../model/Shipping.php';
require_once '../database/DatabaseConnection.php';

$database = DatabaseConnection::getInstance();
$conn = $database->getConnection();

$sql = "SELECT * FROM shipping";
$result = $conn->query($sql);

$shippings = array();

if ($result->rowCount() > 0) {
    while($row = $result->fetch(PDO::FETCH_ASSOC)) {

        $shipping = new Shipping(
            $row['id'],
            $row['date'],
            $row['departure_date'],
            $row['delivery_date'],
            $row['trade_post_id'],
            $row['trade_offer_id'],
            $row['receptor_id'],
            $row['sender_id'],
            $row['shipping_company_id']
        );

        $shippings[] = $shipping;
    }
}

header('Content-Type: application/json');
echo json_encode($shippings);
?>