<?php
// Incluir el archivo de la clase Post
include '../model/Post.php';
require_once '../database/Database.php';

$database = Database::getInstance();
$conn = $database->getConnection();

$sql = "SELECT * FROM post";
$result = $conn->query($sql);

$posts = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {

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

$conn->close();

header('Content-Type: application/json');
echo json_encode($posts);
?>
