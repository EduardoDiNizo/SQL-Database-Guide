# Linguagem de Definição de Dados (DDL)

A Linguagem de Definição de Dados (DDL) é uma parte crucial das linguagens de banco de dados SQL (Structured Query Language). Ela permite aos usuários definir a estrutura dos objetos de banco de dados e realizar operações de gerenciamento, como criar, modificar e excluir tabelas, índices, visões, procedimentos armazenados e outros elementos fundamentais. Vamos explorar mais detalhadamente cada um desses tópicos:

## 1. Criação de Tabelas

A criação de tabelas é o primeiro passo na modelagem de dados de um banco de dados. Ela envolve a definição da estrutura de uma nova tabela, incluindo o nome da tabela, os nomes e tipos de dados das colunas, as restrições de integridade e os índices necessários. Por exemplo:
```sql
CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(ID)
);
```
## 2. Alteração de Tabelas

A alteração de tabelas permite modificar a estrutura de uma tabela existente. Isso inclui adicionar, modificar ou excluir colunas, alterar restrições de integridade, definir ou excluir índices e renomear a tabela. Por exemplo:
```sql
ALTER TABLE Employees
ADD COLUMN Email VARCHAR(255);
```
## 3. Exclusão de Tabelas

A exclusão de tabelas remove permanentemente uma tabela existente e todos os dados associados a ela do banco de dados. É uma operação irreversível e deve ser usada com cautela. Por exemplo:
```sql
DROP TABLE Employees;
```
## 4. Índices

Os índices são estruturas de dados que aceleram a recuperação de informações em uma tabela. Eles podem ser criados em uma ou mais colunas de uma tabela para melhorar o desempenho de consultas que filtram ou ordenam essas colunas. Por exemplo:
```sql
CREATE INDEX idx_Name ON Employees(Name);
```
## 5. Visões

As visões são consultas SQL armazenadas que se comportam como tabelas virtuais. Elas são úteis para simplificar consultas complexas, ocultar detalhes de implementação e fornecer uma camada adicional de segurança. Por exemplo:
```sql
CREATE VIEW EmployeeList AS
SELECT ID, Name, DepartmentID
FROM Employees;
```
## 6. Procedimentos Armazenados

Os procedimentos armazenados são blocos de código SQL que são armazenados no banco de dados e podem ser chamados e executados posteriormente. Eles são úteis para encapsular lógica de negócios complexa e promover a reutilização de código. Por exemplo:
```sql
CREATE PROCEDURE GetEmployeeByID (IN EmployeeID INT)
BEGIN
    SELECT * FROM Employees WHERE ID = EmployeeID;
END;
```
## 7. Gatilhos (Triggers)

Os gatilhos são blocos de código SQL que são automaticamente executados em resposta a eventos específicos, como inserções, atualizações ou exclusões de registros em uma tabela. Eles são úteis para impor regras de negócios e manter a consistência dos dados. Por exemplo:
```sql
CREATE TRIGGER BeforeInsertEmployee
BEFORE INSERT ON Employees
FOR EACH ROW
BEGIN
    SET NEW.CreatedAt = NOW();
END;
```
## 8. Particionamento

O particionamento de tabelas envolve a divisão de uma tabela em partes menores chamadas partições. Isso pode melhorar o desempenho e facilitar a manutenção, especialmente para tabelas muito grandes. Por exemplo:
```sql
CREATE TABLE Sales (
    ID INT,
    SaleDate DATE
) PARTITION BY RANGE (YEAR(SaleDate)) (
    PARTITION p1 VALUES LESS THAN (2000),
    PARTITION p2 VALUES LESS THAN (2010),
    PARTITION p3 VALUES LESS THAN (2020)
);
```
## 9. Restrições

As restrições de integridade garantem a consistência e a validade dos dados em uma tabela. Elas podem ser adicionadas às colunas para impor restrições de chave primária, chave estrangeira, restrições de exclusão e restrições de verificação. Por exemplo:
```sql
ALTER TABLE Employees
ADD CONSTRAINT CHK_Salary CHECK (Salary > 0);
```
## 10. Comentários

Os comentários podem ser adicionados a objetos de banco de dados, como tabelas, colunas e índices, para documentação e rastreamento. Eles são úteis para fornecer informações adicionais sobre a estrutura e o propósito dos objetos de banco de dados. Por exemplo:
```sql
COMMENT ON TABLE Employees IS 'Tabela que armazena informações dos funcionários';
```
## 11. Privilégios

