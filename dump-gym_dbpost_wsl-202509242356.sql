--
-- PostgreSQL database dump
--

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-09-24 23:56:55

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3509 (class 1262 OID 24780)
-- Name: gym_dbpost_wsl; Type: DATABASE; Schema: -; Owner: jose
--

CREATE DATABASE gym_dbpost_wsl WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE gym_dbpost_wsl OWNER TO jose;

\connect gym_dbpost_wsl

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 232 (class 1255 OID 24889)
-- Name: sp_member_plan_trainer(); Type: PROCEDURE; Schema: public; Owner: jose
--

CREATE PROCEDURE public.sp_member_plan_trainer()
    LANGUAGE plpgsql
    AS $$
BEGIN
    RAISE NOTICE 'Listado de miembros con plan y entrenador:';
    PERFORM 
        m.name AS member_name,
        p.name AS plan_name,
        t.name AS trainer_name
    FROM members m
    JOIN memberships ms ON m.id = ms.member_id
    JOIN plans p ON ms.plan_id = p.id
    JOIN trainers t ON ms.trainer_id = t.id;
END;
$$;


ALTER PROCEDURE public.sp_member_plan_trainer() OWNER TO jose;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 24839)
-- Name: attendances; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.attendances (
    id integer NOT NULL,
    attendance_date date NOT NULL,
    member_id integer
);


ALTER TABLE public.attendances OWNER TO jose;

--
-- TOC entry 225 (class 1259 OID 24838)
-- Name: attendances_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.attendances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attendances_id_seq OWNER TO jose;

--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 225
-- Name: attendances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.attendances_id_seq OWNED BY public.attendances.id;


--
-- TOC entry 230 (class 1259 OID 24868)
-- Name: exercises; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.exercises (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(200),
    muscle_group character varying(50)
);


ALTER TABLE public.exercises OWNER TO jose;

--
-- TOC entry 229 (class 1259 OID 24867)
-- Name: exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.exercises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exercises_id_seq OWNER TO jose;

--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 229
-- Name: exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.exercises_id_seq OWNED BY public.exercises.id;


--
-- TOC entry 216 (class 1259 OID 24782)
-- Name: members; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.members (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
    address character varying(100)
);


ALTER TABLE public.members OWNER TO jose;

--
-- TOC entry 215 (class 1259 OID 24781)
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_id_seq OWNER TO jose;

--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 215
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- TOC entry 222 (class 1259 OID 24803)
-- Name: memberships; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.memberships (
    id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    member_id integer,
    plan_id integer,
    trainer_id integer
);


ALTER TABLE public.memberships OWNER TO jose;

--
-- TOC entry 221 (class 1259 OID 24802)
-- Name: memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.memberships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.memberships_id_seq OWNER TO jose;

--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 221
-- Name: memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.memberships_id_seq OWNED BY public.memberships.id;


--
-- TOC entry 224 (class 1259 OID 24825)
-- Name: payments; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    amount numeric(10,2) NOT NULL,
    payment_date date NOT NULL,
    membership_id integer
);


ALTER TABLE public.payments OWNER TO jose;

--
-- TOC entry 223 (class 1259 OID 24824)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO jose;

--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 223
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- TOC entry 220 (class 1259 OID 24796)
-- Name: plans; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.plans (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(200),
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.plans OWNER TO jose;

--
-- TOC entry 219 (class 1259 OID 24795)
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plans_id_seq OWNER TO jose;

--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 219
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.plans_id_seq OWNED BY public.plans.id;


--
-- TOC entry 231 (class 1259 OID 24874)
-- Name: routine_exercises; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.routine_exercises (
    routine_id integer NOT NULL,
    exercise_id integer NOT NULL
);


ALTER TABLE public.routine_exercises OWNER TO jose;

--
-- TOC entry 228 (class 1259 OID 24851)
-- Name: routines; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.routines (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(200),
    member_id integer,
    trainer_id integer
);


ALTER TABLE public.routines OWNER TO jose;

--
-- TOC entry 227 (class 1259 OID 24850)
-- Name: routines_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.routines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.routines_id_seq OWNER TO jose;

--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 227
-- Name: routines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.routines_id_seq OWNED BY public.routines.id;


--
-- TOC entry 218 (class 1259 OID 24789)
-- Name: trainers; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.trainers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    specialty character varying(80)
);


