<?php

include '../model/Offer.php';
require_once '../database/DatabaseConnection.php';

$database = DatabaseConnection::getInstance();
$conn = $database->getConnection();

$sql = "SELECT * FROM offer";
$result = $conn->query($sql);

$offers = array();

if ($result->rowCount() > 0) {
    while($row = $result->fetch(PDO::FETCH_ASSOC)) {

        $offer = new Offer(
            $row['id'],
            $row['user_cui'],
            $row['description'],
            $row['state'],
            $row['date']
        );

        $offers[] = $offer;
    }
}

header('Content-Type: application/json');
echo json_encode($offers);
?>
<?php
