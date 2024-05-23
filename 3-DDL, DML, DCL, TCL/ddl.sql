CREATE TABLE user (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    profile_id CHAR(36) UNIQUE,
    address_id CHAR(36),
    FOREIGN KEY (profile_id) REFERENCES user_profile(id),
    FOREIGN KEY (address_id) REFERENCES address(id)
);

CREATE TABLE address (
    id CHAR(36) PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255)
);

CREATE TABLE user_profile (
    id CHAR(36) PRIMARY KEY,
    user_id CHAR(36) UNIQUE,
    birth_date DATE,
    gender VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE product (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    category_id CHAR(36),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

CREATE TABLE product_category (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(255),
    description TEXT
);

CREATE TABLE order (
    id CHAR(36) PRIMARY KEY,
    user_id CHAR(36),
    payment_method_id CHAR(36),
    status VARCHAR(50),
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id)
);

CREATE TABLE order_item (
    id CHAR(36) PRIMARY KEY,
    order_id CHAR(36),
    product_id CHAR(36),
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES order(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE payment_method (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(255),
    description TEXT
);