ALTER TABLE public.trainers OWNER TO jose;

--
-- TOC entry 217 (class 1259 OID 24788)
-- Name: trainers_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.trainers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trainers_id_seq OWNER TO jose;

--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 217
-- Name: trainers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.trainers_id_seq OWNED BY public.trainers.id;


--
-- TOC entry 3312 (class 2604 OID 24842)
-- Name: attendances id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.attendances ALTER COLUMN id SET DEFAULT nextval('public.attendances_id_seq'::regclass);


--
-- TOC entry 3314 (class 2604 OID 24871)
-- Name: exercises id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.exercises ALTER COLUMN id SET DEFAULT nextval('public.exercises_id_seq'::regclass);


--
-- TOC entry 3307 (class 2604 OID 24785)
-- Name: members id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- TOC entry 3310 (class 2604 OID 24806)
-- Name: memberships id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.memberships ALTER COLUMN id SET DEFAULT nextval('public.memberships_id_seq'::regclass);


--
-- TOC entry 3311 (class 2604 OID 24828)
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- TOC entry 3309 (class 2604 OID 24799)
-- Name: plans id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.plans ALTER COLUMN id SET DEFAULT nextval('public.plans_id_seq'::regclass);


--
-- TOC entry 3313 (class 2604 OID 24854)
-- Name: routines id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.routines ALTER COLUMN id SET DEFAULT nextval('public.routines_id_seq'::regclass);


--
-- TOC entry 3308 (class 2604 OID 24792)
-- Name: trainers id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.trainers ALTER COLUMN id SET DEFAULT nextval('public.trainers_id_seq'::regclass);


--
-- TOC entry 3498 (class 0 OID 24839)
-- Dependencies: 226
-- Data for Name: attendances; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.attendances (id, attendance_date, member_id) FROM stdin;
1	2025-04-21	1
2	2025-05-06	2
3	2025-01-23	3
4	2025-11-22	4
5	2025-07-23	5
6	2025-07-18	6
7	2025-04-19	7
8	2025-02-09	8
9	2025-12-05	9
10	2025-09-19	10
11	2025-01-25	11
12	2025-05-21	12
13	2025-07-05	13
14	2025-04-16	14
15	2025-12-02	15
16	2025-01-20	16
17	2025-05-05	17
18	2025-12-08	18
19	2025-10-23	19
20	2025-12-22	20
21	2025-09-19	21
22	2025-06-10	22
23	2025-12-02	23
24	2025-09-29	24
25	2025-06-06	25
26	2025-04-26	26
27	2025-03-04	27
28	2025-04-13	28
29	2025-05-06	29
30	2025-02-23	30
31	2025-04-04	31
32	2025-09-25	32
33	2025-11-19	33
34	2025-07-19	34
35	2025-04-19	35
36	2025-09-09	36
37	2025-07-09	37
38	2025-11-27	38
39	2025-09-30	39
40	2025-10-19	40
41	2025-02-25	41
42	2025-08-24	42
43	2025-10-16	43
44	2025-06-04	44
45	2025-12-06	45
46	2025-12-16	46
47	2025-04-09	47
48	2025-12-17	48
49	2025-03-09	49
50	2025-03-07	50
51	2025-01-25	51
52	2025-07-27	52
53	2025-06-27	53
54	2025-06-05	54
55	2025-06-01	55
56	2025-03-06	56
57	2025-07-07	57
58	2025-04-02	58
59	2025-06-29	59
60	2025-12-25	60
61	2025-11-08	1
62	2025-08-28	2
63	2025-07-23	3
64	2025-02-20	4
65	2025-01-09	5
66	2025-12-04	6
67	2025-09-07	7
68	2025-11-09	8
69	2025-05-28	9
70	2025-07-19	10
71	2025-12-04	11
72	2025-11-04	12
73	2025-10-11	13
74	2025-11-30	14
75	2025-05-29	15
76	2025-02-19	16
77	2025-06-13	17
78	2025-09-19	18
79	2025-05-17	19
80	2025-05-12	20
81	2025-07-08	21
82	2025-07-14	22
83	2025-04-08	23
84	2025-02-20	24
85	2025-05-06	25
86	2025-02-20	26
87	2025-05-11	27
88	2025-12-12	28
89	2025-09-15	29
90	2025-01-25	30
91	2025-11-11	31
92	2025-04-27	32
93	2025-06-14	33
94	2025-10-31	34
95	2025-07-25	35
96	2025-12-18	36
97	2025-11-11	37
98	2025-06-17	38
99	2025-02-03	39
100	2025-02-17	40
101	2025-08-19	41
102	2025-11-02	42
103	2025-07-28	43
104	2025-08-06	44
105	2025-08-07	45
106	2025-10-14	46
107	2025-08-15	47
108	2025-11-18	48
109	2025-03-29	49
110	2025-11-09	50
111	2025-08-24	51
112	2025-09-21	52
113	2025-02-20	53
114	2025-07-23	54
115	2025-09-21	55
116	2025-05-21	56
117	2025-02-19	57
118	2025-02-20	58
119	2025-12-10	59
120	2025-08-24	60
\.


