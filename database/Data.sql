USE market_chapin;

INSERT INTO user_role (name) VALUES ('Administrador'), ('Usuario'), ('Soporte');

INSERT INTO category (name) VALUES ('Electrónica'), ('Hogar'), ('Ropa'), ('Juguetes'), ('Libros');

INSERT INTO shipping_company (name) VALUES ('DHL'), ('FedEx'), ('UPS'), ('Cargo Expreso'), ('Guatex');

INSERT INTO product (name, description, price, available, interchangeable, category_id) VALUES
('Laptop', 'Laptop de alta gama', 5000.00, TRUE, FALSE, 1),
('Sofá', 'Sofá de cuero', 1500.00, TRUE, TRUE, 2),
('Camiseta', 'Camiseta de algodón', 100.00, TRUE, TRUE, 3),
('Lego', 'Set de construcción Lego', 300.00, TRUE, FALSE, 4),
('Libro de cocina', 'Libro con recetas internacionales', 200.00, TRUE, TRUE, 5);

INSERT INTO user (cui, username, email, name, lastname, phone, address, role_id, password) VALUES
(123456789, 'admin', 'admin@example.com', 'Juan', 'Pérez', '12345678', 'Ciudad de Guatemala', 1, 'admin123'),
(987654321, 'usuario1', 'usuario1@example.com', 'María', 'González', '87654321', 'Quetzaltenango', 2, 'usuario123'),
(456789123, 'soporte1', 'soporte1@example.com', 'Carlos', 'López', '56789123', 'Antigua Guatemala', 3, 'soporte123'),
(789123456, 'usuario2', 'usuario2@example.com', 'Ana', 'Martínez', '78912345', 'Escuintla', 2, 'usuario456'),
(321654987, 'usuario3', 'usuario3@example.com', 'Luis', 'Ramírez', '32165498', 'Huehuetenango', 2, 'usuario789');

INSERT INTO user_inventory (user_cui, product_id) VALUES
(123456789, 1),
(987654321, 2),
(456789123, 3),
(789123456, 4),
(321654987, 5);

INSERT INTO post (user_cui, description, product_id, date, state) VALUES
(123456789, 'Vendo laptop nueva', 1, '2024-09-01', TRUE),
(987654321, 'Sofá en buen estado', 2, '2024-09-02', TRUE),
(456789123, 'Camiseta casi nueva', 3, '2024-09-03', TRUE),
(789123456, 'Set de Lego completo', 4, '2024-09-04', TRUE),
(321654987, 'Libro de cocina usado', 5, '2024-09-05', TRUE);

INSERT INTO post_details (post_id, amount, payment_method) VALUES
(1, 5000.00, 'Tarjeta de Crédito'),
(2, 1500.00, 'Efectivo'),
(3, 100.00, 'Transferencia Bancaria'),
(4, 300.00, 'Tarjeta de Débito'),
(5, 200.00, 'PayPal');

INSERT INTO offer (user_cui, description, state, date) VALUES
(987654321, 'Interesado en la laptop', TRUE, '2024-09-06'),
(456789123, 'Quiero comprar el sofá', TRUE, '2024-09-07'),
(789123456, 'Me interesa la camiseta', TRUE, '2024-09-08'),
(321654987, 'Quiero el set de Lego', TRUE, '2024-09-09'),
(123456789, 'Interesado en el libro de cocina', TRUE, '2024-09-10');

INSERT INTO offer_details (offer_id, amount, payment_method) VALUES
(1, 5000.00, 'Tarjeta de Crédito'),
(2, 1500.00, 'Efectivo'),
(3, 100.00, 'Transferencia Bancaria'),
(4, 300.00, 'Tarjeta de Débito'),
(5, 200.00, 'PayPal');

INSERT INTO trade (post_id, offer_id, date) VALUES
(1, 1, '2024-09-11'),
(2, 2, '2024-09-12'),
(3, 3, '2024-09-13'),
(4, 4, '2024-09-14'),
(5, 5, '2024-09-15');

INSERT INTO shipping (date, departure_date, delivery_date, trade_post_id, trade_offer_id, receptor_id, sender_id, shipping_company_id) VALUES
('2024-09-16', '2024-09-17', '2024-09-18', 1, 1, 987654321, 123456789, 1),
('2024-09-19', '2024-09-20', '2024-09-21', 2, 2, 456789123, 987654321, 2),
('2024-09-22', '2024-09-23', '2024-09-24', 3, 3, 789123456, 456789123, 3),
('2024-09-25', '2024-09-26', '2024-09-27', 4, 4, 321654987, 789123456, 4),
('2024-09-28', '2024-09-29', '2024-09-30', 5, 5, 123456789, 321654987, 5);