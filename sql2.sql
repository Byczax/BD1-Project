-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;

DROP TABLE IF EXISTS public.client_addresses CASCADE;
DROP TABLE IF EXISTS public.clients CASCADE;
DROP TABLE IF EXISTS public.orders CASCADE;
DROP TABLE IF EXISTS public.product_orders CASCADE;
DROP TABLE IF EXISTS public.products CASCADE;
DROP TABLE IF EXISTS public.products_quantity CASCADE;
DROP TABLE IF EXISTS public.shops CASCADE;
DROP TABLE IF EXISTS public.shop_warehouses CASCADE;
DROP TABLE IF EXISTS public.suppliers CASCADE;
DROP TABLE IF EXISTS public.warehouses CASCADE;
DROP TABLE IF EXISTS public.workers CASCADE;

CREATE TABLE public.products
(
    product_id serial NOT NULL,
    product_name name NOT NULL,
    production_date date NOT NULL,
    factory_price money NOT NULL,
    shop_price money NOT NULL,
    suplier_id integer NOT NULL,
    PRIMARY KEY (product_id),
	UNIQUE(suplier_id)
);

CREATE TABLE public.workers
(
    worker_id serial NOT NULL,
    first_name name NOT NULL,
    last_name name NOT NULL,
    salary money NOT NULL,
    hire_date date NOT NULL,
    employment_type text NOT NULL,
    manager_id serial NOT NULL,
    shop_id integer NOT NULL,
    orders integer,
    PRIMARY KEY (worker_id),
	UNIQUE(manager_id,shop_id)
);

CREATE TABLE public.shops
(
    shop_id serial NOT NULL,
    surface integer NOT NULL,
    warehouse_id integer NOT NULL,
    city text NOT NULL,
    street_address text NOT NULL,
    postal_code text NOT NULL,
    PRIMARY KEY (shop_id),
	UNIQUE(warehouse_id)
);

CREATE TABLE public.clients
(
    client_id serial NOT NULL,
    addres_id integer NOT NULL,
    phone "char"[] NOT NULL,
    login text NOT NULL,
    password text NOT NULL,
    "NIP" character varying NOT NULL,
    order_id integer,
    PRIMARY KEY (client_id),
	UNIQUE (addres_id,order_id)
);

CREATE TABLE public.orders
(
    order_id serial NOT NULL,
    client_id integer NOT NULL,
    products integer[] NOT NULL,
    shop_id numeric NOT NULL,
    order_date date NOT NULL,
    order_status integer NOT NULL,
    PRIMARY KEY (order_id),
	UNIQUE(client_id,shop_id)
);

CREATE TABLE public.product_orders
(
    "PRODUCTS_product_id" integer NOT NULL,
    "ORDERS_order_id" serial NOT NULL
);

CREATE TABLE public.warehouses
(
    warehouse_id serial NOT NULL,
    city text NOT NULL,
    street_address text NOT NULL,
    postal_code text NOT NULL,
    PRIMARY KEY (warehouse_id)
);

CREATE TABLE public.suppliers
(
    supplier_id serial NOT NULL,
    name text NOT NULL,
    product_id integer NOT NULL,
    PRIMARY KEY (supplier_id)
);

CREATE TABLE public.client_addresses
(
    addres_id serial NOT NULL,
    city text NOT NULL,
    street_addres text NOT NULL,
    postal_code text NOT NULL,
    description text NOT NULL,
    PRIMARY KEY (addres_id)
);

CREATE TABLE public.products_quantity
(
    warehouse_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer
);

CREATE TABLE public.shop_warehouses
(
    shop_warehouse_id integer NOT NULL,
    warehouse_warehouse_id serial NOT NULL
);

ALTER TABLE public.product_orders
    ADD FOREIGN KEY ("PRODUCTS_product_id")
    REFERENCES public.products (product_id)
    NOT VALID;


ALTER TABLE public.product_orders
    ADD FOREIGN KEY ("ORDERS_order_id")
    REFERENCES public.orders (order_id)
    NOT VALID;


ALTER TABLE public.clients
    ADD FOREIGN KEY (order_id)
    REFERENCES public.orders (order_id)
    NOT VALID;


ALTER TABLE public.suppliers
    ADD FOREIGN KEY (supplier_id)
    REFERENCES public.products (suplier_id)
    NOT VALID;


ALTER TABLE public.products_quantity
    ADD FOREIGN KEY (product_id)
    REFERENCES public.products (product_id)
    NOT VALID;


ALTER TABLE public.products_quantity
    ADD FOREIGN KEY (warehouse_id)
    REFERENCES public.warehouses (warehouse_id)
    NOT VALID;


ALTER TABLE public.shop_warehouses
    ADD FOREIGN KEY (shop_warehouse_id)
    REFERENCES public.shops (warehouse_id)
    NOT VALID;


ALTER TABLE public.shop_warehouses
    ADD FOREIGN KEY (warehouse_warehouse_id)
    REFERENCES public.warehouses (warehouse_id)
    NOT VALID;


ALTER TABLE public.workers
    ADD FOREIGN KEY (orders)
    REFERENCES public.orders (order_id)
    NOT VALID;


ALTER TABLE public.clients
    ADD FOREIGN KEY (addres_id)
    REFERENCES public.client_addresses (addres_id)
    NOT VALID;

END;