--
-- TOC entry 3502 (class 0 OID 24868)
-- Dependencies: 230
-- Data for Name: exercises; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.exercises (id, name, description, muscle_group) FROM stdin;
1	Push Up	Push up exercise	Chest
2	Squat	Squat exercise	Legs
3	Plank	Plank exercise	Core
4	Lunge	Lunge exercise	Legs
5	Bicep Curl	Bicep exercise	Arms
6	Jumping Jacks	Cardio warmup	Full Body
7	Burpees	Full body exercise	Full Body
8	Sit Up	Abdominal exercise	Core
9	Bench Press	Chest exercise	Chest
10	Deadlift	Back and legs	Back
\.


--
-- TOC entry 3488 (class 0 OID 24782)
-- Dependencies: 216
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.members (id, name, email, phone, address) FROM stdin;
1	Jose Fernandez	jose1@mail.com	3001000001	Calle 1
2	Maria Lopez	maria2@mail.com	3001000002	Calle 2
3	Andres Gomez	andres3@mail.com	3001000003	Calle 3
4	Luisa Martinez	luisa4@mail.com	3001000004	Calle 4
5	Carlos Torres	carlos5@mail.com	3001000005	Calle 5
6	Ana Ramirez	ana6@mail.com	3001000006	Calle 6
7	Miguel Sanchez	miguel7@mail.com	3001000007	Calle 7
8	Sofia Diaz	sofia8@mail.com	3001000008	Calle 8
9	Luis Herrera	luis9@mail.com	3001000009	Calle 9
10	Camila Morales	camila10@mail.com	3001000010	Calle 10
11	Jorge Rojas	jorge11@mail.com	3001000011	Calle 11
12	Paula Castillo	paula12@mail.com	3001000012	Calle 12
13	Daniel Alvarez	daniel13@mail.com	3001000013	Calle 13
14	Valeria Sanchez	valeria14@mail.com	3001000014	Calle 14
15	Andres Molina	andres15@mail.com	3001000015	Calle 15
16	Carolina Herrera	carolina16@mail.com	3001000016	Calle 16
17	Diego Gomez	diego17@mail.com	3001000017	Calle 17
18	Laura Perez	laura18@mail.com	3001000018	Calle 18
19	Ricardo Diaz	ricardo19@mail.com	3001000019	Calle 19
20	Andrea Morales	andrea20@mail.com	3001000020	Calle 20
21	Felipe Torres	felipe21@mail.com	3001000021	Calle 21
22	Natalia Martinez	natalia22@mail.com	3001000022	Calle 22
23	Javier Ramirez	javier23@mail.com	3001000023	Calle 23
24	Karen Castillo	karen24@mail.com	3001000024	Calle 24
25	Esteban Alvarez	esteban25@mail.com	3001000025	Calle 25
26	Daniela Sanchez	daniela26@mail.com	3001000026	Calle 26
27	Mario Molina	mario27@mail.com	3001000027	Calle 27
28	Monica Herrera	monica28@mail.com	3001000028	Calle 28
29	Andres Diaz	andres29@mail.com	3001000029	Calle 29
30	Sofia Morales	sofia30@mail.com	3001000030	Calle 30
31	Juan Perez	juan31@mail.com	3001000031	Calle 31
32	Paula Lopez	paula32@mail.com	3001000032	Calle 32
33	Carlos Gomez	carlos33@mail.com	3001000033	Calle 33
34	Ana Martinez	ana34@mail.com	3001000034	Calle 34
35	Miguel Torres	miguel35@mail.com	3001000035	Calle 35
36	Sofia Ramirez	sofia36@mail.com	3001000036	Calle 36
37	Luis Fernandez	luis37@mail.com	3001000037	Calle 37
38	Camila Diaz	camila38@mail.com	3001000038	Calle 38
39	Jorge Morales	jorge39@mail.com	3001000039	Calle 39
40	Paula Perez	paula40@mail.com	3001000040	Calle 40
41	Daniel Gomez	daniel41@mail.com	3001000041	Calle 41
42	Valeria Martinez	valeria42@mail.com	3001000042	Calle 42
43	Andres Ramirez	andres43@mail.com	3001000043	Calle 43
44	Carolina Sanchez	carolina44@mail.com	3001000044	Calle 44
45	Diego Herrera	diego45@mail.com	3001000045	Calle 45
46	Laura Diaz	laura46@mail.com	3001000046	Calle 46
47	Ricardo Morales	ricardo47@mail.com	3001000047	Calle 47
48	Andrea Perez	andrea48@mail.com	3001000048	Calle 48
49	Felipe Lopez	felipe49@mail.com	3001000049	Calle 49
50	Natalia Gomez	natalia50@mail.com	3001000050	Calle 50
51	Javier Martinez	javier51@mail.com	3001000051	Calle 51
52	Karen Torres	karen52@mail.com	3001000052	Calle 52
53	Esteban Ramirez	esteban53@mail.com	3001000053	Calle 53
54	Daniela Herrera	daniela54@mail.com	3001000054	Calle 54
55	Mario Diaz	mario55@mail.com	3001000055	Calle 55
56	Monica Morales	monica56@mail.com	3001000056	Calle 56
57	Andres Perez	andres57@mail.com	3001000057	Calle 57
58	Sofia Lopez	sofia58@mail.com	3001000058	Calle 58
59	Juan Gomez	juan59@mail.com	3001000059	Calle 59
60	Paula Martinez	paula60@mail.com	3001000060	Calle 60
\.