Os privilégios de acesso controlam quem pode executar operações em objetos de banco de dados. Eles podem ser concedidos ou revogados para usuários e grupos de usuários específicos para garantir a segurança e a privacidade dos dados. Por exemplo:
```sql
GRANT SELECT ON Employees TO 'user1'@'localhost';
```
## 12. DDL de Banco de Dados

Além de operações em objetos individuais, a DDL também permite criar, modificar e excluir bancos de dados inteiros. Isso inclui definir parâmetros de configuração de banco de dados, como codificação de caracteres e configurações de armazenamento. Por exemplo:
```sql
CREATE DATABASE Company;
```
## 13. DDL de Esquema

A DDL de esquema envolve a criação, modificação e exclusão de esquemas de banco de dados, que são coleções de objetos de banco de dados, como tabelas, visões, procedimentos armazenados e gatilhos. Ela permite organizar e gerenciar os objetos de banco de dados de forma lógica e estruturada. Por exemplo:
```sql
CREATE SCHEMA Accounting;
```
Esses são os principais aspectos da Linguagem de Definição de Dados (DDL) que são utilizados para criar, modificar e excluir objetos de banco de dados em sistemas de gerenciamento de banco de dados relacionais.

## Exemplo: Store

Vamos explorar um conjunto de comandos SQL que exemplificam a criação de tabelas, a adição de chaves estrangeiras e a definição de integridade referencial em um banco de dados relacional. Vamos usar como exemplo um modelo simples de e-commerce, com tabelas para usuários, perfis de usuário, categorias de produtos, produtos, métodos de pagamento, pedidos e itens de pedido.

## Criação de Tabelas

1. **address**: Armazena informações de endereços.
    - **id**: Identificador único do endereço.
    - **street**: Nome da rua.
    - **city**: Cidade.
    - **state**: Estado.
    - **country**: País.

2. **user**: Armazena informações de usuários e faz referência a um endereço.
    - **id**: Identificador único do usuário.
    - **name**: Nome do usuário.
    - **email**: Endereço de e-mail do usuário.
    - **address_id**: Chave estrangeira que faz referência ao endereço do usuário na tabela `address`.

3. **user_profile**: Armazena informações adicionais de perfil de usuário e faz referência a um usuário.
    - **id**: Identificador único do perfil.
    - **user_id**: Chave única que faz referência ao usuário na tabela `user`.
    - **birth_date**: Data de nascimento do usuário.
    - **gender**: Gênero do usuário.

4. **product_category**: Define as categorias dos produtos.
    - **id**: Identificador único da categoria.
    - **name**: Nome da categoria.
    - **description**: Descrição da categoria.

5. **product**: Armazena informações dos produtos e faz referência a uma categoria.
    - **id**: Identificador único do produto.
    - **name**: Nome do produto.
    - **description**: Descrição do produto.
    - **price**: Preço do produto.
    - **category_id**: Chave estrangeira que faz referência à categoria do produto na tabela `product_category`.

6. **payment_method**: Define os métodos de pagamento disponíveis.
    - **id**: Identificador único do método de pagamento.
    - **name**: Nome do método de pagamento.
    - **description**: Descrição do método de pagamento.

7. **order**: Armazena informações dos pedidos e faz referência a um usuário e a um método de pagamento.
    - **id**: Identificador único do pedido.
    - **user_id**: Chave estrangeira que faz referência ao usuário que fez o pedido na tabela `user`.
    - **payment_method_id**: Chave estrangeira que faz referência ao método de pagamento na tabela `payment_method`.
    - **status**: Status do pedido.
    - **order_date**: Data do pedido.

8. **order_item**: Armazena informações dos itens de pedido e faz referência a um pedido e a um produto.
    - **id**: Identificador único do item de pedido.
    - **order_id**: Chave estrangeira que faz referência ao pedido na tabela `order`.
    - **product_id**: Chave estrangeira que faz referência ao produto na tabela `product`.
    - **quantity**: Quantidade do produto no pedido.
    - **unit_price**: Preço unitário do produto no pedido.

### Adição de Chaves Estrangeiras

- As chaves estrangeiras são adicionadas nas tabelas `user`, `user_profile`, `product`, `order`, e `order_item` para garantir integridade referencial com as tabelas `address`, `user`, `product_category`, `order`, e `product`, respectivamente.

### Restrições de Integridade Referencial

- São aplicadas restrições de integridade referencial para garantir que os valores nas chaves estrangeiras correspondam aos valores nas chaves primárias das tabelas referenciadas.

```sql
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
```

## Alteração de Tabelas

1. Adicionar uma nova coluna à tabela `user`:
```sql
ALTER TABLE user
ADD COLUMN phone_number VARCHAR(20);
```

