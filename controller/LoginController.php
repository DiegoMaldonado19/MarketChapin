<?php
require_once '../database/Database.php';
include '../model/user.php';

$db_instance = DatabaseConnection::getInstance();
$db_connection = $db_instance->getConnection();
$user = new User($db_connection);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $hash = password_hash($password, PASSWORD_DEFAULT);

    $isAuthenticated = $user->authenticate($username, $password);
    if($isAuthenticated) {
        session_start(); // Start or resume the session
        $_SESSION['username'] = $username;
        $response = ['success' => true, 'redirect' => '../view/index.html/'];
    } else {
        $response = ['success' => false, 'message' => 'Authentication fallida'];
    }
   
    header('Content-Type: application/json');
    echo json_encode($response);
    exit;
}
?>