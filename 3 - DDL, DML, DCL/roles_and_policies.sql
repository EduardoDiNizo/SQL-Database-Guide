CREATE ROLE admin;
CREATE ROLE customer;
CREATE ROLE guest;

GRANT SELECT, INSERT, UPDATE, DELETE ON user TO admin;
GRANT SELECT, INSERT, UPDATE ON user_profile TO admin, customer;
GRANT SELECT ON address TO admin, customer, guest;
GRANT SELECT, INSERT, UPDATE, DELETE ON product TO admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON product_category TO admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON "order" TO admin, customer;
GRANT SELECT, INSERT, UPDATE, DELETE ON order_item TO admin, customer;
GRANT SELECT, INSERT, UPDATE, DELETE ON payment_method TO admin;

CREATE POLICY customer_order_policy
ON "order"
FOR SELECT
USING (user_id = current_user);

CREATE POLICY admin_order_policy
ON "order"
FOR SELECT
USING (true);

CREATE POLICY guest_order_policy
ON "order"
FOR SELECT
USING (status = 'public');
