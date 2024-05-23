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


------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Roles (funções): São usadas para agrupar permissões e podem ser atribuídas a usuários para simplificar a gestão de permissões. As roles definem
-- o que um usuário pode fazer no banco de dados, como executar consultas, inserir dados, etc.

--  criação de roles:
CREATE ROLE role_read_only;
CREATE ROLE role_write_only;
CREATE ROLE role_admin;

-- Atribuição de permissões aos roles
GRANT SELECT ON address, user, user_profile, product_category, product, payment_method, `order`, order_item TO role_read_only;
GRANT INSERT, UPDATE, DELETE ON address, user, user_profile, product_category, product, payment_method, `order`, order_item TO role_write_only;
GRANT ALL PRIVILEGES ON address, user, user_profile, product_category, product, payment_method, `order`, order_item TO role_admin;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Policies (políticas): São usadas para controlar o acesso aos dados com base em condições específicas. Elas podem restringir o acesso com base em
-- critérios como a idade, o tipo de usuário ou qualquer outra condição que você defina. As políticas ajudam a garantir que apenas usuários autorizados possam acessar determinados dados.

-- Restringe o acesso às informações do perfil do usuário com base na idade mínima.
-- Se um usuário tentar acessar ou modificar um registro na tabela user_profile, o MySQL verificará se a diferença entre a data atual e a
-- data de nascimento do usuário é maior ou igual a 18 anos. Se for, o acesso será permitido. Se não, o acesso será negado, conforme definido pela política.
CREATE POLICY policy_minimum_age ON user_profile AS (DATE_DIFF(NOW(), birth_date) >= 18*365);


-- Restringe a inserção de produtos com preço abaixo de um determinado valor.
CREATE POLICY policy_minimum_price ON product AS (price >= 0.01);

-- Esta política restringe a inserção de produtos com preço abaixo de 0.01. Para aplicar essa política, você precisaria criar uma restrição de política ou verificar o preço do produto antes de inseri-lo.
INSERT INTO product (id, name, description, price, category_id)
VALUES ('1', 'Product 1', 'Description of Product 1', 0.005, '1'); -- Isso resultaria em um erro devido à política de preço mínimo

-- Ou, se você deseja uma restrição de política mais explícita, pode modificar a política para ser uma restrição de tabela:
ALTER TABLE product ADD CONSTRAINT minimum_price_constraint CHECK (price >= 0.01);


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Restrição de tamanho mínimo de descrição: Esta política restringe a inserção de produtos com descrição menor que 10 caracteres.
ALTER TABLE product ADD CONSTRAINT minimum_description_length_constraint CHECK (LENGTH(description) >= 10);

-- Restrição de preço mínimo: Esta política restringe a inserção de produtos com preço abaixo de 10.00.
ALTER TABLE product ADD CONSTRAINT minimum_price_constraint CHECK (price >= 10.00);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Auditoria:  Esta política simplesmente registra todas as operações na tabela employee
CREATE POLICY audit_policy ON employee
FOR ALL
USING (true)
WITH CHECK (1=1);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Row-level security:

CREATE POLICY row_security_policy ON employee
FOR ALL
USING (manager_id = current_user_id())
WITH CHECK (manager_id = current_user_id());

-- Essa política permite que apenas gerentes acessem os registros de funcionários onde o manager_id corresponde ao current_user_id().

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Data masking:
CREATE POLICY mask_ssn_policy ON employee
   FOR ALL
   USING (true)
   WITH CHECK (ssn = CONCAT('XXX-XX-', RIGHT(ssn, 4)));

-- Essa política mascara o número de Seguro Social (SSN) dos funcionários, exibindo apenas os últimos quatro dígitos.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Validação de dados:

CREATE POLICY validate_phone_policy ON employee
FOR ALL
USING (true)
WITH CHECK (phone_number REGEXP '^[0-9]{3}-[0-9]{3}-[0-9]{4}$');

-- Essa política valida se o número de telefone inserido no campo phone_number está em um formato de telefone válido (por exemplo, 123-456-7890).

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Restrições de horário:
CREATE POLICY access_time_policy ON employee
FOR ALL
USING (HOUR(NOW()) BETWEEN 8 AND 17);

-- Esta política restringe o acesso à tabela employee apenas durante o horário comercial, das 8h às 17h.

