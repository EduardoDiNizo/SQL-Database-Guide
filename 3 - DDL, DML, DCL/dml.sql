-- Insert an address
INSERT INTO address (id, street, city, state, country) VALUES
('1f78f1e4-5b7a-4c20-8cf6-2a68329d1fc9', 'Street A', 'City A', 'State A', 'Country A');

-- Insert a user profile
INSERT INTO user_profile (id, user_id, birth_date, gender) VALUES
('2d688edf-17f1-4f3e-bf9a-1fc8b2c73a06', '1f78f1e4-5b7a-4c20-8cf6-2a68329d1fc9', '1990-01-01', 'Male');

-- Insert a user
INSERT INTO user (id, name, email, profile_id, address_id) VALUES
('1f78f1e4-5b7a-4c20-8cf6-2a68329d1fc9', 'John', 'john@example.com', '2d688edf-17f1-4f3e-bf9a-1fc8b2c73a06', '1f78f1e4-5b7a-4c20-8cf6-2a68329d1fc9');

-- Insert a product category
INSERT INTO product_category (id, name, description) VALUES
('d4c4f26e-9f4d-42c8-8ff2-03f05fd44c20', 'Category A', 'Category A description');

-- Insert a product
INSERT INTO product (id, name, description, price, category_id) VALUES
('a12f5b5a-f6a6-4d7f-8042-bd8b17f3f4b9', 'Product A', 'Product A description', 10.50, 'd4c4f26e-9f4d-42c8-8ff2-03f05fd44c20');

-- Insert a payment method
INSERT INTO payment_method (id, name, description) VALUES
('e7e32561-ec3a-4c67-80b8-070c93407c6f', 'Credit Card', 'Credit Card payment');

-- Insert an order
INSERT INTO order (id, user_id, payment_method_id, status, order_date) VALUES
('b0b18b8f-0680-4548-9fcf-6e96fd8d73b3', '1f78f1e4-5b7a-4c20-8cf6-2a68329d1fc9', 'e7e32561-ec3a-4c67-80b8-070c93407c6f', 'In progress', '2024-03-12');

-- Insert an order item
INSERT INTO order_item (id, order_id, product_id, quantity, unit_price) VALUES
('5faea477-8f08-4779-89cb-46f69b1d164d', 'b0b18b8f-0680-4548-9fcf-6e96fd8d73b3', 'a12f5b5a-f6a6-4d7f-8042-bd8b17f3f4b9', 2, 10.50);
