<?php

include '../model/Post.php';
require_once '../database/DatabaseConnection.php';

$database = DatabaseConnection::getInstance();
$conn = $database->getConnection();

$sql = "SELECT * FROM post";
$result = $conn->query($sql);

$posts = array();

if ($result->rowCount() > 0) {
    while($row = $result->fetch(PDO::FETCH_ASSOC)) {

        $post = new Post(
            $row['id'],
            $row['user_cui'],
            $row['description'],
            $row['product_id'],
            $row['date'],
            $row['state']
        );

        $posts[] = $post;
    }
}

header('Content-Type: application/json');
echo json_encode($posts);
?>