--
-- TOC entry 3494 (class 0 OID 24803)
-- Dependencies: 222
-- Data for Name: memberships; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.memberships (id, start_date, end_date, member_id, plan_id, trainer_id) FROM stdin;
1	2025-09-10	2025-10-05	1	2	5
2	2025-04-21	2025-08-04	2	2	2
3	2025-10-05	2025-02-18	3	2	1
4	2025-04-20	2025-04-14	4	2	1
5	2025-12-02	2025-07-27	5	2	2
6	2025-12-29	2025-10-06	6	1	1
7	2025-12-21	2025-05-03	7	1	1
8	2025-10-03	2025-07-23	8	1	4
9	2025-07-27	2025-12-31	9	2	4
10	2025-12-18	2025-03-29	10	3	1
11	2025-01-27	2025-06-03	11	1	5
12	2025-03-24	2025-10-12	12	1	4
13	2025-10-25	2025-10-27	13	3	2
14	2025-11-24	2025-09-02	14	3	3
15	2025-10-28	2025-09-28	15	1	4
16	2025-11-03	2025-02-03	16	3	1
17	2025-05-31	2025-10-08	17	1	3
18	2025-12-16	2025-05-16	18	1	1
19	2025-11-26	2026-01-14	19	3	4
20	2025-09-08	2025-05-21	20	3	3
21	2025-12-23	2025-02-12	21	1	5
22	2025-08-12	2025-12-22	22	2	5
23	2025-04-28	2025-12-09	23	3	4
24	2025-07-11	2025-10-07	24	2	5
25	2025-11-27	2025-12-10	25	2	5
26	2025-02-13	2025-04-24	26	3	2
27	2025-04-26	2025-04-21	27	2	2
28	2025-12-07	2025-08-12	28	3	5
29	2025-02-23	2026-01-28	29	1	4
30	2025-07-04	2025-05-22	30	2	3
31	2025-10-20	2025-10-02	31	2	5
32	2025-02-28	2025-09-21	32	2	3
33	2025-03-21	2025-03-03	33	1	1
34	2025-06-27	2026-01-10	34	1	1
35	2025-02-15	2026-01-02	35	2	1
36	2025-07-10	2025-12-11	36	1	4
37	2025-01-29	2025-07-05	37	2	4
38	2025-12-30	2025-02-05	38	3	2
39	2025-10-01	2025-12-29	39	1	5
40	2025-12-19	2025-11-10	40	2	3
41	2025-11-12	2025-12-26	41	2	3
42	2025-06-10	2025-04-14	42	3	2
43	2025-07-15	2025-08-23	43	1	4
44	2025-08-16	2025-11-17	44	3	1
45	2025-07-03	2025-10-08	45	1	1
46	2025-04-03	2025-11-03	46	2	4
47	2025-04-13	2025-03-02	47	1	5
48	2025-01-20	2025-09-26	48	2	2
49	2025-06-25	2025-05-08	49	3	4
50	2025-12-13	2025-10-10	50	3	1
51	2025-11-28	2025-08-24	51	3	1
52	2025-02-10	2025-09-12	52	1	3
53	2025-05-18	2025-06-03	53	1	3
54	2025-02-12	2025-11-30	54	2	4
55	2025-03-21	2026-01-02	55	2	2
56	2025-04-17	2025-09-30	56	2	3
57	2025-11-21	2025-10-31	57	2	5
58	2025-02-28	2025-03-30	58	1	3
59	2025-12-27	2025-07-28	59	2	5
60	2025-04-24	2026-01-13	60	3	2
\.


