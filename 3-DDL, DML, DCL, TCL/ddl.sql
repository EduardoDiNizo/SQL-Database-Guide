-- Tabela address
CREATE TABLE address (
    id CHAR(36) PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255)
);

-- Tabela user
CREATE TABLE user (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    address_id CHAR(36),
    FOREIGN KEY (address_id) REFERENCES address(id)
);

-- Tabela user_profile
CREATE TABLE user_profile (
    id CHAR(36) PRIMARY KEY,
    user_id CHAR(36) UNIQUE,
    birth_date DATE,
    gender VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- Tabela product_category
CREATE TABLE product_category (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(255),
    description TEXT
);

-- Tabela product
CREATE TABLE product (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    category_id CHAR(36),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

-- Tabela payment_method
CREATE TABLE payment_method (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(255),
    description TEXT
);

-- Tabela order
CREATE TABLE `order` (
    id CHAR(36) PRIMARY KEY,
    user_id CHAR(36),
    payment_method_id CHAR(36),
    status VARCHAR(50),
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id)
);

-- Tabela order_item
CREATE TABLE order_item (
    id CHAR(36) PRIMARY KEY,
    order_id CHAR(36),
    product_id CHAR(36),
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES `order`(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);
------------------------------------------------------------------------------------------------------------------------------------------------

-- Tabela address
--CREATE TABLE address (
--    id CHAR(36) PRIMARY KEY,
--    street VARCHAR(255),
--    city VARCHAR(255),
--    state VARCHAR(255),
--    country VARCHAR(255)
--);
--
---- Tabela user
--CREATE TABLE user (
--    id CHAR(36) PRIMARY KEY,
--    name VARCHAR(255),
--    email VARCHAR(255),
--    address_id CHAR(36)
--);
--
---- Tabela user_profile
--CREATE TABLE user_profile (
--    id CHAR(36) PRIMARY KEY,
--    user_id CHAR(36) UNIQUE,
--    birth_date DATE,
--    gender VARCHAR(50)
--);
--
---- Tabela product_category
--CREATE TABLE product_category (
--    id CHAR(36) PRIMARY KEY,
--    name VARCHAR(255),
--    description TEXT
--);
--
---- Tabela product
--CREATE TABLE product (
--    id CHAR(36) PRIMARY KEY,
--    name VARCHAR(255),
--    description TEXT,
--    price DECIMAL(10, 2),
--    category_id CHAR(36)
--);
--
---- Tabela payment_method
--CREATE TABLE payment_method (
--    id CHAR(36) PRIMARY KEY,
--    name VARCHAR(255),
--    description TEXT
--);
--
---- Tabela order
--CREATE TABLE `order` (
--    id CHAR(36) PRIMARY KEY,
--    user_id CHAR(36),
--    payment_method_id CHAR(36),
--    status VARCHAR(50),
--    order_date DATE
--);
--
---- Tabela order_item
--CREATE TABLE order_item (
--    id CHAR(36) PRIMARY KEY,
--    order_id CHAR(36),
--    product_id CHAR(36),
--    quantity INT,
--    unit_price DECIMAL(10, 2)
--);
---- Adicionar constraint de chave estrangeira na tabela user
--ALTER TABLE user
--ADD CONSTRAINT fk_user_address
--FOREIGN KEY (address_id) REFERENCES address(id);
--
---- Adicionar constraint de chave estrangeira na tabela user_profile
--ALTER TABLE user_profile
--ADD CONSTRAINT fk_user_profile_user
--FOREIGN KEY (user_id) REFERENCES user(id);
--
---- Adicionar constraint de chave estrangeira na tabela product
--ALTER TABLE product
--ADD CONSTRAINT fk_product_category
--FOREIGN KEY (category_id) REFERENCES product_category(id);
--
---- Adicionar constraint de chave estrangeira na tabela order
--ALTER TABLE `order`
--ADD CONSTRAINT fk_order_user
--FOREIGN KEY (user_id) REFERENCES user(id),
--ADD CONSTRAINT fk_order_payment_method
--FOREIGN KEY (payment_method_id) REFERENCES payment_method(id);
--
---- Adicionar constraint de chave estrangeira na tabela order_item
--ALTER TABLE order_item
--ADD CONSTRAINT fk_order_item_order
--FOREIGN KEY (order_id) REFERENCES `order`(id),
--ADD CONSTRAINT fk_order_item_product
--FOREIGN KEY (product_id) REFERENCES product(id);

