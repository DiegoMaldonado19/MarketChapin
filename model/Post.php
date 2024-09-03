<?php
class Post {
    public $id;
    public $user_cui;
    public $description;
    public $product_id;
    public $date;
    public $state;

    public function __construct($id, $user_cui, $description, $product_id, $date, $state) {
        $this->id = $id;
        $this->user_cui = $user_cui;
        $this->description = $description;
        $this->product_id = $product_id;
        $this->date = $date;
        $this->state = $state;
    }

    public static function getAll($conn) {
        $sql = "SELECT * FROM post";
        $result = $conn->query($sql);
        return $result->fetch_all(MYSQLI_ASSOC);
    }
}
?>