--
-- TOC entry 3496 (class 0 OID 24825)
-- Dependencies: 224
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.payments (id, amount, payment_date, membership_id) FROM stdin;
1	80.00	2025-12-03	1
2	80.00	2025-05-18	2
3	80.00	2025-04-06	3
4	80.00	2025-11-02	4
5	80.00	2025-04-14	5
6	50.00	2025-03-16	6
7	50.00	2025-04-25	7
8	50.00	2025-03-09	8
9	80.00	2025-08-06	9
10	120.00	2025-07-15	10
11	50.00	2025-12-24	11
12	50.00	2025-07-24	12
13	120.00	2025-12-09	13
14	120.00	2025-06-28	14
15	50.00	2025-10-12	15
16	120.00	2025-02-06	16
17	50.00	2025-12-29	17
18	50.00	2025-04-02	18
19	120.00	2025-07-14	19
20	120.00	2025-08-30	20
21	50.00	2025-02-23	21
22	80.00	2025-08-18	22
23	120.00	2025-09-06	23
24	80.00	2025-11-21	24
25	80.00	2025-12-13	25
26	120.00	2025-01-20	26
27	80.00	2025-10-21	27
28	120.00	2025-03-07	28
29	50.00	2025-12-12	29
30	80.00	2025-06-14	30
31	80.00	2025-05-19	31
32	80.00	2025-09-18	32
33	50.00	2025-11-02	33
34	50.00	2025-03-27	34
35	80.00	2025-11-09	35
36	50.00	2025-03-09	36
37	80.00	2025-05-03	37
38	120.00	2025-04-29	38
39	50.00	2025-11-19	39
40	80.00	2025-12-19	40
41	80.00	2025-02-06	41
42	120.00	2025-01-13	42
43	50.00	2025-07-13	43
44	120.00	2025-05-02	44
45	50.00	2025-12-31	45
46	80.00	2025-02-04	46
47	50.00	2025-06-19	47
48	80.00	2025-02-03	48
49	120.00	2025-05-04	49
50	120.00	2025-08-14	50
51	120.00	2025-08-20	51
52	50.00	2025-10-05	52
53	50.00	2025-01-08	53
54	80.00	2025-06-26	54
55	80.00	2025-03-11	55
56	80.00	2025-05-20	56
57	80.00	2025-05-23	57
58	50.00	2025-09-15	58
59	80.00	2025-09-02	59
60	120.00	2025-02-19	60
\.


--
-- TOC entry 3492 (class 0 OID 24796)
-- Dependencies: 220
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.plans (id, name, description, price) FROM stdin;
1	Basic	Acceso al gimnasio 3 veces por semana	50.00
2	Standard	Acceso ilimitado al gimnasio	80.00
3	Premium	Acceso ilimitado + clases grupales	120.00
\.


