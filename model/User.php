<?php
class User
{
    public $cui;
    public $username;
    public $email;
    public $name;
    public $lastname;
    public $phone;
    public $address;
    public $role_id;
    public $password;

    public function __construct($cui, $username, $email, $name, $lastname, $phone, $address, $role_id, $password)
    {
        $this->cui = $cui;
        $this->username = $username;
        $this->email = $email;
        $this->name = $name;
        $this->lastname = $lastname;
        $this->phone = $phone;
        $this->address = $address;
        $this->role_id = $role_id;
        $this->password = $password;
    }
}
?>