START TRANSACTION;
INSERT INTO address (id, street, city, state, country) VALUES ('1', 'Rua A', 'Cidade A', 'Estado A', 'País A');
INSERT INTO user (id, name, email, address_id) VALUES ('1', 'Usuário A', 'email@exemplo.com', '1');
--ROLLBACK;
COMMIT;

START TRANSACTION;
UPDATE user SET name = 'Novo Nome' WHERE id = '1';
UPDATE product_category SET description = 'Nova Descrição' WHERE id = '1';
--ROLLBACK;
COMMIT;

START TRANSACTION;
DELETE FROM order_item WHERE order_id = '1';
DELETE FROM `order` WHERE id = '1';
--ROLLBACK;
COMMIT;
