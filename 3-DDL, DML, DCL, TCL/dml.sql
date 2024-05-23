-- Dados para a tabela address
INSERT INTO address (id, street, city, state, country) VALUES
(UUID(), '123 Main St', 'Springfield', 'IL', 'USA'),
(UUID(), '456 Elm St', 'Shelbyville', 'IL', 'USA');

-- Dados para a tabela user
INSERT INTO user (id, name, email, address_id) VALUES
(UUID(), 'John Doe', 'john.doe@example.com', (SELECT id FROM address WHERE street='123 Main St')),
(UUID(), 'Jane Smith', 'jane.smith@example.com', (SELECT id FROM address WHERE street='456 Elm St'));

-- Dados para a tabela user_profile
INSERT INTO user_profile (id, user_id, birth_date, gender) VALUES
(UUID(), (SELECT id FROM user WHERE email='john.doe@example.com'), '1990-01-01', 'Male'),
(UUID(), (SELECT id FROM user WHERE email='jane.smith@example.com'), '1985-05-15', 'Female');

-- Dados para a tabela product_category
INSERT INTO product_category (id, name, description) VALUES
(UUID(), 'Electronics', 'Devices and gadgets'),
(UUID(), 'Books', 'Printed and digital books');

-- Dados para a tabela product
INSERT INTO product (id, name, description, price, category_id) VALUES
(UUID(), 'Smartphone', 'Latest model smartphone', 699.99, (SELECT id FROM product_category WHERE name='Electronics')),
(UUID(), 'E-book Reader', 'Portable e-book reader', 129.99, (SELECT id FROM product_category WHERE name='Books'));

-- Dados para a tabela payment_method
INSERT INTO payment_method (id, name, description) VALUES
(UUID(), 'Credit Card', 'Visa, MasterCard, etc.'),
(UUID(), 'PayPal', 'Online payment system');

-- Dados para a tabela order
INSERT INTO `order` (id, user_id, payment_method_id, status, order_date) VALUES
(UUID(), (SELECT id FROM user WHERE email='john.doe@example.com'), (SELECT id FROM payment_method WHERE name='Credit Card'), 'Processing', '2024-05-23'),
(UUID(), (SELECT id FROM user WHERE email='jane.smith@example.com'), (SELECT id FROM payment_method WHERE name='PayPal'), 'Completed', '2024-05-22');

-- Dados para a tabela order_item
INSERT INTO order_item (id, order_id, product_id, quantity, unit_price) VALUES
(UUID(), (SELECT id FROM `order` WHERE status='Processing'), (SELECT id FROM product WHERE name='Smartphone'), 1, 699.99),
(UUID(), (SELECT id FROM `order` WHERE status='Completed'), (SELECT id FROM product WHERE name='E-book Reader'), 2, 129.99);
