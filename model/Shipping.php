<?php
class Shipping {
    public $id;
    public $date;
    public $departure_date;
    public $delivery_date;
    public $trade_post_id;
    public $trade_offer_id;
    public $receptor_id;
    public $sender_id;
    public $shipping_company_id;

    public function __construct($id, $date, $departure_date, $delivery_date, $trade_post_id, $trade_offer_id, $receptor_id, $sender_id, $shipping_company_id) {
        $this->id = $id;
        $this->date = $date;
        $this->departure_date = $departure_date;
        $this->delivery_date = $delivery_date;
        $this->trade_post_id = $trade_post_id;
        $this->trade_offer_id = $trade_offer_id;
        $this->receptor_id = $receptor_id;
        $this->sender_id = $sender_id;
        $this->shipping_company_id = $shipping_company_id;
    }

    public static function getAll($conn) {
        $sql = "SELECT * FROM shipping";
        $result = $conn->query($sql);
        return $result->fetch_all(MYSQLI_ASSOC);
    }
}
?>