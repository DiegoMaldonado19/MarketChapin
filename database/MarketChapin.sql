CREATE DATABASE market_chapin;

USE market_chapin;

CREATE TABLE user_role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25) NOT NULL UNIQUE
);

CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE shipping_company (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) NOT NULL
);

CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    available BOOLEAN,
    interchangeable BOOLEAN,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE user (
    cui VARCHAR(13) PRIMARY KEY UNIQUE,
    username VARCHAR(25) NOT NULL UNIQUE,
    email VARCHAR(25) NOT NULL UNIQUE,
    name VARCHAR(60) NOT NULL,
    lastname VARCHAR(60) NOT NULL,
    phone VARCHAR(12),
    address TEXT,
    role_id INT,
    password VARCHAR(30) NOT NULL,
    FOREIGN KEY (role_id) REFERENCES user_role(id)
);

CREATE TABLE user_inventory (
    user_cui VARCHAR(13),
    product_id INT,
    PRIMARY KEY (user_cui, product_id),
    FOREIGN KEY (user_cui) REFERENCES user(cui),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE post (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_cui VARCHAR(13),
    description TEXT,
    product_id INT,
    date DATE,
    state BOOLEAN,
    FOREIGN KEY (user_cui) REFERENCES user(cui),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE post_details (
    post_id INT,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(30),
    PRIMARY KEY (post_id),
    FOREIGN KEY (post_id) REFERENCES post(id)
);

CREATE TABLE offer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_cui VARCHAR(13),
    description TEXT,
    state BOOLEAN,
    date DATE,
    FOREIGN KEY (user_cui) REFERENCES user(cui)
);

CREATE TABLE offer_details (
    offer_id INT,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(30),
    PRIMARY KEY (offer_id),
    FOREIGN KEY (offer_id) REFERENCES offer(id)
);

CREATE TABLE trade (
    post_id INT,
    offer_id INT,
    date DATE,
    PRIMARY KEY (post_id, offer_id),
    FOREIGN KEY (post_id) REFERENCES post(id),
    FOREIGN KEY (offer_id) REFERENCES offer(id)
);

CREATE TABLE shipping (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    departure_date DATE,
    delivery_date DATE,
    trade_post_id INT,
    trade_offer_id INT,
    receptor_id VARCHAR(13),
    sender_id VARCHAR(13),
    shipping_company_id INT,
    FOREIGN KEY (trade_post_id, trade_offer_id) REFERENCES trade(post_id, offer_id),
    FOREIGN KEY (receptor_id) REFERENCES user(cui),
    FOREIGN KEY (sender_id) REFERENCES user(cui),
    FOREIGN KEY (shipping_company_id) REFERENCES shipping_company(id)
);