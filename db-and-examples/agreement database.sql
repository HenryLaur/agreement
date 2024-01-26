--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

-- Started on 2024-01-26 17:07:45

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
-- TOC entry 218 (class 1259 OID 17001)
-- Name: agreement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agreement (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    is_agreed boolean NOT NULL
);


ALTER TABLE public.agreement OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16990)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16995)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17006)
-- Name: rel_agreement__sector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_agreement__sector (
    sector_id bigint NOT NULL,
    agreement_id bigint NOT NULL
);


ALTER TABLE public.rel_agreement__sector OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17011)
-- Name: sector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sector (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    parent_id bigint
);


ALTER TABLE public.sector OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17000)
-- Name: sequence_generator; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sequence_generator
    START WITH 1050
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sequence_generator OWNER TO postgres;

--
-- TOC entry 4807 (class 0 OID 17001)
-- Dependencies: 218
-- Data for Name: agreement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agreement (id, name, is_agreed) FROM stdin;
1	disastrous	t
2	soulful	t
3	overcooked ugh yippee	t
1001	Tester	t
1002	Tester 2	t
\.


--
-- TOC entry 4804 (class 0 OID 16990)
-- Dependencies: 215
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
00000000000000	jhipster	config/liquibase/changelog/00000000000000_initial_schema.xml	2024-01-26 17:05:04.269705	1	EXECUTED	9:b6b4a3e0d2a6d7f1e5139675af65d7b0	createSequence sequenceName=sequence_generator		\N	4.24.0	\N	\N	6281504222
00000000000001	jhipster	config/liquibase/changelog/00000000000000_initial_schema.xml	2024-01-26 17:05:04.272958	2	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.24.0	\N	\N	6281504222
20240125155430-1	jhipster	config/liquibase/changelog/20240125155430_added_entity_Agreement.xml	2024-01-26 17:05:04.280753	3	EXECUTED	9:7e5a638d01192a3dff32ca4ddd4e488e	createTable tableName=agreement		\N	4.24.0	\N	\N	6281504222
20240125155430-1-relations	jhipster	config/liquibase/changelog/20240125155430_added_entity_Agreement.xml	2024-01-26 17:05:04.288905	4	EXECUTED	9:b065a8a4d30a212a7cdc34cba7e48843	createTable tableName=rel_agreement__sector; addPrimaryKey tableName=rel_agreement__sector		\N	4.24.0	\N	\N	6281504222
20240125155430-1-data	jhipster	config/liquibase/changelog/20240125155430_added_entity_Agreement.xml	2024-01-26 17:05:04.307039	5	EXECUTED	9:ca40e91f4594756c7798c1a305d7f5a0	loadData tableName=agreement		\N	4.24.0	faker	\N	6281504222
20240125155430-1-relations-data	jhipster	config/liquibase/changelog/20240125155430_added_entity_Agreement.xml	2024-01-26 17:05:04.315314	6	EXECUTED	9:6178a081b0c895341795c92f6695b5df	loadData tableName=rel_agreement__sector		\N	4.24.0	faker	\N	6281504222
20240125155530-1	jhipster	config/liquibase/changelog/20240125155530_added_entity_Sector.xml	2024-01-26 17:05:04.326082	7	EXECUTED	9:042187cb66f0a32381f06dff94773b38	createTable tableName=sector		\N	4.24.0	\N	\N	6281504222
20240125155530-1-data	jhipster	config/liquibase/changelog/20240125155530_added_entity_Sector.xml	2024-01-26 17:05:04.356895	8	EXECUTED	9:71b5846a5e1649407d745ce8d97c6c1a	loadData tableName=sector		\N	4.24.0	faker	\N	6281504222
20240125155430-2	jhipster	config/liquibase/changelog/20240125155430_added_entity_constraints_Agreement.xml	2024-01-26 17:05:04.369833	9	EXECUTED	9:a6d4b989935c222ae377fe3493f2aff6	addForeignKeyConstraint baseTableName=rel_agreement__sector, constraintName=fk_rel_agreement__sector__agreement_id, referencedTableName=agreement; addForeignKeyConstraint baseTableName=rel_agreement__sector, constraintName=fk_rel_agreement__sector...		\N	4.24.0	\N	\N	6281504222
20240125155530-2	jhipster	config/liquibase/changelog/20240125155530_added_entity_constraints_Sector.xml	2024-01-26 17:05:04.376256	10	EXECUTED	9:ec85aa60d4f30381286aec157b2af714	addForeignKeyConstraint baseTableName=sector, constraintName=fk_sector__parent_id, referencedTableName=sector		\N	4.24.0	\N	\N	6281504222
\.


