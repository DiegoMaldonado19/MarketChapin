<?php

include '../model/Category.php';
require_once '../database/DatabaseConnection.php';

$database = DatabaseConnection::getInstance();
$conn = $database->getConnection();

$sql = "SELECT * FROM category";
$result = $conn->query($sql);

$categories = array();

if ($result->rowCount() > 0) {
    while($row = $result->fetch(PDO::FETCH_ASSOC)) {

        $category = new Category(
            $row['id'],
            $row['name']
        );

        $categories[] = $category;
    }
}

header('Content-Type: application/json');
echo json_encode($categories);
?>
