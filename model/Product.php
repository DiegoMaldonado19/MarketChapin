<?php
class Product {
    public $id;
    public $name;
    public $description;
    public $price;
    public $available;
    public $interchangeable;
    public $category_id;

    public function __construct($id, $name, $description, $price, $available, $interchangeable, $category_id) {
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
        $this->price = $price;
        $this->available = $available;
        $this->interchangeable = $interchangeable;
        $this->category_id = $category_id;
    }
}
?>