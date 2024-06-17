# DDL, DML, DCL, TCL - Conceitos de Banco de Dados

Quando se trata de gerenciar um banco de dados, é essencial entender os diferentes tipos de comandos SQL que podem ser usados. Quatro tipos principais de comandos SQL são comumente usados para diversas operações: DDL, DML, DCL e TCL.

## [DDL (Data Definition Language)](DDL.md)

A Linguagem de Definição de Dados (DDL) é usada para definir a estrutura e o esquema de um banco de dados. Com DDL, você pode criar, modificar e excluir objetos como tabelas, índices e visões. Basicamente, DDL permite que você defina a "forma" dos seus dados.

Exemplo de uso:

```sql
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);
```

## [DML (Data Manipulation Language)](DML.md)

A Linguagem de Manipulação de Dados (DML) é usada para manipular os dados dentro de um banco de dados. Com DML, você pode inserir, atualizar, excluir e recuperar dados de uma tabela. DML lida com os "conteúdos" dos seus dados.

Exemplo de uso:

```sql
INSERT INTO users (id, name, email) VALUES (1, 'Alice', 'alice@example.com');
```

## [DCL (Data Control Language)](DCL.md)

A Linguagem de Controle de Dados (DCL) é usada para controlar os privilégios de acesso e segurança no banco de dados. Com DCL, você pode conceder ou revogar privilégios de acesso a usuários e papéis. DCL gerencia quem pode "ver" ou "manipular" os dados.

Exemplo de uso:

```sql
GRANT SELECT ON users TO user1;
```

## [TCL (Transaction Control Language)](TCL.md)

A Linguagem de Controle de Transações (TCL) é usada para gerenciar transações em um banco de dados. Com TCL, você pode iniciar, confirmar ou reverter transações. TCL lida com o "controle" de alterações em seus dados.

Exemplo de uso:

```sql
BEGIN TRANSACTION;
-- outras operações
COMMIT;
```

Esses conceitos são fundamentais para entender como interagir com um banco de dados, seja para definir sua estrutura, manipular seus dados, controlar o acesso ou gerenciar transações. Cada linguagem desempenha um papel importante na administração e uso eficiente de um banco de dados.