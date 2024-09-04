<?php

class DatabaseConnection {
  private  $host = "localhost";
  private  $username = "root";
  private  $password = "";
  private  $database = "market_chapin";
  private $connection;
  private static $instance = null;

  
  public function __construct() {
    $this->createConnection();
  }

  private function createConnection() {
    try {
        $this->connection = new PDO(
            "mysql:host=$this->host;dbname=$this->database", 
            $this->username, 
            $this->password);
        $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $exception) {
        die("Connection failed: " . $exception->getMessage());
    }
  }

  public static function getInstance() {
    if (self::$instance === null) {
      self::$instance = new self();
    }

    return self::$instance;
  }

  public function getConnection() {
    return $this->connection;
  }
}