2. Alterar o tipo de uma coluna na tabela `product`:
```sql
ALTER TABLE product
MODIFY COLUMN price DECIMAL(12, 2);
```

3. Renomear uma coluna na tabela `user_profile`:
```sql
ALTER TABLE user_profile
CHANGE COLUMN gender sex VARCHAR(50);
```

4. Remover uma coluna da tabela `address`:
```sql
ALTER TABLE address
DROP COLUMN country;
```

5. Adicionar uma restrição NOT NULL a uma coluna na tabela `order_item`:
```sql
ALTER TABLE order_item
MODIFY COLUMN unit_price DECIMAL(10, 2) NOT NULL;
```

## Exclusão de Tabelas

1. Excluir a tabela `user`:
```sql
DROP TABLE user;
```

2. Excluir a tabela `user_profile`:
```sql
DROP TABLE user_profile;
```

3. Excluir a tabela `order_item`:
```sql
DROP TABLE order_item;
```

4. Excluir a tabela `product_category`:
```sql
DROP TABLE product_category;
```

5. Excluir a tabela `payment_method`:
```sql
DROP TABLE payment_method;
```

## Índices

1. Criar um índice simples na coluna `email` da tabela `user`:
```sql
CREATE INDEX idx_user_email ON user (email);
```

2. Criar um índice único na coluna `name` da tabela `product_category`:
```sql
CREATE UNIQUE INDEX idx_product_category_name ON product_category (name);
```

3. Criar um índice composto nas colunas `user_id` e `order_date` da tabela `order`:
```sql
CREATE INDEX idx_order_user_id_order_date ON `order` (user_id, order_date);
```

4. Criar um índice full-text na coluna `description` da tabela `product`:
```sql
CREATE FULLTEXT INDEX idx_product_description ON product (description);
```

5. Criar um índice único na coluna `id` da tabela `address`:
```sql
CREATE UNIQUE INDEX idx_address_id ON address (id);
```

## Visões

1. Criar uma view simples que retorna o nome e o email dos usuários da tabela `user`:
```sql
CREATE VIEW user_view AS
SELECT name, email
FROM user;
```

2. Criar uma view que retorna o nome do produto, a categoria e o preço, juntando as tabelas `product` e `product_category`:
```sql
CREATE VIEW product_info AS
SELECT p.name AS product_name, pc.name AS category, p.price
FROM product p
JOIN product_category pc ON p.category_id = pc.id;
```

3. Criar uma view que calcula o total gasto por usuário em pedidos, juntando as tabelas `order` e `order_item`:
```sql
CREATE VIEW user_total_spent AS
SELECT u.name AS user_name, SUM(oi.quantity * oi.unit_price) AS total_spent
FROM `order` o
JOIN user u ON o.user_id = u.id
JOIN order_item oi ON o.id = oi.order_id
GROUP BY u.name;
```

4. Criar uma view que retorna o número de pedidos por mês no ano atual, juntando a tabela `order`:
```sql
CREATE VIEW orders_per_month AS
SELECT MONTH(order_date) AS month, COUNT(*) AS num_orders
FROM `order`
WHERE YEAR(order_date) = YEAR(CURDATE())
GROUP BY MONTH(order_date);
```

## Procedimentos Armazenados

1. Criar um procedimento armazenado simples que retorna todos os usuários da tabela `user`:
```sql
DELIMITER //
CREATE PROCEDURE get_users()
BEGIN
    SELECT * FROM user;
END //
DELIMITER ;
```

2. Criar um procedimento armazenado que retorna o nome do usuário com base no ID fornecido como parâmetro:
```sql
DELIMITER //
CREATE PROCEDURE get_user_name (IN user_id CHAR(36))
BEGIN
    SELECT name FROM user WHERE id = user_id;
END //
DELIMITER ;
```

3. Criar um procedimento armazenado que insere um novo produto na tabela `product`:
```sql
DELIMITER //
CREATE PROCEDURE insert_product (IN product_name VARCHAR(255), IN description TEXT, IN price DECIMAL(10, 2), IN category_id CHAR(36))
BEGIN
    INSERT INTO product (name, description, price, category_id) VALUES (product_name, description, price, category_id);
END //
DELIMITER ;
```

4. Criar um procedimento armazenado que atualiza o status de um pedido com base no ID fornecido como parâmetro:
```sql
DELIMITER //
CREATE PROCEDURE update_order_status (IN order_id CHAR(36), IN new_status VARCHAR(50))
BEGIN
    UPDATE `order` SET status = new_status WHERE id = order_id;
END //
DELIMITER ;
```

## Gatilhos (Triggers)


