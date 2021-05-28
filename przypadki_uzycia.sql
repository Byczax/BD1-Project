--------------- SZEF ---------------

--- 1.Dodaje sklep ---

DELETE FROM public.warehouses
	WHERE city = 'Wrocław' AND street_address = 'Dworcowa';
DELETE FROM public.shops
	WHERE city = 'Wrocław' AND street_address = 'Sucha 2';
INSERT INTO public.warehouses(
	warehouse_id, city, street_address, postal_code)
	VALUES (((SELECT MAX(warehouse_id)  FROM warehouses) + 1), 'Wrocław', 'Dworcowa', '50-31');
INSERT INTO public.shops(
	shop_id, surface, warehouse_id, city, street_address, postal_code)
	VALUES (((SELECT MAX(shop_id) FROM shops)+1),100,(SELECT warehouse_id FROM warehouses WHERE city = 'Wrocław' AND street_address = 'Dworcowa'),'Wrocław','Sucha 2','50-530');

--- 2.Tworzy umowę - ustala zarobki ---

SELECT AVG(salary::numeric) FROM workers WHERE employment_type = 'magazynier';

--- 3.Przydziela pracownika do sklepu ---

UPDATE public.workers
SET shop_id=10
WHERE first_name = 'Albert' AND last_name = 'Adamczyk';

--- 4.Posiada podgląd na wszystkich pracowników ---

SELECT * 
FROM workers;

--- 5.Generuje raporty finansowe ---

SELECT o.order_id, pr.shop_price 
FROM orders o, product_orders po, products pr
WHERE (order_date BETWEEN '2020-01-01' AND '2021-01-01') AND o.order_id = po.orders_order_id AND po.products_product_id = pr.product_id;

--------------- MANAGER ---------------

--- 6.dodaje pracowników ---

INSERT INTO workers VALUES(401,'Janusz','Zwierzak',3000,CURRENT_DATE,'kierownik',4,10);

--- 7.ustala pensje ---

UPDATE workers 
SET salary = 20000 
WHERE first_name = 'JANUSZ';

--- 8.zmienia status zamówienia z złożone -> przyjęte ---

UPDATE orders set order_status = 2 where order_id = 2;

--- 9.Składanie zamówień do producenta ---

SELECT warehouses.warehouse_id, products.product_id, products_quantity.quantity
FROM warehouses, products_quantity, products;
WHERE warehouses.warehouse_id = 1;

--- 10.Utworzenie kosztorysu zamówienia ---

SELECT warehouses.warehouse_id, products.product_id, products.factory_price
FROM warehouses, products_quantity, products;
WHERE warehouses.warehouse_id = 1;

--- 11.Tworzenie raportów finansowych ---

SELECT SUM(products.shop_price)
FROM orders, product_orders, products
WHERE orders.order_id = 1;

--- 12.Przeglądanie pracowników ---

SELECT first_name, last_name, salary, employment_type 
FROM workers
WHERE manager_id = 1;

--------------- PRACOWNIK ---------------


--- 13.Składa wniosek o uzupełnienie ---

-- Jeżeli produkt zamówiony ma w sklepie ilość zero to go wyświetl

SELECT product_name
FROM products
JOIN products_quantity
USING (product_id)
WHERE quantity = 0;

--- 14.Składa wniosek o podwyżkę ---

SELECT salary::numeric - (SELECT AVG(salary::numeric) 
FROM workers WHERE employment_type = 'magazynier') as różnica_płacy 
FROM workers 
WHERE worker_id = 20;

--- 15.Przyjmowanie towaru na stan sklepu ---

INSERT INTO products_quantity(warehouse_id, product_id, quantity) VALUES(2,4,3);

--- 16.Przeglądanie stanu magazynu ---

SELECT product_name, quantity
FROM products
JOIN products_quantity
USING (product_id)
WHERE warehouse_id = 10;

--- 17.Zmiana statusu zamówienia ---

UPDATE orders 
SET order_status = 3 
WHERE order_id = 2;

UPDATE orders 
SET order_status = 4 
WHERE order_id = 2;

--------------- KLIENT ---------------

--- 18.Składanie zamówienia ---

INSERT INTO orders (client_id, products, shop_id, order_date, order_status)
VALUES (10,ARRAY [1,1,2,3,4,6,7],2,GETDATE(),1);

--- 19.Anuluje zamówienie ---

DELETE FROM orders
WHERE order_id = 2 AND order_status = 1;

--- 20.Przeglądanie zamówień ---

SELECT * 
FROM orders
WHERE client_id = 10;