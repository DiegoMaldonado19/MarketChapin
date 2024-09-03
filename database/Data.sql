USE market_chapin;

-- Insertar datos en user_role
INSERT INTO user_role (name) VALUES 
('Administrador'), 
('Vendedor'), 
('Comprador');

-- Insertar datos en category
INSERT INTO category (name) VALUES 
('Electrónica'), 
('Ropa'), 
('Hogar'), 
('Libros'), 
('Juguetes');

-- Insertar datos en shipping_company
INSERT INTO shipping_company (name) VALUES 
('Envíos Rápidos S.A.'), 
('Transportes Seguros'), 
('Mensajería Express');

-- Insertar datos en product
INSERT INTO product (name, description, price, available, interchangeable, category_id) VALUES 
('Teléfono Inteligente', 'Teléfono de última generación con cámara de alta resolución', 599.99, TRUE, FALSE, 1),
('Laptop', 'Computadora portátil con 16GB de RAM y 512GB SSD', 899.99, TRUE, FALSE, 1),
('Camiseta', 'Camiseta de algodón 100% en varios colores', 19.99, TRUE, TRUE, 2),
('Sofá', 'Sofá de tres plazas con tapizado de tela', 299.99, TRUE, FALSE, 3),
('Libro de Cocina', 'Recetas fáciles y rápidas para el día a día', 14.99, TRUE, TRUE, 4),
('Muñeca', 'Muñeca con ropa y accesorios', 24.99, TRUE, TRUE, 5),
('Televisor', 'Televisor 4K de 55 pulgadas', 499.99, TRUE, FALSE, 1),
('Pantalones', 'Pantalones de mezclilla para hombre', 39.99, TRUE, TRUE, 2),
('Mesa de Centro', 'Mesa de centro de madera', 89.99, TRUE, FALSE, 3),
('Novela', 'Novela de misterio y suspenso', 9.99, TRUE, TRUE, 4);

-- Insertar datos en user
INSERT INTO user (cui, username, email, name, lastname, phone, address, role_id, password) VALUES 
(1234567890123, 'admin1', 'admin1@market.com', 'Juan', 'Pérez', '5551234567', 'Calle Falsa 123', 1, 'admin123'),
(2345678901234, 'vendedor1', 'vendedor1@market.com', 'María', 'Gómez', '5552345678', 'Avenida Siempre Viva 456', 2, 'vendedor123'),
(3456789012345, 'comprador1', 'comprador1@market.com', 'Carlos', 'López', '5553456789', 'Boulevard de los Sueños 789', 3, 'comprador123'),
(4567890123456, 'vendedor2', 'vendedor2@market.com', 'Ana', 'Martínez', '5554567890', 'Calle de la Amargura 101', 2, 'vendedor456'),
(5678901234567, 'comprador2', 'comprador2@market.com', 'Luis', 'Hernández', '5555678901', 'Avenida de la Paz 202', 3, 'comprador456'),
(6789012345678, 'admin2', 'admin2@market.com', 'Laura', 'Ramírez', '5556789012', 'Calle de la Alegría 303', 1, 'admin456'),
(7890123456789, 'vendedor3', 'vendedor3@market.com', 'Pedro', 'García', '5557890123', 'Avenida de los Poetas 404', 2, 'vendedor789'),
(8901234567890, 'comprador3', 'comprador3@market.com', 'Sofía', 'Rodríguez', '5558901234', 'Boulevard de los Artistas 505', 3, 'comprador789'),
(9012345678901, 'vendedor4', 'vendedor4@market.com', 'Miguel', 'Fernández', '5559012345', 'Calle de los Sueños 606', 2, 'vendedor101'),
(1234567890124, 'comprador4', 'comprador4@market.com', 'Elena', 'Sánchez', '5550123456', 'Avenida de la Esperanza 707', 3, 'comprador101');

-- Insertar datos en user_inventory
INSERT INTO user_inventory (user_cui, product_id) VALUES 
(2345678901234, 1), 
(2345678901234, 2), 
(3456789012345, 3), 
(3456789012345, 4), 
(4567890123456, 5), 
(4567890123456, 6), 
(5678901234567, 7), 
(5678901234567, 8), 
(6789012345678, 9), 
(6789012345678, 10);

-- Insertar datos en post
INSERT INTO post (user_cui, description, product_id, date, state) VALUES 
(2345678901234, 'Vendo teléfono en buen estado', 1, '2024-09-01', TRUE),
(2345678901234, 'Laptop casi nueva', 2, '2024-09-02', TRUE),
(3456789012345, 'Camiseta de algodón', 3, '2024-09-03', TRUE),
(3456789012345, 'Sofá cómodo', 4, '2024-09-04', TRUE),
(4567890123456, 'Libro de cocina', 5, '2024-09-05', TRUE),
(4567890123456, 'Muñeca con accesorios', 6, '2024-09-06', TRUE),
(5678901234567, 'Televisor 4K', 7, '2024-09-07', TRUE),
(5678901234567, 'Pantalones de mezclilla', 8, '2024-09-08', TRUE),
(6789012345678, 'Mesa de centro', 9, '2024-09-09', TRUE),
(6789012345678, 'Novela de misterio', 10, '2024-09-10', TRUE);

