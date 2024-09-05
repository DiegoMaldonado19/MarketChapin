<?php
session_start();

header('Content-Type: application/json');

if (isset($_SESSION['username'])) {
    $response = array(
        "authenticated" => true,
        "username" => $_SESSION['username']
    );
} else {
    $response = array("authenticated" => false);
}

echo json_encode($response);
?>