--
-- TOC entry 3503 (class 0 OID 24874)
-- Dependencies: 231
-- Data for Name: routine_exercises; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.routine_exercises (routine_id, exercise_id) FROM stdin;
25	10
41	8
32	5
54	4
1	1
59	2
6	2
6	9
17	8
50	7
49	8
35	7
1	5
19	2
7	7
30	6
19	8
21	2
48	3
4	2
26	1
52	1
34	8
38	10
25	1
16	10
36	10
31	7
56	5
15	6
25	9
8	6
13	9
39	4
56	6
36	9
19	4
20	2
47	6
6	6
33	6
4	3
50	5
33	8
29	3
46	7
60	9
24	8
18	7
17	5
13	4
38	8
15	7
28	7
46	6
57	5
42	7
5	3
50	10
22	7
45	4
10	6
28	1
47	8
15	5
39	7
50	4
3	7
20	8
49	5
15	8
3	10
40	7
51	9
24	10
51	2
2	5
18	9
40	1
13	2
43	2
25	7
16	6
22	8
37	8
4	8
5	4
31	3
53	6
31	6
37	6
3	9
35	10
26	3
42	2
56	3
22	2
24	9
23	7
19	1
32	6
9	5
21	3
14	4
9	10
53	10
45	10
5	9
25	5
48	8
30	8
21	4
54	2
57	8
27	5
39	10
15	3
39	3
18	8
8	5
24	4
1	4
41	4
9	9
37	3
10	3
58	8
31	8
44	7
51	6
1	10
9	1
31	9
11	1
14	8
18	2
12	5
29	6
3	2
2	8
20	5
30	7
1	2
33	10
12	9
8	7
28	2
51	7
11	3
53	8
17	7
59	10
38	6
25	3
45	3
42	9
13	10
20	6
44	2
23	6
36	1
6	1
59	9
12	8
38	5
38	3
1	8
53	9
44	6
52	3
14	3
15	10
36	7
1	9
52	8
37	2
54	6
17	1
32	4
49	1
2	2
3	1
33	5
17	3
47	9
31	2
4	10
32	10
52	7
41	5
12	3
54	8
45	6
22	1
21	10
8	3
10	4
25	2
52	2
26	9
28	8
55	2
51	5
5	6
10	1
5	10
13	6
37	5
16	7
46	10
29	1
2	10
30	3
36	4
12	7
20	7
43	9
24	1
27	2
53	2
13	3
58	10
8	1
38	2
2	7
37	4
19	10
32	9
57	7
16	3
41	9
43	3
29	10
18	6
40	5
47	4
28	5
54	7
47	3
38	4
25	8
22	5
44	10
1	3
56	10
31	4
56	1
43	8
19	5
14	5
29	2
8	8
39	8
38	1
17	10
58	6
34	5
5	5
9	6
28	6
6	10
51	3
48	7
52	4
12	1
48	9
43	10
35	1
23	9
36	2
45	2
37	10
4	6
51	10
26	6
43	7
8	9
14	9
39	5
47	1
49	3
34	10
46	1
26	4
7	5
23	10
15	9
45	5
11	4
60	8
11	7
2	1
10	9
43	6
5	7
28	3
33	9
20	9
47	10
14	6
46	2
54	5
26	7
24	6
44	8
36	6
14	2
9	4
41	7
36	5
45	1
16	4
13	5
42	3
48	6
7	1
56	2
50	3
9	3
55	4
6	5
11	8
50	1
46	5
25	6
4	5
49	7
27	8
46	3
50	2
41	2
11	5
40	3
60	6
54	10
2	9
21	7
46	4
1	6
53	4
32	3
36	3
43	5
40	6
20	3
28	9
55	8
5	8
44	5
35	6
49	2
43	1
20	4
42	1
54	1
27	10
56	7
34	1
3	6
52	5
6	4
23	1
42	5
38	9
29	8
7	10
27	9
50	6
33	3
39	2
60	3
19	7
48	4
50	9
30	10
58	4
17	6
59	8
17	4
29	5
30	4
4	1
26	10
54	3
6	3
22	9
47	2
7	6
23	8
39	6
51	8
44	1
18	4
29	4
47	5
23	2
30	9
33	7
34	9
10	7
59	1
14	7
49	10
30	2
34	2
2	6
22	10
5	1
45	8
55	9
6	8
19	3
14	10
18	1
18	10
42	4
24	7
42	6
27	4
21	5
33	1
40	10
32	7
41	3
37	7
12	10
48	5
31	5
60	5
58	2
9	8
28	4
32	2
12	4
7	8
57	4
55	7
9	7
51	1
37	9
34	4
25	4
23	3
58	7
41	1
35	4
53	5
44	9
55	1
41	10
52	9
10	8
57	2
10	2
32	8
16	8
7	4
35	9
12	2
11	6
49	9
11	9
16	9
55	5
54	9
23	4
3	4
45	7
53	1
19	6
33	4
34	7
9	2
41	6
52	10
59	5
30	5
27	6
27	1
55	3
7	3
35	8
5	2
35	3
8	4
60	7
56	4
35	2
22	3
1	7
33	2
56	8
11	2
26	8
60	10
57	3
38	7
15	1
42	8
19	9
23	5
57	10
17	9
21	6
57	6
48	1
10	5
8	10
39	1
34	3
36	8
13	1
13	7
40	8
13	8
56	9
37	1
31	10
55	6
58	1
30	1
22	6
60	4
59	7
16	5
53	3
29	7
31	1
39	9
46	9
46	8
7	2
2	3
3	3
57	1
24	3
55	10
44	3
12	6
49	6
24	5
60	2
49	4
4	9
4	7
40	4
21	8
58	9
47	7
15	2
28	10
40	9
16	1
8	2
48	10
59	3
59	4
6	7
51	4
26	5
20	10
58	5
40	2
21	1
52	6
50	8
18	3
18	5
4	4
34	6
57	9
10	10
59	6
29	9
44	4
43	4
2	4
48	2
45	9
3	5
35	5
42	10
20	1
58	3
21	9
22	4
24	2
60	1
27	7
32	1
14	1
11	10
17	2
27	3
7	9
26	2
3	8
53	7
15	4
16	2
\.


