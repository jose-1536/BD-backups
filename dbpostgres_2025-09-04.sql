--
-- PostgreSQL database dump
--

\restrict 3su9lpJMOVPAc9dzKd0ac9csG0xlxef4iWsyLlPfbMbVpIwARlvaXQ0kBqrQzsZ

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 16.10 (Debian 16.10-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(80) NOT NULL,
    address character varying(40) NOT NULL,
    email character varying(120) NOT NULL
);


ALTER TABLE public.customers OWNER TO jose;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_id_seq OWNER TO jose;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: phones; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.phones (
    id integer NOT NULL,
    customer_id integer
);


ALTER TABLE public.phones OWNER TO jose;

--
-- Name: phones_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.phones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.phones_id_seq OWNER TO jose;

--
-- Name: phones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.phones_id_seq OWNED BY public.phones.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    purchase_price numeric NOT NULL,
    sale_price numeric NOT NULL,
    quantity numeric NOT NULL
);


ALTER TABLE public.products OWNER TO jose;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO jose;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: products_sales; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.products_sales (
    product_id integer NOT NULL,
    sale_id integer NOT NULL
);


ALTER TABLE public.products_sales OWNER TO jose;

--
-- Name: products_suppliers; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.products_suppliers (
    product_id integer NOT NULL,
    supplier_id integer NOT NULL
);


ALTER TABLE public.products_suppliers OWNER TO jose;

--
-- Name: sales; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.sales (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    date date NOT NULL,
    subtotal numeric NOT NULL,
    vat numeric NOT NULL,
    discount numeric NOT NULL,
    total numeric NOT NULL,
    customer_id integer
);


ALTER TABLE public.sales OWNER TO jose;

--
-- Name: sales_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_id_seq OWNER TO jose;

--
-- Name: sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.suppliers (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(40) NOT NULL,
    phone character varying(10) NOT NULL,
    email character varying(120) NOT NULL
);


ALTER TABLE public.suppliers OWNER TO jose;

--
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.suppliers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suppliers_id_seq OWNER TO jose;

--
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.suppliers_id_seq OWNED BY public.suppliers.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: phones id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.phones ALTER COLUMN id SET DEFAULT nextval('public.phones_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: sales id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);


--
-- Name: suppliers id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN id SET DEFAULT nextval('public.suppliers_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.customers (id, first_name, last_name, address, email) FROM stdin;
\.


--
-- Data for Name: phones; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.phones (id, customer_id) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.products (id, name, purchase_price, sale_price, quantity) FROM stdin;
\.


--
-- Data for Name: products_sales; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.products_sales (product_id, sale_id) FROM stdin;
\.


--
-- Data for Name: products_suppliers; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.products_suppliers (product_id, supplier_id) FROM stdin;
\.


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.sales (id, name, date, subtotal, vat, discount, total, customer_id) FROM stdin;
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.suppliers (id, name, address, phone, email) FROM stdin;
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


--
-- Name: phones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.phones_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.sales_id_seq', 1, false);


--
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.suppliers_id_seq', 1, false);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: phones phones_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT phones_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products_sales products_sales_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.products_sales
    ADD CONSTRAINT products_sales_pkey PRIMARY KEY (product_id, sale_id);


--
-- Name: products_suppliers products_suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.products_suppliers
    ADD CONSTRAINT products_suppliers_pkey PRIMARY KEY (product_id, supplier_id);


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: phones phones_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT phones_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: products_sales products_sales_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.products_sales
    ADD CONSTRAINT products_sales_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: products_sales products_sales_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.products_sales
    ADD CONSTRAINT products_sales_sale_id_fkey FOREIGN KEY (sale_id) REFERENCES public.sales(id);


--
-- Name: products_suppliers products_suppliers_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.products_suppliers
    ADD CONSTRAINT products_suppliers_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: products_suppliers products_suppliers_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.products_suppliers
    ADD CONSTRAINT products_suppliers_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.suppliers(id);


--
-- Name: sales sales_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- PostgreSQL database dump complete
--

\unrestrict 3su9lpJMOVPAc9dzKd0ac9csG0xlxef4iWsyLlPfbMbVpIwARlvaXQ0kBqrQzsZ

