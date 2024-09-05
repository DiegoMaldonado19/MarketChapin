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
}
?>