--
-- TOC entry 4805 (class 0 OID 16995)
-- Dependencies: 216
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- TOC entry 4808 (class 0 OID 17006)
-- Dependencies: 219
-- Data for Name: rel_agreement__sector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_agreement__sector (sector_id, agreement_id) FROM stdin;
1	1
2	1
3	2
4	3
5	3
2	1001
3	1001
5	1001
8	1001
14	1001
4	1002
5	1002
8	1002
1	1002
3	1002
2	1002
6	1002
7	1002
\.


--
-- TOC entry 4809 (class 0 OID 17011)
-- Dependencies: 220
-- Data for Name: sector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sector (id, code, name, parent_id) FROM stdin;
1	1	Manufacturing	\N
2	19	Construction materials	1
3	18	Electronics and Optics	1
4	6	Food and Beverage	1
5	342	Bakery & confectionery products	4
6	43	Beverages	4
7	42	Fish & fish products 	4
8	40	Meat & meat products	4
9	39	Milk & dairy products 	4
10	437	Other	4
11	378	Sweets & snack food	4
12	13	Furniture	1
13	389	Bathroom/sauna 	12
14	385	Bedroom	12
15	390	Children’s room 	12
16	98	Kitchen 	12
17	101	Living room 	12
18	392	Office	12
19	394	Other (Furniture)	12
20	341	Outdoor 	12
21	99	Project furniture	12
22	12	Machinery	1
23	94	Machinery components	22
24	91	Machinery equipment/tools	22
25	224	Manufacture of machinery 	22
26	97	Maritime	22
27	271	Aluminium and steel workboats 	26
28	269	Boat/Yacht building	26
29	230	Ship repair and conversion	26
30	93	Metal structures	22
31	508	Other	22
32	227	Repair and maintenance service	22
33	11	Metalworking	1
34	67	Construction of metal structures	33
35	263	Houses and buildings	33
36	267	Metal products	33
37	542	Metal works	33
38	75	CNC-machining	37
39	62	Forgings, Fasteners 	37
40	69	Gas, Plasma, Laser cutting	37
41	66	MIG, TIG, Aluminum welding	37
42	9	Plastic and Rubber	1
43	54	Packaging	42
44	556	Plastic goods	42
45	559	Plastic processing technology	42
46	55	Blowing	45
47	57	Moulding	45
48	53	Plastics welding and processing	45
49	560	Plastic profiles	42
50	5	Printing 	1
51	148	Advertising	50
52	150	Book/Periodicals printing	50
53	145	Labelling and packaging printing	50
54	7	Textile and Clothing	1
55	44	Clothing	54
56	45	Textile	54
57	8	Wood	1
58	337	Other (Wood)	57
59	51	Wooden building materials	57
60	47	Wooden houses	57
61	3	Other	\N
62	37	Creative industries	61
63	29	Energy technology	61
64	33	Environment	61
65	2	Service	\N
66	25	Business services	65
67	35	Engineering	65
68	28	Information Technology and Telecommunications	65
69	581	Data processing, Web portals, E-marketing	68
70	576	Programming, Consultancy	68
71	121	Software, Hardware	68
72	122	Telecommunications	68
73	22	Tourism	65
74	141	Translation services	65
75	21	Transport and Logistics	65
76	111	Air	75
77	114	Rail	75
78	112	Road	75
79	113	Water	75
\.


--
-- TOC entry 4815 (class 0 OID 0)
-- Dependencies: 217
-- Name: sequence_generator; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sequence_generator', 1050, true);


--
-- TOC entry 4653 (class 2606 OID 17005)
-- Name: agreement agreement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement
    ADD CONSTRAINT agreement_pkey PRIMARY KEY (id);


--
-- TOC entry 4651 (class 2606 OID 16999)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 4655 (class 2606 OID 17010)
-- Name: rel_agreement__sector rel_agreement__sector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_agreement__sector
    ADD CONSTRAINT rel_agreement__sector_pkey PRIMARY KEY (agreement_id, sector_id);


--
-- TOC entry 4657 (class 2606 OID 17017)
-- Name: sector sector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sector
    ADD CONSTRAINT sector_pkey PRIMARY KEY (id);


--
-- TOC entry 4658 (class 2606 OID 17018)
-- Name: rel_agreement__sector fk_rel_agreement__sector__agreement_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_agreement__sector
    ADD CONSTRAINT fk_rel_agreement__sector__agreement_id FOREIGN KEY (agreement_id) REFERENCES public.agreement(id);


--
-- TOC entry 4659 (class 2606 OID 17023)
-- Name: rel_agreement__sector fk_rel_agreement__sector__sector_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_agreement__sector
    ADD CONSTRAINT fk_rel_agreement__sector__sector_id FOREIGN KEY (sector_id) REFERENCES public.sector(id);


--
-- TOC entry 4660 (class 2606 OID 17028)
-- Name: sector fk_sector__parent_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sector
    ADD CONSTRAINT fk_sector__parent_id FOREIGN KEY (parent_id) REFERENCES public.sector(id);


-- Completed on 2024-01-26 17:07:45

--
-- PostgreSQL database dump complete
--

