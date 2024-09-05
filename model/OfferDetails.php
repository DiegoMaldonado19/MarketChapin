<?php
class OfferDetails {
    public $offer_id;
    public $amount;
    public $payment_method;

    public function __construct($offer_id, $amount, $payment_method) {
        $this->offer_id = $offer_id;
        $this->amount = $amount;
        $this->payment_method = $payment_method;
    }
}
?>