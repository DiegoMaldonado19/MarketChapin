<?php
class Trade {
    public $post_id;
    public $offer_id;
    public $date;

    public function __construct($post_id, $offer_id, $date) {
        $this->post_id = $post_id;
        $this->offer_id = $offer_id;
        $this->date = $date;
    }

    public static function getAll($conn) {
        $sql = "SELECT * FROM trade";
        $result = $conn->query($sql);
        return $result->fetch_all(MYSQLI_ASSOC);
    }
}
?>