--
-- TOC entry 3500 (class 0 OID 24851)
-- Dependencies: 228
-- Data for Name: routines; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.routines (id, name, description, member_id, trainer_id) FROM stdin;
1	Routine 1	Custom routine	1	1
2	Routine 2	Custom routine	2	4
3	Routine 3	Custom routine	3	2
4	Routine 4	Custom routine	4	4
5	Routine 5	Custom routine	5	5
6	Routine 6	Custom routine	6	5
7	Routine 7	Custom routine	7	1
8	Routine 8	Custom routine	8	4
9	Routine 9	Custom routine	9	3
10	Routine 10	Custom routine	10	2
11	Routine 11	Custom routine	11	3
12	Routine 12	Custom routine	12	1
13	Routine 13	Custom routine	13	1
14	Routine 14	Custom routine	14	3
15	Routine 15	Custom routine	15	3
16	Routine 16	Custom routine	16	5
17	Routine 17	Custom routine	17	3
18	Routine 18	Custom routine	18	5
19	Routine 19	Custom routine	19	3
20	Routine 20	Custom routine	20	1
21	Routine 21	Custom routine	21	1
22	Routine 22	Custom routine	22	1
23	Routine 23	Custom routine	23	3
24	Routine 24	Custom routine	24	4
25	Routine 25	Custom routine	25	5
26	Routine 26	Custom routine	26	5
27	Routine 27	Custom routine	27	4
28	Routine 28	Custom routine	28	3
29	Routine 29	Custom routine	29	4
30	Routine 30	Custom routine	30	4
31	Routine 31	Custom routine	31	1
32	Routine 32	Custom routine	32	4
33	Routine 33	Custom routine	33	5
34	Routine 34	Custom routine	34	4
35	Routine 35	Custom routine	35	1
36	Routine 36	Custom routine	36	2
37	Routine 37	Custom routine	37	3
38	Routine 38	Custom routine	38	5
39	Routine 39	Custom routine	39	4
40	Routine 40	Custom routine	40	1
41	Routine 41	Custom routine	41	1
42	Routine 42	Custom routine	42	3
43	Routine 43	Custom routine	43	4
44	Routine 44	Custom routine	44	5
45	Routine 45	Custom routine	45	1
46	Routine 46	Custom routine	46	2
47	Routine 47	Custom routine	47	4
48	Routine 48	Custom routine	48	3
49	Routine 49	Custom routine	49	1
50	Routine 50	Custom routine	50	3
51	Routine 51	Custom routine	51	2
52	Routine 52	Custom routine	52	3
53	Routine 53	Custom routine	53	3
54	Routine 54	Custom routine	54	1
55	Routine 55	Custom routine	55	5
56	Routine 56	Custom routine	56	3
57	Routine 57	Custom routine	57	1
58	Routine 58	Custom routine	58	1
59	Routine 59	Custom routine	59	5
60	Routine 60	Custom routine	60	3
\.