1. Criar um gatilho que insere um registro na tabela `audit_log` sempre que um novo usuário é inserido na tabela `user`:
```sql
CREATE TRIGGER user_insert_trigger
AFTER INSERT ON user
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (event_type, event_description, event_date)
    VALUES ('INSERT', CONCAT('New user inserted: ', NEW.name), NOW());
END;
```

2. Criar um gatilho que atualiza a data de modificação de um produto sempre que o preço é alterado na tabela `product`:
```sql
CREATE TRIGGER product_price_update_trigger
AFTER UPDATE OF price ON product
FOR EACH ROW
BEGIN
    UPDATE product SET modification_date = NOW() WHERE id = NEW.id;
END;
```

3. Criar um gatilho que impede a exclusão de categorias de produtos que ainda estão sendo usadas por produtos na tabela `product`:
```sql
CREATE TRIGGER prevent_category_deletion_trigger
BEFORE DELETE ON product_category
FOR EACH ROW
BEGIN
    DECLARE category_count INT;
    SELECT COUNT(*) INTO category_count FROM product WHERE category_id = OLD.id;
    IF category_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete category. Products are still using this category.';
    END IF;
END;
```

4. Criar um gatilho que atualiza o saldo da conta de um usuário sempre que um novo pedido é criado na tabela `order`:
```sql
CREATE TRIGGER update_account_balance_trigger
AFTER INSERT ON `order`
FOR EACH ROW
BEGIN
    UPDATE account SET balance = balance - (SELECT SUM(quantity * unit_price) FROM order_item WHERE order_id = NEW.id) WHERE user_id = NEW.user_id;
END;
```

## Particionamento

O particionamento em bancos de dados é uma técnica que divide tabelas grandes em partes menores, chamadas partições, para melhorar o desempenho e a manutenção. Aqui estão alguns exemplos de DDLs para criar partições em uma tabela:

1. Criar uma tabela particionada por faixa de valores em uma coluna de data na tabela `logs`:
```sql
CREATE TABLE logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    log_message TEXT,
    log_date DATE
)
PARTITION BY RANGE (YEAR(log_date)) (
    PARTITION p0 VALUES LESS THAN (2000),
    PARTITION p1 VALUES LESS THAN (2001),
    PARTITION p2 VALUES LESS THAN (2002),
    PARTITION p3 VALUES LESS THAN (2003),
    PARTITION p4 VALUES LESS THAN (2004),
    PARTITION p5 VALUES LESS THAN (2005),
    PARTITION p6 VALUES LESS THAN (2006),
    PARTITION p7 VALUES LESS THAN (2007),
    PARTITION p8 VALUES LESS THAN (2008),
    PARTITION p9 VALUES LESS THAN (2009),
    PARTITION p10 VALUES LESS THAN (2010),
    PARTITION p11 VALUES LESS THAN (2011),
    PARTITION p12 VALUES LESS THAN (2012),
    PARTITION p13 VALUES LESS THAN (2013),
    PARTITION p14 VALUES LESS THAN (2014),
    PARTITION p15 VALUES LESS THAN (2015),
    PARTITION p16 VALUES LESS THAN (2016),
    PARTITION p17 VALUES LESS THAN (2017),
    PARTITION p18 VALUES LESS THAN (2018),
    PARTITION p19 VALUES LESS THAN (2019),
    PARTITION p20 VALUES LESS THAN (2020),
    PARTITION p21 VALUES LESS THAN (2021),
    PARTITION p22 VALUES LESS THAN (2022),
    PARTITION p23 VALUES LESS THAN (2023),
    PARTITION p24 VALUES LESS THAN (2024),
    PARTITION p25 VALUES LESS THAN (2025),
    PARTITION p26 VALUES LESS THAN (2026),
    PARTITION p27 VALUES LESS THAN (2027),
    PARTITION p28 VALUES LESS THAN (2028),
    PARTITION p29 VALUES LESS THAN (2029),
    PARTITION p30 VALUES LESS THAN (2030),
    PARTITION p31 VALUES LESS THAN (2031),
    PARTITION p32 VALUES LESS THAN (2032),
    PARTITION p33 VALUES LESS THAN (2033),
    PARTITION p34 VALUES LESS THAN (2034),
    PARTITION p35 VALUES LESS THAN (2035),
    PARTITION p36 VALUES LESS THAN (2036),
    PARTITION p37 VALUES LESS THAN (2037),
    PARTITION p38 VALUES LESS THAN (2038),
    PARTITION p39 VALUES LESS THAN (2039),
    PARTITION p40 VALUES LESS THAN (2040),
    PARTITION p41 VALUES LESS THAN (2041),
    PARTITION p42 VALUES LESS THAN (2042),
    PARTITION p43 VALUES LESS THAN (2043),
    PARTITION p44 VALUES LESS THAN (2044),
    PARTITION p45 VALUES LESS THAN (2045),
    PARTITION p46 VALUES LESS THAN (2046),
    PARTITION p47 VALUES LESS THAN (2047),
    PARTITION p48 VALUES LESS THAN (2048),
    PARTITION p49 VALUES LESS THAN (2049),
    PARTITION p50 VALUES LESS THAN (2050)
);
```

