<?php
class Offer {
    public $id;
    public $user_cui;
    public $description;
    public $state;
    public $date;

    public function __construct($id, $user_cui, $description, $state, $date) {
        $this->id = $id;
        $this->user_cui = $user_cui;
        $this->description = $description;
        $this->state = $state;
        $this->date = $date;
    }

    public static function getAll($conn) {
        $sql = "SELECT * FROM offer";
        $result = $conn->query($sql);
        return $result->fetch_all(MYSQLI_ASSOC);
    }
}
?>