-- Insertar datos en post_details
INSERT INTO post_details (post_id, amount, payment_method) VALUES 
(1, 599.99, 'Tarjeta de Crédito'), 
(2, 899.99, 'PayPal'), 
(3, 19.99, 'Efectivo'), 
(4, 299.99, 'Tarjeta de Débito'), 
(5, 14.99, 'Transferencia Bancaria'), 
(6, 24.99, 'Efectivo'), 
(7, 499.99, 'Tarjeta de Crédito'), 
(8, 39.99, 'PayPal'), 
(9, 89.99, 'Efectivo'), 
(10, 9.99, 'Transferencia Bancaria');

-- Insertar datos en offer
INSERT INTO offer (user_cui, description, state, date) VALUES 
(3456789012345, 'Ofrezco 550 por el teléfono', TRUE, '2024-09-11'),
(3456789012345, 'Ofrezco 850 por la laptop', TRUE, '2024-09-12'),
(4567890123456, 'Ofrezco 15 por la camiseta', TRUE, '2024-09-13'),
(4567890123456, 'Ofrezco 250 por el sofá', TRUE, '2024-09-14'),
(5678901234567, 'Ofrezco 10 por el libro de cocina', TRUE, '2024-09-15'),
(5678901234567, 'Ofrezco 20 por la muñeca', TRUE, '2024-09-16'),
(6789012345678, 'Ofrezco 450 por el televisor', TRUE, '2024-09-17'),
(6789012345678, 'Ofrezco 35 por los pantalones', TRUE, '2024-09-18'),
(7890123456789, 'Ofrezco 80 por la mesa de centro', TRUE, '2024-09-19'),
(7890123456789, 'Ofrezco 8 por la novela', TRUE, '2024-09-20');

-- Insertar datos en offer_details
INSERT INTO offer_details (offer_id, amount, payment_method) VALUES 
(1, 550.00, 'Efectivo'), 
(2, 850.00, 'Transferencia Bancaria'), 
(3, 15.00, 'Efectivo'), 
(4, 250.00, 'Tarjeta de Débito'), 
(5, 10.00, 'PayPal'), 
(6, 20.00, 'Efectivo'), 
(7, 450.00, 'Tarjeta de Crédito'), 
(8, 35.00, 'PayPal'), 
(9, 80.00, 'Efectivo'), 
(10, 8.00, 'Transferencia Bancaria');

-- Insertar datos en trade
INSERT INTO trade (post_id, offer_id, date) VALUES 
(1, 1, '2024-09-21'), 
(2, 2, '2024-09-22'), 
(3, 3, '2024-09-23'), 
(4, 4, '2024-09-24'), 
(5, 5, '2024-09-25'), 
(6, 6, '2024-09-26'), 
(7, 7, '2024-09-27'), 
(8, 8, '2024-09-28'), 
(9, 9, '2024-09-29'), 
(10, 10, '2024-09-30');

-- Insertar datos en shipping
INSERT INTO shipping (date, departure_date, delivery_date, trade_post_id, trade_offer_id, receptor_id, sender_id, shipping_company_id) VALUES 
('2024-09-21', '2024-09-22', '2024-09-23', 1, 1, 3456789012345, 2345678901234, 1),
('2024-09-22', '2024-09-23', '2024-09-24', 2, 2, 3456789012345, 2345678901234, 2),
('2024-09-23', '2024-09-24', '2024-09-25', 3, 3, 4567890123456, 3456789012345, 3),
('2024-09-24', '2024-09-25', '2024-09-26', 4, 4, 4567890123456, 3456789012345, 1),
('2024-09-25', '2024-09-26', '2024-09-27', 5, 5, 5678901234567, 4567890123456, 2),
('2024-09-26', '2024-09-27', '2024-09-28', 6, 6, 5678901234567, 4567890123456, 3),
('2024-09-27', '2024-09-28', '2024-09-29', 7, 7, 6789012345678, 5678901234567, 1),
('2024-09-28', '2024-09-29', '2024-09-30', 8, 8, 6789012345678, 5678901234567, 2),
('2024-09-29', '2024-09-30', '2024-10-01', 9, 9, 7890123456789, 6789012345678, 3),
('2024-09-30', '2024-10-01', '2024-10-02', 10, 10, 7890123456789, 6789012345678, 1);