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

### Criação de Tabelas

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

### Considerações Finais

Este conjunto de comandos exemplifica a criação de tabelas em um banco de dados relacional, a definição de chaves estrangeiras para garantir integridade referencial e a aplicação de restrições para manter a consistência dos dados. Esses conceitos são fundamentais para o design e a implementação de bancos de dados eficazes e robustos.