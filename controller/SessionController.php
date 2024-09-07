<?php
session_start();

header('Content-Type: application/json');

if (isset($_SESSION['username'])) {
    $response = array(
        "authenticated" => true,
        "user_cui" => $_SESSION['user_cui'],
        "username" => $_SESSION['username'],
        "name" => $_SESSION['name'],
        "lastname" => $_SESSION['lastname'],
        "email" => $_SESSION['email'],
        "phone" => $_SESSION['phone'],
        "address" => $_SESSION['address']
    );
} else {
    $response = array("authenticated" => false);
}

echo json_encode($response);
?>