2. Criar uma tabela particionada por lista de valores em uma coluna de status na tabela `orders`:
```sql
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    status VARCHAR(50)
)
PARTITION BY LIST (status) (
    PARTITION p_pending VALUES IN ('Pending'),
    PARTITION p_processing VALUES IN ('Processing'),
    PARTITION p_shipped VALUES IN ('Shipped'),
    PARTITION p_completed VALUES IN ('Completed')
);
```

3. Criar uma tabela particionada por hash em uma coluna de identificação na tabela `data`:
```sql
CREATE TABLE data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_value INT
)
PARTITION BY HASH (id)
PARTITIONS 4;
```

## Restrições

As restrições em um banco de dados são regras aplicadas a uma ou mais colunas em uma tabela para garantir a integridade e consistência dos dados. Aqui estão alguns exemplos de DDLs para criar restrições em uma tabela:

1. Criar uma restrição de chave primária na coluna `id` da tabela `users`:
```sql
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE
);
```

2. Criar uma restrição de chave estrangeira na coluna `user_id` da tabela `orders` que referencia a coluna `id` da tabela `users`:
```sql
CREATE TABLE orders (
    id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

3. Criar uma restrição NOT NULL na coluna `name` da tabela `products`:
```sql
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2)
);
```

4. Criar uma restrição de verificação (CHECK) na coluna `quantity` da tabela `order_items` para garantir que o valor seja maior que zero:
```sql
CREATE TABLE order_items (
    id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
```

5. Criar uma restrição de chave única na coluna `email` da tabela `users`:
```sql
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE
);
```
## Comentários

Em muitos sistemas de gerenciamento de banco de dados (SGBDs), você pode adicionar comentários a tabelas e colunas para documentar o propósito, a estrutura ou outras informações relevantes sobre o esquema de banco de dados. Aqui estão exemplos genéricos de como adicionar comentários em tabelas e colunas:

1. Adicionar um comentário a uma tabela:
```sql
COMMENT ON TABLE table_name IS 'Description of the table';
```

2. Adicionar um comentário a uma coluna em uma tabela:
```sql
COMMENT ON COLUMN table_name.column_name IS 'Description of the column';
```

Por exemplo, considerando uma tabela `users` com uma coluna `email`, você poderia adicionar comentários da seguinte forma:

```sql
COMMENT ON TABLE users IS 'Table containing user information.';
COMMENT ON COLUMN users.email IS 'User email address.';
```

No entanto, a sintaxe exata pode variar entre os SGBDs. Verifique a documentação específica do seu SGBD para obter informações precisas sobre como adicionar comentários em tabelas e colunas.

## Privilégios

Os privilégios em um banco de dados controlam quais operações os usuários podem realizar em objetos do banco de dados, como tabelas, visualizações, procedimentos armazenados, etc. Aqui estão alguns exemplos de DDLs para conceder privilégios em um banco de dados:

1. Conceder o privilégio SELECT na tabela `users` para o usuário `user1`:
```sql
GRANT SELECT ON users TO user1;
```

2. Conceder os privilégios INSERT, UPDATE e DELETE na tabela `products` para o usuário `user1`:
```sql
GRANT INSERT, UPDATE, DELETE ON products TO user1;
```

3. Conceder todos os privilégios na tabela `orders` para o usuário `user1`:
```sql
GRANT ALL PRIVILEGES ON orders TO user1;
```

4. Conceder o privilégio EXECUTE em um procedimento armazenado `calculate_total` para o usuário `user1`:
```sql
GRANT EXECUTE ON PROCEDURE calculate_total TO user1;
```

5. Revogar o privilégio SELECT na tabela `sensitive_data` do usuário `user2`:
```sql
REVOKE SELECT ON sensitive_data FROM user2;
```

### Considerações Finais

Este conjunto de comandos exemplifica a criação de tabelas em um banco de dados relacional, a definição de chaves estrangeiras para garantir integridade referencial e a aplicação de restrições para manter a consistência dos dados. Esses conceitos são fundamentais para o design e a implementação de bancos de dados eficazes e robustos.

