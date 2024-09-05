USE market_chapin;

-- Llenar la tabla user_role
INSERT INTO user_role (name) VALUES ('Administrador'), ('Usuario'), ('Soporte');

-- Llenar la tabla category
INSERT INTO category (name) VALUES ('Electrónica'), ('Ropa'), ('Hogar'), ('Juguetes'), ('Libros');

-- Llenar la tabla shipping_company
INSERT INTO shipping_company (name) VALUES ('DHL'), ('FedEx'), ('UPS'), ('Correos de Guatemala'), ('Amazon Logistics');

-- Llenar la tabla product
INSERT INTO product (name, description, price, available, interchangeable, category_id) VALUES
('Laptop', 'Laptop de alta gama', 1200.00, TRUE, FALSE, 1),
('Camiseta', 'Camiseta de algodón', 15.00, TRUE, TRUE, 2),
('Sofá', 'Sofá de 3 plazas', 300.00, TRUE, FALSE, 3),
('Muñeca', 'Muñeca de trapo', 25.00, TRUE, TRUE, 4),
('Libro de cocina', 'Libro de recetas', 20.00, TRUE, FALSE, 5);

-- Llenar la tabla user
INSERT INTO user (cui, username, email, name, lastname, phone, address, role_id, password) VALUES
('1234567890123', 'admin', 'admin@example.com', 'Admin', 'User', '12345678', '123 Admin St', 1, 'adminpass'),
('2345678901234', 'user1', 'user1@example.com', 'User', 'One', '23456789', '456 User St', 2, 'user1pass'),
('3456789012345', 'user2', 'user2@example.com', 'User', 'Two', '34567890', '789 User St', 2, 'user2pass'),
('4567890123456', 'support1', 'support1@example.com', 'Support', 'One', '45678901', '101 Support St', 3, 'support1pass'),
('5678901234567', 'support2', 'support2@example.com', 'Support', 'Two', '56789012', '202 Support St', 3, 'support2pass');

-- Llenar la tabla user_inventory
INSERT INTO user_inventory (user_cui, product_id) VALUES
('2345678901234', 1),
('2345678901234', 2),
('3456789012345', 3),
('3456789012345', 4),
('4567890123456', 5);

-- Llenar la tabla post
INSERT INTO post (user_cui, description, product_id, date, state) VALUES
('2345678901234', 'Vendo laptop en buen estado', 1, '2024-09-01', TRUE),
('2345678901234', 'Camiseta nueva sin uso', 2, '2024-09-02', TRUE),
('3456789012345', 'Sofá cómodo y moderno', 3, '2024-09-03', TRUE),
('3456789012345', 'Muñeca de colección', 4, '2024-09-04', TRUE),
('4567890123456', 'Libro de cocina con recetas únicas', 5, '2024-09-05', TRUE);

-- Llenar la tabla post_details
INSERT INTO post_details (post_id, amount, payment_method) VALUES
(1, 1200.00, 'Tarjeta de crédito'),
(2, 15.00, 'Efectivo'),
(3, 300.00, 'Transferencia bancaria'),
(4, 25.00, 'PayPal'),
(5, 20.00, 'Tarjeta de débito');

-- Llenar la tabla offer
INSERT INTO offer (user_cui, description, state, date) VALUES
('2345678901234', 'Ofrezco 1100 por la laptop', TRUE, '2024-09-01'),
('2345678901234', 'Ofrezco 10 por la camiseta', TRUE, '2024-09-02'),
('3456789012345', 'Ofrezco 250 por el sofá', TRUE, '2024-09-03'),
('3456789012345', 'Ofrezco 20 por la muñeca', TRUE, '2024-09-04'),
('4567890123456', 'Ofrezco 15 por el libro de cocina', TRUE, '2024-09-05');

-- Llenar la tabla offer_details
INSERT INTO offer_details (offer_id, amount, payment_method) VALUES
(1, 1100.00, 'Tarjeta de crédito'),
(2, 10.00, 'Efectivo'),
(3, 250.00, 'Transferencia bancaria'),
(4, 20.00, 'PayPal'),
(5, 15.00, 'Tarjeta de débito');

-- Llenar la tabla trade
INSERT INTO trade (post_id, offer_id, date) VALUES
(1, 1, '2024-09-01'),
(2, 2, '2024-09-02'),
(3, 3, '2024-09-03'),
(4, 4, '2024-09-04'),
(5, 5, '2024-09-05');

-- Llenar la tabla shipping
INSERT INTO shipping (date, departure_date, delivery_date, trade_post_id, trade_offer_id, receptor_id, sender_id, shipping_company_id) VALUES
('2024-09-01', '2024-09-02', '2024-09-03', 1, 1, '2345678901234', '3456789012345', 1),
('2024-09-02', '2024-09-03', '2024-09-04', 2, 2, '2345678901234', '3456789012345', 2),
('2024-09-03', '2024-09-04', '2024-09-05', 3, 3, '3456789012345', '4567890123456', 3),
('2024-09-04', '2024-09-05', '2024-09-06', 4, 4, '3456789012345', '4567890123456', 4),
('2024-09-05', '2024-09-06', '2024-09-07', 5, 5, '4567890123456', '5678901234567', 5);
