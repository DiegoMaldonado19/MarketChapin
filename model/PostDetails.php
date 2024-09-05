<?php
class PostDetails {
    public $post_id;
    public $amount;
    public $payment_method;

    public function __construct($post_id, $amount, $payment_method) {
        $this->post_id = $post_id;
        $this->amount = $amount;
        $this->payment_method = $payment_method;
    }
}
?>