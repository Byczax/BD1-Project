--szef dodaje sklep
--DELETE FROM public.warehouses
--	WHERE city = 'Wrocław' AND street_address = 'Dworcowa';
--DELETE FROM public.shops
--	WHERE city = 'Wrocław' AND street_address = 'Sucha 2';
--INSERT INTO public.warehouses(
--	warehouse_id, city, street_address, postal_code)
--	VALUES (((SELECT MAX(warehouse_id)  FROM warehouses) + 1), 'Wrocław', 'Dworcowa', '50-31');
--INSERT INTO public.shops(
--	shop_id, surface, warehouse_id, city, street_address, postal_code)
--	VALUES (((SELECT MAX(shop_id) FROM shops)+1),100,(SELECT warehouse_id FROM warehouses WHERE city = 'Wrocław' AND street_address = 'Dworcowa'),'Wrocław','Sucha 2','50-530');

--szef tworzy umowę - ustala zarobki

-- SELECT AVG(salary::numeric) FROM workers WHERE employment_type = 'magazynier';

--szef przydziela pracownika do sklepu

-- UPDATE public.workers
-- 	SET shop_id=10
-- 	WHERE first_name = 'Albert' AND last_name = 'Adamczyk';

--Posiada podgląd na wszystkich pracowników

--SELECT * FROM workers;

--Generuje raporty finansowe

--SELECT o.order_id, pr.shop_price FROM orders o,products pr where order_date BETWEEN '2020-01-01' AND '2021-01-01';