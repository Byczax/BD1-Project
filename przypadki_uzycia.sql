--------------- SZEF ---------------

--- Dodaje sklep ---

/*
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
*/

--- Tworzy umowę - ustala zarobki ---

-- SELECT AVG(salary::numeric) FROM workers WHERE employment_type = 'magazynier';


--- Przydziela pracownika do sklepu ---

/*
UPDATE public.workers
SET shop_id=10
WHERE first_name = 'Albert' AND last_name = 'Adamczyk';
*/

--- Posiada podgląd na wszystkich pracowników ---

--SELECT * FROM workers;

--- Generuje raporty finansowe ---

/*
SELECT o.order_id, pr.shop_price 
FROM orders o,products pr 
WHERE order_date BETWEEN '2020-01-01' AND '2021-01-01';
*/

--------------- MANAGER ---------------

--- dodaje pracowników ---

--INSERT INTO workers VALUES(401,'Janusz','Zwierzak',3000,CURRENT_DATE,'kierownik',4,10);


--- ustala pensje ---

/*
UPDATE workers 
SET salary = 20000 
WHERE first_name = 'JANUSZ';
*/

--- zmienia status zamówienia z złożone -> przyjęte ---

--UPDATE orders set order_status = 2 where order_id = 2;

/* -------- PONIŻEJ NAPISANE, NIESPRAWDZONE CZY DZIAŁA ------------- */

--- Składanie zamówień do producenta ---

-- ???

--- Utworzenie kosztorysu zamówienia ---

-- ???

--- Tworzenie raportów finansowych ---

-- ???

--- Przeglądanie pracowników ---

/*
SELECT first_name, last_name, salary, employment_type 
FROM workers
WHERE manager_id = 1;
*/

--------------- PRACOWNIK ---------------

--- Wykonuje zamówienia ---

-- ???

--- Składa wniosek o uzupełnienie ---

-- Nie mamy na to tabeli??

--- Składa wniosek o podwyżkę ---

-- ???

--- Przyjmowanie towaru na stan sklepu ---

-- ???

--- Przeglądanie stanu magazynu ---

/*
SELECT product_name, quantity
FROM products
JOIN products_quantity
USING (product_id)
WHERE warehouse_id = 10;
*/

--- Zmiana statusu zamówienia ---

/*
UPDATE orders 
SET order_status = 3 
WHERE order_id = 2;

UPDATE orders 
SET order_status = 4 
WHERE order_id = 2;
*/

--------------- KLIENT ---------------

--- Składanie zamówienia ---

/*
INSERT INTO orders (client_id, products, shop_id, order_date, order_status)
VALUES (10,[1,1,2,3,4,6,7],2,GETDATE(),1);
*/

--- Wybór dokumentacji ---

-- nie ma na to pola???

--- Anuluje zamówienie ---

/*
DELETE FROM orders
WHERE order_id = 2 AND order_status = 1;
*/

--- Przeglądanie zamówień ---

/*
SELECT * 
FROM orders;
*/