--
-- TOC entry 3490 (class 0 OID 24789)
-- Dependencies: 218
-- Data for Name: trainers; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.trainers (id, name, specialty) FROM stdin;
1	Carlos Perez	Strength Training
2	Ana Gomez	Cardio
3	Luis Martinez	Yoga
4	Sofia Ramirez	Pilates
5	Juan Torres	Crossfit
\.


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 225
-- Name: attendances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.attendances_id_seq', 120, true);


--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 229
-- Name: exercises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.exercises_id_seq', 10, true);


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 215
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.members_id_seq', 60, true);


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 221
-- Name: memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.memberships_id_seq', 60, true);


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 223
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.payments_id_seq', 60, true);


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 219
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.plans_id_seq', 3, true);


--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 227
-- Name: routines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.routines_id_seq', 60, true);


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 217
-- Name: trainers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.trainers_id_seq', 5, true);


--
-- TOC entry 3328 (class 2606 OID 24844)
-- Name: attendances attendances_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.attendances
    ADD CONSTRAINT attendances_pkey PRIMARY KEY (id);


--
-- TOC entry 3332 (class 2606 OID 24873)
-- Name: exercises exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT exercises_pkey PRIMARY KEY (id);


--
-- TOC entry 3316 (class 2606 OID 24787)
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- TOC entry 3322 (class 2606 OID 24808)
-- Name: memberships memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (id);


--
-- TOC entry 3324 (class 2606 OID 24832)
-- Name: payments payments_membership_id_key; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_membership_id_key UNIQUE (membership_id);


--
-- TOC entry 3326 (class 2606 OID 24830)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 3320 (class 2606 OID 24801)
-- Name: plans plans_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- TOC entry 3334 (class 2606 OID 24878)
-- Name: routine_exercises routine_exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.routine_exercises
    ADD CONSTRAINT routine_exercises_pkey PRIMARY KEY (routine_id, exercise_id);


--
-- TOC entry 3330 (class 2606 OID 24856)
-- Name: routines routines_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.routines
    ADD CONSTRAINT routines_pkey PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 24794)
-- Name: trainers trainers_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.trainers
    ADD CONSTRAINT trainers_pkey PRIMARY KEY (id);


--
-- TOC entry 3339 (class 2606 OID 24845)
-- Name: attendances attendances_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.attendances
    ADD CONSTRAINT attendances_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id);


--
-- TOC entry 3335 (class 2606 OID 24809)
-- Name: memberships memberships_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id);


--
-- TOC entry 3336 (class 2606 OID 24814)
-- Name: memberships memberships_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES public.plans(id);


--
-- TOC entry 3337 (class 2606 OID 24819)
-- Name: memberships memberships_trainer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_trainer_id_fkey FOREIGN KEY (trainer_id) REFERENCES public.trainers(id);


--
-- TOC entry 3338 (class 2606 OID 24833)
-- Name: payments payments_membership_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_membership_id_fkey FOREIGN KEY (membership_id) REFERENCES public.memberships(id);


--
-- TOC entry 3342 (class 2606 OID 24884)
-- Name: routine_exercises routine_exercises_exercise_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.routine_exercises
    ADD CONSTRAINT routine_exercises_exercise_id_fkey FOREIGN KEY (exercise_id) REFERENCES public.exercises(id);


--
-- TOC entry 3343 (class 2606 OID 24879)
-- Name: routine_exercises routine_exercises_routine_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.routine_exercises
    ADD CONSTRAINT routine_exercises_routine_id_fkey FOREIGN KEY (routine_id) REFERENCES public.routines(id);


--
-- TOC entry 3340 (class 2606 OID 24857)
-- Name: routines routines_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.routines
    ADD CONSTRAINT routines_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id);


--
-- TOC entry 3341 (class 2606 OID 24862)
-- Name: routines routines_trainer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.routines
    ADD CONSTRAINT routines_trainer_id_fkey FOREIGN KEY (trainer_id) REFERENCES public.trainers(id);


-- Completed on 2025-09-24 23:56:55

--
-- PostgreSQL database dump complete
--

