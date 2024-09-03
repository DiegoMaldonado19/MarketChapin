<?php
class UserInventory {
    public $user_cui;
    public $product_id;

    public function __construct($user_cui, $product_id) {
        $this->user_cui = $user_cui;
        $this->product_id = $product_id;
    }

    public static function getAll($conn) {
        $sql = "SELECT * FROM user_inventory";
        $result = $conn->query($sql);
        return $result->fetch_all(MYSQLI_ASSOC);
    }
}
?>