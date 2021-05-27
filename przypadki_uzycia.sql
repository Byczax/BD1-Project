--------------- SZEF ---------------

--- 1.Dodaje sklep ---

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

--- 2.Tworzy umowę - ustala zarobki ---

-- SELECT AVG(salary::numeric) FROM workers WHERE employment_type = 'magazynier';


--- 3.Przydziela pracownika do sklepu ---

/*
UPDATE public.workers
SET shop_id=10
WHERE first_name = 'Albert' AND last_name = 'Adamczyk';
*/

--- 4.Posiada podgląd na wszystkich pracowników ---

--SELECT * FROM workers;

--- 5.Generuje raporty finansowe ---

/*
SELECT o.order_id, pr.shop_price 
FROM orders o,products pr 
WHERE order_date BETWEEN '2020-01-01' AND '2021-01-01';
*/

--------------- MANAGER ---------------

--- 6.dodaje pracowników ---

--INSERT INTO workers VALUES(401,'Janusz','Zwierzak',3000,CURRENT_DATE,'kierownik',4,10);


--- 7.ustala pensje ---

/*
UPDATE workers 
SET salary = 20000 
WHERE first_name = 'JANUSZ';
*/

--- 8.zmienia status zamówienia z złożone -> przyjęte ---

--UPDATE orders set order_status = 2 where order_id = 2;



--- 9.Składanie zamówień do producenta ---

-- ???

--- 10.Utworzenie kosztorysu zamówienia ---

-- ???

--- 11.Tworzenie raportów finansowych ---

-- ???

/* -------- PONIŻEJ NAPISANE, NIESPRAWDZONE CZY DZIAŁA ------------- */

--- 12.Przeglądanie pracowników ---

/*DZIAŁA
SELECT first_name, last_name, salary, employment_type 
FROM workers
WHERE manager_id = 1;
*/

--------------- PRACOWNIK ---------------

--- 13.Wykonuje zamówienia ---

-- ???

--- 14.Składa wniosek o uzupełnienie ---

-- Nie mamy na to tabeli??

--- 15.Składa wniosek o podwyżkę ---

-- ???

--- 16.Przyjmowanie towaru na stan sklepu ---

-- ???

--- 17.Przeglądanie stanu magazynu ---

/* NIE DZIAŁA
SELECT product_name, quantity
FROM products
JOIN products_quantity
USING (product_id)
WHERE warehouse_id = 10;
*/

--- 18.Zmiana statusu zamówienia ---

/* JEST IDENTYCZNE JAK KOD POWYŻEJ WIĘĆ CHYBA DZIAŁA
UPDATE orders 
SET order_status = 3 
WHERE order_id = 2;

UPDATE orders 
SET order_status = 4 
WHERE order_id = 2;
*/

--------------- KLIENT ---------------

--- 19.Składanie zamówienia ---

/*
INSERT INTO orders (client_id, products, shop_id, order_date, order_status)
VALUES (10,[1,1,2,3,4,6,7],2,GETDATE(),1);
*/

--- 20.Wybór dokumentacji ---

-- nie ma na to pola???

--- 21.Anuluje zamówienie ---

/*
DELETE FROM orders
WHERE order_id = 2 AND order_status = 1;
*/

--- 22.Przeglądanie zamówień ---

/* DZIAŁA
SELECT * 
FROM orders
WHERE client_id = 10;
*/
