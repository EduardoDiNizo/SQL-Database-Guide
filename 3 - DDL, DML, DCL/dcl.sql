-- Concede permissão para selecionar dados da tabela `user` para um determinado usuário ou papel.
GRANT SELECT ON user TO 'username'@'host';

-- Revoga a permissão de inserir dados na tabela `order` de um usuário ou papel.
REVOKE INSERT ON order FROM 'username'@'host';

-- Concede todos os privilégios para a tabela `product` para um determinado usuário ou papel.
GRANT ALL PRIVILEGES ON product TO 'username'@'host';

-- Revoga a permissão de excluir dados da tabela `address` de um usuário ou papel.
REVOKE DELETE ON address FROM 'username'@'host';

-- Concede permissão para executar uma função ou procedimento armazenado, por exemplo, na tabela `order`.
GRANT EXECUTE ON FUNCTION function_name TO 'username'@'host';

-- Concede permissão para selecionar dados da tabela `user` para um determinado usuário ou papel.
GRANT SELECT ON user TO 'username'@'host';

-- Revoga a permissão de inserir dados na tabela `order` de um usuário ou papel.
REVOKE INSERT ON order FROM 'username'@'host';

-- Concede todos os privilégios para a tabela `product` para um determinado usuário ou papel.
GRANT ALL PRIVILEGES ON product TO 'username'@'host';

-- Revoga a permissão de excluir dados da tabela `address` de um usuário ou papel.
REVOKE DELETE ON address FROM 'username'@'host';

-- Concede permissão para executar uma função ou procedimento armazenado, por exemplo, na tabela `order`.
GRANT EXECUTE ON FUNCTION function_name TO 'username'@'host';

-- Concede todos os privilégios para um usuário ou papel em um banco de dados específico.
GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'host';

-- Revoga todos os privilégios concedidos anteriormente para um usuário ou papel em um banco de dados específico.
REVOKE ALL PRIVILEGES ON database_name.* FROM 'username'@'host';

-- Concede a um usuário a capacidade de conceder ou revogar privilégios para outros usuários.
GRANT SELECT, INSERT ON table_name TO 'username'@'host' WITH GRANT OPTION;

-- Define a senha para um usuário.
SET PASSWORD FOR 'username'@'host' = 'new_password';

-- Cria um novo usuário com uma senha específica.
CREATE USER 'new_username'@'host' IDENTIFIED BY 'password';

-- Remove um usuário do banco de dados.
DROP USER 'username'@'host';


