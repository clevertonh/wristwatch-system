--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

-- Started on 2019-01-12 17:20:04 -02

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 16385)
-- Name: wristwatch; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA wristwatch;


ALTER SCHEMA wristwatch OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16386)
-- Name: brand; Type: TABLE; Schema: wristwatch; Owner: postgres
--

CREATE TABLE wristwatch.brand (
    name character varying(20) NOT NULL,
    country character varying(20) NOT NULL,
    creation character varying(15) NOT NULL
);


ALTER TABLE wristwatch.brand OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16491)
-- Name: collection; Type: TABLE; Schema: wristwatch; Owner: postgres
--

CREATE TABLE wristwatch.collection (
    name character varying(50) NOT NULL,
    brand_name character varying(50) NOT NULL
);


ALTER TABLE wristwatch.collection OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16443)
-- Name: purchase; Type: TABLE; Schema: wristwatch; Owner: postgres
--

CREATE TABLE wristwatch.purchase (
    salesman_name character varying(20) NOT NULL,
    brand_name character varying(50) NOT NULL
);


ALTER TABLE wristwatch.purchase OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16506)
-- Name: sale; Type: TABLE; Schema: wristwatch; Owner: postgres
--

CREATE TABLE wristwatch.sale (
    id_wristwatch integer NOT NULL,
    salesman_name character varying(50) NOT NULL
);


ALTER TABLE wristwatch.sale OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16389)
-- Name: salesman; Type: TABLE; Schema: wristwatch; Owner: postgres
--

CREATE TABLE wristwatch.salesman (
    name character varying(50) NOT NULL
);


ALTER TABLE wristwatch.salesman OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16397)
-- Name: user; Type: TABLE; Schema: wristwatch; Owner: postgres
--

CREATE TABLE wristwatch."user" (
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(50),
    name character varying(50)
);


ALTER TABLE wristwatch."user" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16395)
-- Name: user_id_seq; Type: SEQUENCE; Schema: wristwatch; Owner: postgres
--

CREATE SEQUENCE wristwatch.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wristwatch.user_id_seq OWNER TO postgres;

--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 199
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: wristwatch; Owner: postgres
--

ALTER SEQUENCE wristwatch.user_id_seq OWNED BY wristwatch."user".id;


--
-- TOC entry 202 (class 1259 OID 16427)
-- Name: wristwatch; Type: TABLE; Schema: wristwatch; Owner: postgres
--

CREATE TABLE wristwatch.wristwatch (
    id integer NOT NULL,
    name character varying(150),
    qtd_plots integer,
    brand_name character varying(20),
    price numeric(8,2),
    plots_price numeric(8,2),
    collection_name character varying(50) NOT NULL
);


ALTER TABLE wristwatch.wristwatch OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16425)
-- Name: wristwatch_id_seq; Type: SEQUENCE; Schema: wristwatch; Owner: postgres
--

CREATE SEQUENCE wristwatch.wristwatch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wristwatch.wristwatch_id_seq OWNER TO postgres;

--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 201
-- Name: wristwatch_id_seq; Type: SEQUENCE OWNED BY; Schema: wristwatch; Owner: postgres
--

ALTER SEQUENCE wristwatch.wristwatch_id_seq OWNED BY wristwatch.wristwatch.id;


--
-- TOC entry 2813 (class 2604 OID 16400)
-- Name: user id; Type: DEFAULT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch."user" ALTER COLUMN id SET DEFAULT nextval('wristwatch.user_id_seq'::regclass);


--
-- TOC entry 2814 (class 2604 OID 16430)
-- Name: wristwatch id; Type: DEFAULT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.wristwatch ALTER COLUMN id SET DEFAULT nextval('wristwatch.wristwatch_id_seq'::regclass);


--
-- TOC entry 2957 (class 0 OID 16386)
-- Dependencies: 197
-- Data for Name: brand; Type: TABLE DATA; Schema: wristwatch; Owner: postgres
--

INSERT INTO wristwatch.brand (name, country, creation) VALUES ('Condor', 'Suiça', '2013');
INSERT INTO wristwatch.brand (name, country, creation) VALUES ('Technos', 'Suiça', '1900');
INSERT INTO wristwatch.brand (name, country, creation) VALUES ('Montblanc', 'Alemanha', '1906');


--
-- TOC entry 2964 (class 0 OID 16491)
-- Dependencies: 204
-- Data for Name: collection; Type: TABLE DATA; Schema: wristwatch; Owner: postgres
--

INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Civic', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Speed', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Casual', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Traqveller', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Anadigi', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Ferragens', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Casual Metal', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Casual Couro', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Metal E Couro', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Neon', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Xadrez', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Gradeados', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Ritmo Envolvente', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Militar', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('3D Geométrico', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Urbano', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Prata', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Calotas', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Metal', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Couro', 'Condor');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Star Legacy', 'Montblanc');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Star Classique', 'Montblanc');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('TimeWalker', 'Montblanc');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Villeret', 'Montblanc');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Steel', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Performance Racer', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Racer', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Golf', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Unissex Classic Slim', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Calendário Lunar', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Unissex Classic', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Unissex Slim', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Skymaster', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Legacy', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Ts Digiana', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Classic Steel', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Militar', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Executive', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Grandtech', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Ts Carbon', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Performance', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Classic Legacy', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Slim', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Riviera', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Classic Ceramic/Saphire', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Classic Automatico', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Essence', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Automatico', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Skydiver', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Carbon', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Ceramic', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Vitra', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Acqua', 'Technos');
INSERT INTO wristwatch.collection (name, brand_name) VALUES ('Solar', 'Technos');


--
-- TOC entry 2963 (class 0 OID 16443)
-- Dependencies: 203
-- Data for Name: purchase; Type: TABLE DATA; Schema: wristwatch; Owner: postgres
--

INSERT INTO wristwatch.purchase (salesman_name, brand_name) VALUES ('Technos', 'Technos');
INSERT INTO wristwatch.purchase (salesman_name, brand_name) VALUES ('Condor', 'Condor');
INSERT INTO wristwatch.purchase (salesman_name, brand_name) VALUES ('Montblanc', 'Montblanc');


--
-- TOC entry 2965 (class 0 OID 16506)
-- Dependencies: 205
-- Data for Name: sale; Type: TABLE DATA; Schema: wristwatch; Owner: postgres
--

INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (819, 'Montblanc');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (820, 'Montblanc');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (821, 'Montblanc');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (822, 'Montblanc');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (823, 'Montblanc');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (824, 'Montblanc');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (825, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (826, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (827, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (828, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (829, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (830, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (831, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (832, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (833, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (834, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (835, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (836, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (837, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (838, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (839, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (840, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (841, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (842, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (843, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (844, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (845, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (846, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (847, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (848, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (849, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (850, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (851, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (852, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (853, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (854, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (855, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (856, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (857, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (858, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (859, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (860, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (861, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (862, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (863, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (864, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (865, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (866, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (867, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (868, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (869, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (870, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (871, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (872, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (873, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (874, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (875, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (876, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (877, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (878, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (879, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (880, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (881, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (882, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (883, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (884, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (885, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (886, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (887, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (888, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (889, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (890, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (891, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (892, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (893, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (894, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (895, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (896, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (897, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (898, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (899, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (900, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (901, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (902, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (903, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (904, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (905, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (906, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (907, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (908, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (909, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (910, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (911, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (912, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (913, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (914, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (915, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (916, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (917, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (918, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (919, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (920, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (921, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (922, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (923, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (924, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (925, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (926, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (927, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (928, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (929, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (930, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (931, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (932, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (933, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (934, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (935, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (936, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (937, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (938, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (939, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (940, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (941, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (942, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (943, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (944, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (945, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (946, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (947, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (948, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (949, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (950, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (951, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (952, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (953, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (954, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (955, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (956, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (957, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (958, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (959, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (960, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (961, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (962, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (963, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (964, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (965, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (966, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (967, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (968, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (969, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (970, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (971, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (972, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (973, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (974, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (975, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (976, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (977, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (978, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (979, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (980, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (981, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (982, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (983, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (984, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (985, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (986, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (987, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (988, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (989, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (990, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (991, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (992, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (993, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (994, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (995, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (996, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (997, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (998, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (999, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1000, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1001, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1002, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1003, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1004, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1005, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1006, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1007, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1008, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1009, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1010, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1011, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1012, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1013, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1014, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1015, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1016, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1017, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1018, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1019, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1020, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1021, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1022, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1023, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1024, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1025, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1026, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1027, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1028, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1029, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1030, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1031, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1032, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1033, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1034, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1035, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1036, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1037, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1038, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1039, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1040, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1041, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1042, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1043, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1044, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1045, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1046, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1047, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1048, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1049, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1050, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1051, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1052, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1053, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1054, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1055, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1056, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1057, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1058, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1059, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1060, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1061, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1062, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1063, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1064, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1065, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1066, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1067, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1068, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1069, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1070, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1071, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1072, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1073, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1074, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1075, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1076, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1077, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1078, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1079, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1080, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1081, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1082, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1083, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1084, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1085, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1086, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1087, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1088, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1089, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1090, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1091, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1092, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1093, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1094, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1095, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1096, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1097, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1098, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1099, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1100, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1101, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1102, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1103, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1104, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1105, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1106, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1107, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1108, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1109, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1110, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1111, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1112, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1113, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1114, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1115, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1116, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1117, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1118, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1119, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1120, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1121, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1122, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1123, 'Condor');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1124, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1125, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1126, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1127, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1128, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1129, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1130, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1131, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1132, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1133, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1134, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1135, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1136, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1137, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1138, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1139, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1140, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1141, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1142, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1143, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1144, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1145, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1146, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1147, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1148, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1149, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1150, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1151, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1152, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1153, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1154, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1155, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1156, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1157, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1158, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1159, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1160, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1161, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1162, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1163, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1164, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1165, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1166, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1167, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1168, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1169, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1170, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1171, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1172, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1173, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1174, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1175, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1176, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1177, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1178, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1179, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1180, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1181, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1182, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1183, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1184, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1185, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1186, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1187, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1188, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1189, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1190, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1191, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1192, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1193, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1194, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1195, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1196, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1197, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1198, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1199, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1200, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1201, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1202, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1203, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1204, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1205, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1206, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1207, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1208, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1209, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1210, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1211, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1212, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1213, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1214, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1215, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1216, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1217, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1218, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1219, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1220, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1221, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1222, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1223, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1224, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1225, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1226, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1227, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1228, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1229, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1230, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1231, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1232, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1233, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1234, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1235, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1236, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1237, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1238, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1239, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1240, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1241, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1242, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1243, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1244, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1245, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1246, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1247, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1248, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1249, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1250, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1251, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1252, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1253, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1254, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1255, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1256, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1257, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1258, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1259, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1260, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1261, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1262, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1263, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1264, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1265, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1266, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1267, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1268, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1269, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1270, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1271, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1272, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1273, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1274, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1275, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1276, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1277, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1278, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1279, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1280, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1281, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1282, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1283, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1284, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1285, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1286, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1287, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1288, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1289, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1290, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1291, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1292, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1293, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1294, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1295, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1296, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1297, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1298, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1299, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1300, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1301, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1302, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1303, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1304, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1305, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1306, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1307, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1308, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1309, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1310, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1311, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1312, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1313, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1314, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1315, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1316, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1317, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1318, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1319, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1320, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1321, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1322, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1323, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1324, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1325, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1326, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1327, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1328, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1329, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1330, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1331, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1332, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1333, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1334, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1335, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1336, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1337, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1338, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1339, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1340, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1341, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1342, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1343, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1344, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1345, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1346, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1347, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1348, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1349, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1350, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1351, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1352, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1353, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1354, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1355, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1356, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1357, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1358, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1359, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1360, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1361, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1362, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1363, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1364, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1365, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1366, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1367, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1368, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1369, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1370, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1371, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1372, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1373, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1374, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1375, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1376, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1377, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1378, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1379, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1380, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1381, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1382, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1383, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1384, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1385, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1386, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1387, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1388, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1389, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1390, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1391, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1392, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1393, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1394, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1395, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1396, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1397, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1398, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1399, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1400, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1401, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1402, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1403, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1404, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1405, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1406, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1407, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1408, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1409, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1410, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1411, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1412, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1413, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1414, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1415, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1416, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1417, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1418, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1419, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1420, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1421, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1422, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1423, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1424, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1425, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1426, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1427, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1428, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1429, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1430, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1431, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1432, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1433, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1434, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1435, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1436, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1437, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1438, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1439, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1440, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1441, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1442, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1443, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1444, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1445, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1446, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1447, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1448, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1449, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1450, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1451, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1452, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1453, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1454, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1455, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1456, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1457, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1458, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1459, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1460, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1461, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1462, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1463, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1464, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1465, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1466, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1467, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1468, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1469, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1470, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1471, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1472, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1473, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1474, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1475, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1476, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1477, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1478, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1479, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1480, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1481, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1482, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1483, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1484, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1485, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1486, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1487, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1488, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1489, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1490, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1491, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1492, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1493, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1494, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1495, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1496, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1497, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1498, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1499, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1500, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1501, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1502, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1503, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1504, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1505, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1506, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1507, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1508, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1509, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1510, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1511, 'Technos');
INSERT INTO wristwatch.sale (id_wristwatch, salesman_name) VALUES (1512, 'Technos');


--
-- TOC entry 2958 (class 0 OID 16389)
-- Dependencies: 198
-- Data for Name: salesman; Type: TABLE DATA; Schema: wristwatch; Owner: postgres
--

INSERT INTO wristwatch.salesman (name) VALUES ('Condor');
INSERT INTO wristwatch.salesman (name) VALUES ('Technos');
INSERT INTO wristwatch.salesman (name) VALUES ('Montblanc');


--
-- TOC entry 2960 (class 0 OID 16397)
-- Dependencies: 200
-- Data for Name: user; Type: TABLE DATA; Schema: wristwatch; Owner: postgres
--



--
-- TOC entry 2962 (class 0 OID 16427)
-- Dependencies: 202
-- Data for Name: wristwatch; Type: TABLE DATA; Schema: wristwatch; Owner: postgres
--

INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (819, 'Montblanc Star Legacy Automatic Date 42 mm', 10, 'Montblanc', 12060.00, 1570.00, 'Star Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (820, 'Montblanc Star Classique Automatic', 10, 'Montblanc', 11871.00, 1540.00, 'Star Classique');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (821, 'Montblanc Star Classique Automatic', 10, 'Montblanc', 17460.00, 2270.00, 'Star Classique');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (822, 'Montblanc TimeWalker ChronoVoyager UTC', 10, 'Montblanc', 19890.00, 2580.00, 'TimeWalker');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (823, 'Vintage Tachydate', 10, 'Montblanc', 172260.00, 22400.00, 'Villeret');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (824, 'Vintage Tachydate', 10, 'Montblanc', 179550.00, 23300.00, 'Villeret');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (825, 'Relógio Condor Masculino Civic Dourado COVD54BD/4P', 10, 'Condor', 359.90, 35.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (826, 'Relógio Condor Masculino Civic Dourado COVD54BE/2K', 10, 'Condor', 339.90, 33.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (827, 'Relógio Condor Masculino Civic Dourado COVD54BD/4A', 10, 'Condor', 359.90, 35.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (828, 'Relógio Condor Masculino Metal Prata CO2115KUC/3P', 10, 'Condor', 179.90, 17.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (829, 'Relógio Condor Masculino Digital Prata COBJ3463AD/3K', 10, 'Condor', 239.90, 23.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (830, 'Relógio Condor Masculino Couro Bicolor CO2035MPJ/K5C', 10, 'Condor', 199.90, 19.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (831, 'Relógio Condor Masculino Metal Prata CO2035MPH/K3B', 10, 'Condor', 199.90, 19.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (832, 'Relógio Condor Masculino Metal Dourado CO2035MPI/K4P', 10, 'Condor', 219.90, 21.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (833, 'Relógio Condor Masculino Metal Dourado CO2035MPI/K4D', 10, 'Condor', 219.90, 21.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (834, 'Relógio Condor Masculino Speed Prata CO2115KUP/K3K', 10, 'Condor', 229.90, 22.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (835, 'Relógio Condor Masculino Speed Dourado CO2115KUO/K4D', 10, 'Condor', 239.90, 23.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (836, 'Relógio Condor Masculino Speed Bicolor CO2115KUN/K2A', 10, 'Condor', 229.90, 22.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (837, 'Relógio Condor Masculino Speed Prata CO2115KUM/K2C', 10, 'Condor', 219.90, 21.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (838, 'Relógio Condor Masculino Civic Dourado COVD54BB/2D', 10, 'Condor', 339.90, 33.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (839, 'Relógio Condor Masculino Couro Bicolor CO2035KYM/2B', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (840, 'Relógio Condor Masculino Speed Prata CO2115KUH/2K', 10, 'Condor', 199.90, 19.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (841, 'Relógio Condor Masculino Speed Prata CO2115KUG/3C', 10, 'Condor', 219.90, 21.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (842, 'Relógio Condor Masculino Metal Prata CO2035MPM/3V', 10, 'Condor', 179.90, 17.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (843, 'Relógio Condor Masculino Metal Prata CO2035MPN/3F', 10, 'Condor', 179.90, 17.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (844, 'Relógio Condor Masculino Metal Prata CO2035KYL/3A', 10, 'Condor', 179.90, 17.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (845, 'Relógio Condor Masculino Couro Preto CO2035MPE/2D', 10, 'Condor', 189.90, 18.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (846, 'Relógio Condor Masculino Civic Prata COVD54BC/3K', 10, 'Condor', 339.90, 33.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (847, 'Relógio Condor Masculino Metal Dourado CO2035MPG/4A', 10, 'Condor', 199.90, 19.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (848, 'Relógio Condor Masculino Couro Dourado CO2035MPF/2B', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (849, 'Relógio Condor Masculino Couro Preto CO2035MPE/2P', 10, 'Condor', 189.90, 18.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (850, 'Relógio Condor Masculino Civic Bicolor COVD54AY/4P', 10, 'Condor', 369.90, 36.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (851, 'Relógio Condor Masculino Civic Dourado COJP25AA/4D', 10, 'Condor', 359.90, 35.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (852, 'Relógio Condor Masculino Casual Digital Dourado COBJ3463AA/4D', 10, 'Condor', 259.90, 25.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (853, 'Relógio Condor Masculino Casual Digital Prata COBJ3463AC/3K', 10, 'Condor', 219.90, 21.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (854, 'Relógio Condor Masculino Civic Prata COVD54AX/3B', 10, 'Condor', 339.90, 33.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (855, 'Relógio Condor Masculino Civic Dourado COVD54AW/4K', 10, 'Condor', 359.90, 35.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (856, 'Relógio Condor Masculino Casual Bicolor CO2035KYG/K5M', 10, 'Condor', 219.90, 21.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (857, 'Relógio Condor Masculino Casual Dourado CO2035KYE/K2B', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (858, 'Relógio Condor Masculino Casual Bicolor CO2115KTR/K3C', 10, 'Condor', 219.90, 21.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (859, 'Relógio Condor Masculino Casual Bicolor CO2115KTQ/K3K', 10, 'Condor', 209.90, 20.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (860, 'Relógio Condor Masculino Casual Digital Prata COBJ3463AB/2K', 10, 'Condor', 239.90, 23.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (861, 'Relógio Condor Masculino Speed Dourado CO2115KTY/2C', 10, 'Condor', 209.90, 20.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (862, 'Relógio Condor Masculino Speed Prata CO2115KTX/3P', 10, 'Condor', 219.90, 21.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (863, 'Relógio Condor Masculino Speed Prata CO2115KTX/3C', 10, 'Condor', 219.90, 21.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (864, 'Relógio Condor Masculino Speed Dourado CO2115KTW/4P', 10, 'Condor', 229.90, 22.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (865, 'Relógio Condor Masculino Civic Prata CO2115KUA/T3A', 10, 'Condor', 329.90, 32.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (866, 'Relógio Condor Masculino Civic Dourado CO2115KTZ/4K', 10, 'Condor', 319.90, 31.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (867, 'Relógio Condor Masculino Traveller Prata CO6P29IS/3A', 10, 'Condor', 229.90, 22.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (868, 'Relógio Condor Masculino Traveller Prata CO6P29IR/3P', 10, 'Condor', 249.90, 24.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (869, 'Relógio Condor Masculino Casual Dourado CO2115KTT/4D', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (870, 'Relógio Condor Masculino Casual Prata CO2115KTV/3V', 10, 'Condor', 179.90, 17.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (871, 'Relógio Condor Masculino Casual Prata CO2115KTU/3P', 10, 'Condor', 179.00, 17.90, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (872, 'Relógio Condor Masculino Casual Dourado CO2115KTT/4A', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (873, 'Relógio Condor Masculino Casual Dourado CO2035KYF/4C', 10, 'Condor', 219.90, 21.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (874, 'Relógio Condor Masculino Casual Prata CO2035KYD/3A', 10, 'Condor', 199.90, 19.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (875, 'Relógio Condor Masculino Casual Bicolor CO2115KTP/2C', 10, 'Condor', 179.90, 17.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (876, 'Relógio Condor Masculino Casual Bicolor CO2115KTS/4P', 10, 'Condor', 209.90, 20.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (877, 'Relógio Condor Masculino Civic Prata COVD54AV/2K', 10, 'Condor', 319.90, 31.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (878, 'Relógio Condor Masculino Civic Dourado COVD54AW/4P', 10, 'Condor', 359.90, 35.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (879, 'Relógio Condor Masculino Casual Dourado CO2035KXD/K4C', 10, 'Condor', 219.90, 21.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (880, 'Relógio Condor Masculino Metal Prata - CO2115KTO/T3P', 10, 'Condor', 219.90, 21.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (881, 'Relógio Condor Masculino Metal Dourado - CO2115KTN/T4A', 10, 'Condor', 239.90, 23.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (882, 'Relógio Condor Masculino Metal Dourado - CO2115KTN/4D', 10, 'Condor', 199.90, 19.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (883, 'Relógio Condor Masculino Metal Prata - CO2115KTO/3C', 10, 'Condor', 179.90, 17.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (884, 'Relógio Condor Masculino Metal Dourado - CO2039AZ/4A', 10, 'Condor', 199.90, 19.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (885, 'Relógio Condor Masculino Metal Prata - CO2039BA/3C', 10, 'Condor', 179.90, 17.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (886, 'Relógio Condor Masculino Metal Dourado - CO2039AZ/4D', 10, 'Condor', 199.90, 19.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (887, 'Relógio Condor Masculino Couro Dourado - CO2039BB/2K', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (888, 'Relógio Condor Masculino Couro Dourado - CO2035KWV/K2D', 10, 'Condor', 199.90, 19.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (889, 'Relógio Condor Masculino Civic Prata - CO2317AD/2K', 10, 'Condor', 289.90, 28.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (890, 'Relógio Condor Masculino Couro Dourado - CO2036KUO/K4V', 10, 'Condor', 219.90, 21.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (891, 'Relógio Condor Masculino Couro Prata - CO2036KUL/K2P', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (892, 'Relógio Condor Masculino Couro Dourado - CO2036KUM/2A', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (893, 'Relógio Condor Masculino Couro Prata - CO2036KUN/3C', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (894, 'Relógio Condor Masculino Civic Prata - CO2317AB/3K', 10, 'Condor', 309.90, 30.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (895, 'Relógio Condor Masculino Civic Dourado - CO2317AA/4A', 10, 'Condor', 319.90, 31.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (896, 'Relógio Condor Masculino Speed Prata - CO2115KTH/3C', 10, 'Condor', 219.90, 21.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (897, 'Relógio Condor Masculino Speed Prata - CO2115KTI/2K', 10, 'Condor', 199.90, 19.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (898, 'Relógio Condor Masculino Civic Dourado - CO2317AC/2P', 10, 'Condor', 299.90, 29.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (899, 'Relógio Condor Masculino Speed Dourado - CO2115KTJ/4D', 10, 'Condor', 229.90, 22.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (900, 'Relógio Condor Masculino Metal Dourado - CO2035KWT/4P', 10, 'Condor', 199.90, 19.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (901, 'Relógio Condor Masculino Couro Dourado - CO2035KWV/2A', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (902, 'Relógio Condor Masculino Anadigi Dourado - COY121E6AD/3P', 10, 'Condor', 289.90, 28.99, 'Anadigi');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (903, 'Relógio Condor Masculino Anadigi Dourado - COY121E6AA/4P', 10, 'Condor', 299.90, 29.99, 'Anadigi');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (904, 'Relógio Condor Masculino Anadigi Grafite - COY121E6AB/4P', 10, 'Condor', 309.90, 30.99, 'Anadigi');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (905, 'Relógio Condor Masculino Anadigi Prata - COY121E6AC/3P', 10, 'Condor', 289.90, 28.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (906, 'Relógio Condor Masculino Anadigi Grafite - COY121E6AE/2P', 10, 'Condor', 299.90, 29.99, 'Anadigi');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (907, 'Relógio Condor Masculino Speed Grafite - CO2115KTL/K2C', 10, 'Condor', 239.90, 23.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (908, 'Relógio Condor Masculino Metal Prata - CO2035KWU/K3C', 10, 'Condor', 199.90, 19.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (909, 'Relógio Condor Masculino Speed Prata - CO2115KTK/K3K', 10, 'Condor', 229.90, 22.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (910, 'Relógio Condor Masculino Speed Prata - CO2115KTK/K3C', 10, 'Condor', 229.90, 22.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (911, 'Relógio Condor Masculino Speed Dourado - CO2115KTM/K4A', 10, 'Condor', 239.90, 23.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (912, 'Relógio Condor Masculino Speed Dourado - CO2115KTJ/4C', 10, 'Condor', 229.90, 22.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (913, 'Relógio Condor Masculino Casual Prata - CO2115KTD/2A', 10, 'Condor', 169.90, 16.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (914, 'Relógio Condor Masculino Casual Dourado - CO2115KTF/4D', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (915, 'Relógio Condor Masculino Casual Dourado - CO2115KTE/K2P', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (916, 'Relógio Condor Masculino Casual Prata - CO2115KTG/K3K', 10, 'Condor', 199.90, 19.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (917, 'Relógio Condor Masculino Traveller Prata - CO6P29IO/2A', 10, 'Condor', 229.90, 22.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (918, 'Relógio Condor Masculino Traveller Prata - CO6P29IM/3B', 10, 'Condor', 249.90, 24.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (919, 'Relógio Condor Masculino Speed Prata - CO2115KSY/K3K', 10, 'Condor', 229.90, 22.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (920, 'Relógio Condor Masculino Speed Prata - CO2115KSY/K3C', 10, 'Condor', 229.90, 22.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (921, 'Relógio Condor Masculino Ferragens Preto - COVD54AVUL/8P', 10, 'Condor', 349.90, 34.99, 'Ferragens');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (922, 'Relógio Condor Masculino Ferragens Dourado - COVD54AU/4D', 10, 'Condor', 359.90, 35.99, 'Ferragens');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (923, 'Relógio Condor Masculino Ferragens Dourado - COVD54AU/4C', 10, 'Condor', 359.90, 35.99, 'Ferragens');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (924, 'Relógio Condor Masculino Ferragens Prata - COVD54AT/3K', 10, 'Condor', 339.90, 33.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (925, 'Relógio Condor Masculino Ferragens Prata - CO2415BM/3C', 10, 'Condor', 309.90, 30.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (926, 'Relógio Condor Masculino Ferragens Prata - CO2415BM/3A', 10, 'Condor', 309.90, 30.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (927, 'Relógio Condor Masculino Ferragens Dourado - CO2415BL/4P', 10, 'Condor', 319.90, 31.99, 'Ferragens');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (928, 'Relógio Condor Masculino Ferragens Dourado - CO2415BL/4K', 10, 'Condor', 319.90, 31.99, 'Ferragens');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (929, 'Relógio Condor Masculino Speed Dourado - CO2115KSZ/K8K', 10, 'Condor', 229.90, 22.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (930, 'Relógio Condor Masculino Speed Prata - CO2115KSY/K3A', 10, 'Condor', 229.90, 22.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (931, 'Relógio Condor Masculino Casual Bicolor - CO2036KTZ/K5C', 10, 'Condor', 219.90, 21.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (932, 'Relógio Condor Masculino Casual Dourado - CO2036KTY/4P', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (933, 'Relógio Condor Masculino Speed Dourado - CO2115KTA/4C', 10, 'Condor', 229.90, 22.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (934, 'Relógio Condor Masculino Speed Dourado - CO2115KTA/K4D', 10, 'Condor', 239.90, 23.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (935, 'Relógio Condor Masculino Speed Dourado - CO2115KTA/K4P', 10, 'Condor', 239.90, 23.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (936, 'Relógio Condor Masculino Casual Grafite - CO2036KTW/2C', 10, 'Condor', 189.90, 18.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (937, 'Relógio Condor Masculino Metal - CO2315AH/K4X', 10, 'Condor', 219.90, 21.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (938, 'Relógio Condor Masculino Casual Metal Prata - CO2115KSU/3K', 10, 'Condor', 179.90, 17.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (939, 'Relógio Condor Masculino Casual Metal Prata - CO2115KSR/3C', 10, 'Condor', 179.90, 17.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (940, 'Relógio Condor Masculino Casual Metal Prata - CO2115KSR/3K', 10, 'Condor', 179.90, 17.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (941, 'Relógio Condor Masculino Casual Metal Prata - COGL10BQ/3P', 10, 'Condor', 199.90, 19.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (942, 'Relógio Condor Masculino Casual Couro Dourado - COGL10BS/2B', 10, 'Condor', 189.90, 18.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (943, 'Relógio Condor Masculino Casual Metal Dourado - CO2115KSS/K4P', 10, 'Condor', 219.90, 21.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (944, 'Relógio Condor Masculino Casual Couro Dourado - COGM10AB/2A', 10, 'Condor', 219.90, 21.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (945, 'Relógio Condor Masculino Casual Metal Dourado - COGM10AA/4K', 10, 'Condor', 239.90, 23.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (946, 'Relógio Condor Masculino Casual Couro Prata - CO2115KSV/K2P', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (947, 'Relógio Condor Masculino Casual Couro Bicolor - CO2115KSW/5D', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (948, 'Relógio Condor Masculino Casual Couro Dourado - CO2115KSX/2D', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (949, 'Relógio Condor Masculino Casual Couro Dourado - CO2115KSX/2C', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (950, 'Relógio Condor Masculino Casual Couro Dourado - CO2115KST/K2P', 10, 'Condor', 199.90, 19.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (951, 'Relógio Condor Masculino Casual Couro Dourado - CO2115KSO/2C', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (952, 'Relógio Condor Masculino Casual Couro Prata - CO2115KSP/0K', 10, 'Condor', 169.90, 16.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (953, 'Relógio Condor Masculino Casual Couro Dourado - CO2115KSO/2A', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (954, 'Relógio Condor Masculino Casual Metal Dourado - CO2035KVE/K4M', 10, 'Condor', 175.00, 17.50, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (955, 'Relógio Condor Masculino Casual Metal Dourado - CO2035KVB/4A', 10, 'Condor', 199.90, 19.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (956, 'Relógio Condor Masculino Casual Couro Dourado - CO2035KVD/2D', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (957, 'Relógio Condor Masculino Casual Metal Dourado - CO2035KVE/4D', 10, 'Condor', 159.00, 15.90, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (958, 'Relógio Condor Masculino Casual Metal Dourado - CO2035KVB/4K', 10, 'Condor', 199.90, 19.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (959, 'Relógio Condor Masculino Casual Metal Bicolor - CO2035KVG/5C', 10, 'Condor', 159.00, 15.90, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (960, 'Relógio Condor Masculino Casual Metal Prata - CO2035KVH/3V', 10, 'Condor', 143.00, 14.30, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (961, 'Relógio Condor Masculino Speed - CO2115YF/KS3C', 10, 'Condor', 229.90, 22.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (962, 'Relógio Condor Masculino Metal - CO2035KUH/KS4A', 10, 'Condor', 219.90, 21.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (963, 'Relógio Condor Masculino Metal - CO2115VO/K3K', 10, 'Condor', 199.90, 19.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (964, 'Relógio Condor Masculino Metal - CO2115XN/4K', 10, 'Condor', 199.90, 19.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (965, 'Relógio Condor Masculino Metal - CO2115WI/K3A', 10, 'Condor', 199.90, 19.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (966, 'Relógio Condor Masculino Speed - CO2115TR/K3C', 10, 'Condor', 174.92, 17.49, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (967, 'Relógio Condor Masculino Metal - CO2036DC/K4C', 10, 'Condor', 219.90, 21.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (968, 'Relógio Condor Masculino Metal - CO2035KOT/K3P', 10, 'Condor', 152.10, 15.21, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (969, 'Relógio Condor Masculino Metal - CO2035KNI/3K', 10, 'Condor', 129.27, 12.92, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (970, 'Relógio Condor Masculino Anadigi - COAD1146AA/3P', 10, 'Condor', 289.90, 28.99, 'Anadigi');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (971, 'Relógio Condor Masculino Anadigi - COAD1146AA/3R', 10, 'Condor', 289.90, 28.99, 'Anadigi');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (972, 'Relógio Condor Masculino Anadigi - COAD1146AA/3A', 10, 'Condor', 231.00, 23.10, 'Anadigi');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (973, 'Relógio Condor Masculino Anadigi - COAD1146AB/8P', 10, 'Condor', 279.90, 27.99, 'Anadigi');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (974, 'Relógio Condor Masculino Metal - CO2035KNL/3B', 10, 'Condor', 143.00, 14.30, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (975, 'Relógio Condor Masculino Prata - KC20985/3R', 10, 'Condor', 219.90, 21.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (976, 'Relógio Condor Masculino Civic COVD33BB/8C', 10, 'Condor', 339.90, 33.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (977, 'Relógio Condor Masculino Civic COVD33AV/8P - Preto', 10, 'Condor', 339.90, 33.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (978, 'Relógio Condor Masculino Speed - CO2115YC/3A', 10, 'Condor', 219.90, 21.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (979, 'Relógio Condor Masculino Speed - CO2115YD/8P', 10, 'Condor', 199.90, 19.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (980, 'Relógio Condor Masculino Civic CO2415BG/3A - Prata', 10, 'Condor', 309.90, 30.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (981, 'Relógio Condor Masculino Civic - COVD33AZ/4D', 10, 'Condor', 359.90, 35.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (982, 'Relógio Condor Masculino Civic - CO2415BK/8P', 10, 'Condor', 219.89, 21.98, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (983, 'Relógio Condor Masculino Civic - COVD33BA/3A', 10, 'Condor', 339.90, 33.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (984, 'Relógio Condor Masculino Metal CO2115XB/5K - 0', 10, 'Condor', 199.90, 19.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (985, 'Relógio Condor Masculino Speed CO2115YB/4P - Dourado', 10, 'Condor', 229.90, 22.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (986, 'Relógio Condor Masculino Civic CO2415BF/4K - Dourado', 10, 'Condor', 319.90, 31.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (987, 'Relógio Condor Masculino Civic CO2415BF/4C - Dourado', 10, 'Condor', 319.90, 31.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (988, 'Relógio Condor Masculino Civic CO2415BH/8K - Preto', 10, 'Condor', 299.90, 29.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (989, 'Relógio Condor Masculino Civic CO2415BJ/3K - Prata', 10, 'Condor', 247.00, 24.70, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (990, 'Relógio Condor Masculino Metal CO2115XC/3M - 0', 10, 'Condor', 179.90, 17.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (991, 'Relógio Condor Masculino Couro CO2115XD/2P - Preto', 10, 'Condor', 169.90, 16.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (992, 'Relógio Condor Masculino Metal E Couro CO2115XW/K4D - Dourado, Marrom', 10, 'Condor', 239.90, 23.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (993, 'Relógio Condor Masculino Metal E Couro CO2039AF/3P - Prata', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (994, 'Relógio Condor Masculino Metal E Couro CO2115XV/K5A - Prata, Jeans', 10, 'Condor', 249.90, 24.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (995, 'Relógio Condor Masculino Metal E Couro CO2039AE/2M - Marrom', 10, 'Condor', 136.20, 13.62, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (996, 'Relógio Condor Masculino Metal E Couro CO2039AG/4C - Dourado', 10, 'Condor', 139.00, 13.90, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (997, 'Relógio Condor Masculino Civic COVD54AR/4D - Dourado', 10, 'Condor', 359.90, 35.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (998, 'Relógio Condor Masculino Neon CO1161B/8P - Preto', 10, 'Condor', 223.00, 22.30, 'Neon');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (999, 'Relógio Condor Masculino Neon CO1161A/3A - Prata', 10, 'Condor', 289.90, 28.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1000, 'Relógio Condor Masculino Neon CO1161A/3V - Prata', 10, 'Condor', 279.90, 27.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1001, 'Relógio Condor Masculino Neon CO1161B/8K - Preto', 10, 'Condor', 279.90, 27.99, 'Neon');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1002, 'Relógio Condor Masculino Civic CO2315BC/4D - Dourado', 10, 'Condor', 319.90, 31.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1003, 'Relógio Condor Masculino Civic CO2315BC/4P - Dourado', 10, 'Condor', 319.90, 31.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1004, 'Relógio Condor Masculino Civic CO2315BD/2A - Azul', 10, 'Condor', 299.90, 29.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1005, 'Relógio Condor Masculino Civic CO2315BB/3A - Prata', 10, 'Condor', 309.90, 30.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1006, 'Relógio Condor Masculino Civic COVD54AQ/3K - Prata', 10, 'Condor', 339.90, 33.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1007, 'Kit Relógio Condor Masculino Xadrez CO2115XQ/K3V - Prata', 10, 'Condor', 146.96, 14.69, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1008, 'Relógio Condor Masculino Xadrez CO2115XO/3A - Jeans', 10, 'Condor', 169.90, 16.99, 'Xadrez');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1009, 'Relógio Condor Masculino Xadrez CO2115XN/4C - Dourado', 10, 'Condor', 199.90, 19.99, 'Xadrez');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1010, 'Relógio Condor Masculino Anadigi CO1154BR/3K - Prata', 10, 'Condor', 195.00, 19.50, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1011, 'Relógio Condor Masculino Anadigi CO1154BR/3R - Prata', 10, 'Condor', 195.00, 19.50, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1012, 'Relógio Condor Masculino Speed CO2115XI/3K - Prata', 10, 'Condor', 176.00, 17.60, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1013, 'Relógio Condor Masculino Gradeados COVD33AR/4D - Dourado', 10, 'Condor', 359.90, 35.99, 'Gradeados');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1014, 'Relógio Condor Masculino Gradeados COVD33AR/4C - Dourado', 10, 'Condor', 359.90, 35.99, 'Gradeados');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1015, 'Relógio Condor Masculino Gradeados CO2415BE/8P - Preto', 10, 'Condor', 299.90, 29.99, 'Gradeados');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1016, 'Relógio Condor Masculino Gradeados CO2415BC/3K - Prata', 10, 'Condor', 249.90, 24.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1017, 'Relógio Condor Masculino Speed CO2115XM/8P - Preto', 10, 'Condor', 209.90, 20.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1018, 'Relógio Condor Masculino Speed CO2115XL/3C - Prata', 10, 'Condor', 175.00, 17.50, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1019, 'Relógio Condor Masculino Speed CO2115XK/4D - Dourado', 10, 'Condor', 229.90, 22.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1020, 'Relógio Condor Masculino Speed CO2115XJ/8K - Preto', 10, 'Condor', 139.00, 13.90, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1021, 'Relógio Condor Masculino Speed CO2115XI/3A - Prata', 10, 'Condor', 153.00, 15.30, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1022, 'Kit Relógio Condor Masculino Metal E Couro CO2035KSR/K4D - Dourado', 10, 'Condor', 219.90, 21.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1023, 'Kit Relógio Condor Masculino Metal E Couro CO2035KSQ/K3K - Prata', 10, 'Condor', 199.90, 19.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1024, 'Relógio Condor Masculino Metal E Couro CO2035KSP/3A - Azul', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1025, 'Relógio Condor Masculino Metal E Couro CO2035KSO/2P - Preto', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1026, 'Relógio Condor Masculino Metal E Couro CO2035KSN/4D - Dourado', 10, 'Condor', 199.90, 19.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1027, 'Kit Relógio Condor Masculino Metal E Couro CO2115XE/K3A - Prata', 10, 'Condor', 199.90, 19.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1028, 'Kit Relógio Condor Masculino Metal E Couro CO2115XF/K4K - Dourado', 10, 'Condor', 175.00, 17.50, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1029, 'Kit Relógio Condor Masculino Metal E Couro CO2115XG/K3K - Preto', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1030, 'Relógio Condor Masculino Ritmo Envolvente CO2036DF/2M - Marrom', 10, 'Condor', 143.00, 14.30, 'Ritmo Envolvente');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1031, 'Relógio Condor Masculino Ritmo Envolvente CO2115WV/3K - Prata', 10, 'Condor', 175.00, 17.50, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1032, 'Relógio Condor Masculino Ritmo Envolvente CO2115UV/3A - Prata', 10, 'Condor', 219.90, 21.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1033, 'Relógio Condor Masculino Ritmo Envolvente COVD54AP/8A - Preto', 10, 'Condor', 349.90, 34.99, 'Ritmo Envolvente');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1034, 'Relógio Condor Masculino Ritmo Envolvente COVD54AO/3C - Prata', 10, 'Condor', 339.90, 33.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1035, 'Relógio Condor Masculino Ritmo Envolvente CO2115WZ/8P - Preto', 10, 'Condor', 299.90, 29.99, 'Ritmo Envolvente');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1036, 'Relógio Condor Masculino Ritmo Envolvente CO2115WY/3K - Prata', 10, 'Condor', 309.90, 30.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1037, 'Relógio Condor Masculino Ritmo Envolvente CO2115WP/4P - Dourado', 10, 'Condor', 229.90, 22.99, 'Ritmo Envolvente');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1038, 'Relógio Condor Masculino Ritmo Envolvente CO2115WX/4P - Dourado', 10, 'Condor', 319.90, 31.99, 'Ritmo Envolvente');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1039, 'Relógio Condor Masculino Ritmo Envolvente CO2115WX/4A - Dourado', 10, 'Condor', 319.90, 31.99, 'Ritmo Envolvente');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1040, 'Relógio Condor Masculino Ritmo Envolvente CO2036DD/3K - Prata', 10, 'Condor', 179.90, 17.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1041, 'Relógio Condor Masculino Ritmo Envolvente CO2036DC/4C - Dourado', 10, 'Condor', 199.90, 19.99, 'Ritmo Envolvente');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1042, 'Relógio Condor Masculino Ritmo Envolvente CO2115WW/8C - Preto', 10, 'Condor', 199.90, 19.99, 'Ritmo Envolvente');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1043, 'Relógio Condor Masculino Ritmo Envolvente CO2115WU/4P - Dourado', 10, 'Condor', 229.90, 22.99, 'Ritmo Envolvente');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1044, 'Relógio Condor Masculino Ritmo Envolvente CO2115WT/8C - Preto', 10, 'Condor', 209.90, 20.99, 'Ritmo Envolvente');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1045, 'Relógio Condor Masculino Ritmo Envolvente CO2115WS/3P - Prata', 10, 'Condor', 219.90, 21.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1046, 'Relógio Condor Masculino Ritmo Envolvente CO2036KRV/5K - Prata', 10, 'Condor', 199.90, 19.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1047, 'Relógio Condor Masculino Metal E Couro CO2115WL/4A - Dourado', 10, 'Condor', 199.90, 19.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1048, 'Relógio Condor Masculino Metal E Couro CO2115WI/3A - Prata', 10, 'Condor', 179.90, 17.99, 'Couro');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1049, 'Relógio Condor Masculino Casual CO2115VR/2K - Cinza', 10, 'Condor', 135.00, 13.50, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1050, 'Relógio Condor Masculino Casual CO2035KOT/3K - Prata', 10, 'Condor', 179.90, 17.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1051, 'Relógio Condor Masculino Casual CO2035KQN/4K - Dourado', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1052, 'Relógio Condor Masculino Casual CO2115VP/4D - Dourado', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1053, 'Relógio Condor Masculino Civic CO2315AV/3C - Prata', 10, 'Condor', 247.00, 24.70, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1054, 'Relógio Condor Masculino Casual CO2035KOT/3P - Prata', 10, 'Condor', 179.90, 17.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1055, 'Relógio Condor Masculino Casual CO2115VY/3K - Prata', 10, 'Condor', 179.90, 17.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1056, 'Relógio Condor Masculino Casual CO2115VQ/4A - Dourado', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1057, 'Relógio Condor Masculino Civic CO2315AW/4X - Dourado', 10, 'Condor', 243.40, 24.34, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1058, 'Relógio Condor Masculino Civic CO2315AX/8C - Preto', 10, 'Condor', 299.90, 29.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1059, 'Relógio Condor Masculino Casual CO2115VP/4M - Dourado', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1060, 'Relógio Condor Masculino Casual CO2035KOS/4X - Dourado', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1061, 'Relógio Condor Masculino Casual CO2035KOS/4K - Dourado', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1062, 'Relógio Condor Masculino Civic CO2315AT/8C - Cinza', 10, 'Condor', 209.00, 20.90, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1063, 'Relógio Condor Masculino Civic CO2415AY/4C - Dourado', 10, 'Condor', 243.40, 24.34, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1064, 'Relógio Condor Masculino Civic CO2315AU/3K - Prata', 10, 'Condor', 268.70, 26.87, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1065, 'Relógio Condor Masculino Civic CO2415AZ/3A - Prata', 10, 'Condor', 247.00, 24.70, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1066, 'Relógio Condor Masculino Civic CO2315AY/3K - Prata', 10, 'Condor', 309.90, 30.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1067, 'Relógio Condor Masculino Casual CO2115WB/8C - Preto', 10, 'Condor', 209.90, 20.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1068, 'Relógio Condor Masculino Casual CO2115WA/3K - Prata', 10, 'Condor', 219.90, 21.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1069, 'Relógio Condor Masculino Casual CO2115VZ/4P - Dourado', 10, 'Condor', 229.90, 22.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1070, 'Relógio Condor Masculino Civic COVD54AE/4A - Dourado', 10, 'Condor', 359.90, 35.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1071, 'Kit Relógio Condor Masculino Calotas CO2115VV/K8A - Cinza', 10, 'Condor', 125.93, 12.59, 'Calotas');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1072, 'Relógio Condor Masculino Civic COVD54AM/2M - Marrom', 10, 'Condor', 339.90, 33.99, 'Civic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1073, 'Relógio Condor Masculino Calotas CO2115VW/3A - Prata', 10, 'Condor', 149.90, 14.99, 'Calotas');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1074, 'Relógio Condor Masculino Civic COVD54AD/3P - Prata', 10, 'Condor', 339.90, 33.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1075, 'Relógio Condor Masculino Casual CO2115VO/3K - Prata', 10, 'Condor', 179.90, 17.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1076, 'Relógio Condor Masculino Casual CO2115VN/4P - Dourado', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1077, 'Relógio Condor Masculino Casual CO2115VJ/4C - Dourado', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1078, 'Relógio Condor Masculino Casual CO2115VM/4X - Dourado', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1079, 'Relógio Condor Masculino Casual CO2115VL/2K - Marrom', 10, 'Condor', 143.00, 14.30, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1080, 'Relógio Condor Coleção Urbano CO2415AS/3C - Prata', 10, 'Condor', 216.00, 21.60, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1081, 'Relógio Condor Coleção Urbano CO2415AT/4A - Dourado', 10, 'Condor', 243.40, 24.34, 'Urbano');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1082, 'Kit Relógio Condor Casual Prata - CO2035KNL/K3C', 10, 'Condor', 167.32, 16.73, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1083, 'Kit Relógio Condor Casual Prata - CO2035KNL/K3B', 10, 'Condor', 139.93, 13.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1084, 'Relógio Condor Casual Prata - CO2035KNI/3C', 10, 'Condor', 129.27, 12.92, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1085, 'Relógio Condor Esportivo Prata - CO2115UY/3C', 10, 'Condor', 247.00, 24.70, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1086, 'Relógio Condor Esportivo Prata - CO2415AO/3A', 10, 'Condor', 249.90, 24.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1087, 'Relógio Condor Esportivo Prata - COVD33AK/3P', 10, 'Condor', 242.72, 24.27, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1088, 'Relógio Condor Masculino 3D Geométrico - Preto CO2036DF/2P', 10, 'Condor', 179.90, 17.99, '3D Geométrico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1089, 'Relógio Condor Masculino 3D Geométrico - Dourado CO2036DE/4B', 10, 'Condor', 199.90, 19.99, '3D Geométrico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1090, 'Relógio Condor Masculino 3D Geométrico - Prata CO2036DJ/3C', 10, 'Condor', 179.90, 17.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1091, 'Relógio Condor Masculino 3D Geométrico - Dourado CO2036DE/4M', 10, 'Condor', 199.90, 19.99, '3D Geométrico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1092, 'Relógio Condor Masculino 3D Geométrico - Dourado CO2036DC/4A', 10, 'Condor', 199.90, 19.99, '3D Geométrico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1093, 'Relógio Condor Masculino 3D Geométrico - Dourado CO2036DC/4X', 10, 'Condor', 199.90, 19.99, '3D Geométrico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1094, 'Relógio Condor Masculino 3D Geométrico - Prata CO2036DD/3P', 10, 'Condor', 149.90, 14.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1095, 'Troca Pulseiras Condor Coleção Militar - CO2115UM/3C', 10, 'Condor', 153.93, 15.39, 'Militar');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1096, 'Troca pulseiras Condor Coleção Militar - CO2115UM/3B', 10, 'Condor', 153.93, 15.39, 'Militar');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1097, 'Relógio Condor Masculino Prata CO2115TQ/3C', 10, 'Condor', 198.90, 19.89, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1098, 'Relógio Condor Masculino Speed - CO2115UT/8C', 10, 'Condor', 199.90, 19.99, 'Speed');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1099, 'Relógio Condor Masculino Esportivo Anadigi - CO1101AD/3P', 10, 'Condor', 212.97, 21.29, 'Anadigi');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1100, 'Relógio Condor Masculino Esportivo Anadigi - CO1101AG/8K', 10, 'Condor', 259.90, 25.99, 'Anadigi');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1101, 'Relógio Condor Casual Metal - CO2115UX/4D', 10, 'Condor', 199.90, 19.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1102, 'Relógio Condor Masculino Militar - CO2115UI/3B', 10, 'Condor', 129.27, 12.92, 'Militar');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1103, 'Relógio Condor Masculino Militar - CO2115UI/3C', 10, 'Condor', 169.90, 16.99, 'Militar');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1104, 'Relógio Condor Masculino Militar - CO2115UH/3B', 10, 'Condor', 118.93, 11.89, 'Militar');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1105, 'Relógio Condor Masculino Prata - KC20869/3B', 10, 'Condor', 259.90, 25.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1106, 'Relógio Condor Masculino Casual CO2035KQO/5K - Dourado', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1107, 'Relógio Condor Masculino Casual CO2035KQP/K4X - Dourado', 10, 'Condor', 219.90, 21.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1108, 'Relógio Condor Masculino Metal   CO2035KQB/4C - Dourado', 10, 'Condor', 199.90, 19.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1109, 'Relógio Condor Masculino Metal   CO2035KQA/2D - Marrom', 10, 'Condor', 179.90, 17.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1110, 'Kit Relógio Condor Masculino Metal   CO2115WH/K5K - Dourado, Prata', 10, 'Condor', 219.90, 21.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1111, 'Kit Relógio Condor Masculino Metal   CO2115WG/K4P - Dourado', 10, 'Condor', 219.90, 21.99, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1112, 'Kit Relógio Condor Masculino Metal   CO2115WF/K3D - Prata', 10, 'Condor', 159.00, 15.90, 'Metal');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1113, 'Relógio Condor Masculino Anadigi COAD0912A/8C - Azul', 10, 'Condor', 143.04, 14.30, 'Anadigi');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1114, 'Relógio Condor Masculino Anadigi COAD0912A/8A - Preto', 10, 'Condor', 279.90, 27.99, 'Anadigi');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1115, 'Relógio Condor Masculino Anadigi COAD0912/3P - Prata', 10, 'Condor', 231.00, 23.10, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1116, 'Relógio Condor Masculino Anadigi COAD0912/3C - Prata', 10, 'Condor', 195.00, 19.50, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1117, 'Relógio Condor Coleção Casual CO2035KNV/4X - Dourado', 10, 'Condor', 199.90, 19.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1118, 'Relógio Condor Masculino Anadigi COAD0912/3A - Prata', 10, 'Condor', 195.00, 19.50, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1119, 'Relógio Condor Coleção Casual CO2035KNU/3K - Prata', 10, 'Condor', 179.90, 17.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1120, 'Relógio Condor Coleção Casual CO2035KNT/2A - Azul', 10, 'Condor', 179.90, 17.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1121, 'Relógio Condor Coleção Casual CO2035KNR/3C - Prata', 10, 'Condor', 179.90, 17.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1122, 'Relógio Condor Coleção Casual CO2035KNQ/4V - Dourado', 10, 'Condor', 159.90, 15.99, 'Casual');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1123, 'Relógio Condor Masculino Prata - KY20250/B', 10, 'Condor', 319.90, 31.99, 'Prata');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1124, 'Relógio Technos Masculino Steel Preto - 2115MOU/2P', 10, 'Technos', 279.90, 27.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1125, 'Relógio Technos Masculino Performance Racer Dourado - 2115MNZ/4A', 10, 'Technos', 299.90, 29.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1126, 'Relógio Technos Masculino Racer 2115MKS/8P', 10, 'Technos', 249.90, 24.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1127, 'Relógio Technos Racer Masculino 6P25BN/8P', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1128, 'Relógio Technos Golf 2315ACF/5P Bicolor', 10, 'Technos', 300.00, 30.00, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1129, 'Relógio Technos Masculino Steel Preto - 6P29AJP/2A', 10, 'Technos', 319.90, 31.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1130, 'Relógio Technos Calendário Lunar Masculino Preto - 6P21AA/4P', 10, 'Technos', 459.90, 45.99, 'Calendário Lunar');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1131, 'Relógio Technos Unissex Slim GM10YI/1P', 10, 'Technos', 439.90, 43.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1132, 'Relógio Technos Masculino Racer 2315KZP/4P - Dourado', 10, 'Technos', 379.90, 37.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1133, 'Relógio Technos Masculino Steel 2115MLB/0P', 10, 'Technos', 259.90, 25.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1134, 'Relógio Technos Masculino Steel 2115LAN/4P', 10, 'Technos', 299.90, 29.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1135, 'Relógio Technos Masculino Racer 2117LAH/1P', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1136, 'Relógio Technos Masculino Racer 2315ACQ/4A - Dourado', 10, 'Technos', 339.90, 33.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1137, 'Relógio Technos Executive Masculino Marrom 2115KZD/2K', 10, 'Technos', 359.90, 35.99, 'Executive');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1138, 'Relógio Technos Riviera Prata/Dourado 2415CG/5B', 10, 'Technos', 479.90, 47.99, 'Riviera');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1139, 'Relógio Technos Masculino Racer Analógico - 2115KSW/1R', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1140, 'Relógio Technos Skymaster Masculino JS25BG/0M Dourado', 10, 'Technos', 649.90, 64.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1141, 'Relógio Technos Legacy Masculino Ana Digi  - T205FJ/8P', 10, 'Technos', 719.90, 71.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1142, 'Relógio Technos Masculino Steel Prata - 2305AX/1P', 10, 'Technos', 259.90, 25.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1143, 'Relógio Technos Unissex Slim Rosé - 9T13AA/2A', 10, 'Technos', 459.90, 45.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1144, 'Relógio Technos Masculino Ts Digiana Prata - BJK203AAC/1P', 10, 'Technos', 599.90, 59.99, 'Ts Digiana');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1145, 'Relógio Technos Masculino Ts Digiana Dourado - BJK203AAD/4P', 10, 'Technos', 639.90, 63.99, 'Ts Digiana');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1146, 'Relógio Technos Masculino Ts Digiana Azul - BJK203AAE/4A', 10, 'Technos', 659.90, 65.99, 'Ts Digiana');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1147, 'Relógio Technos Calendário Lunar Masculino Couro - 6P80AD/2B', 10, 'Technos', 379.90, 37.99, 'Calendário Lunar');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1148, 'Relógio Technos Masculino Performance Racer Prata - 2305AW/1K', 10, 'Technos', 259.90, 25.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1149, 'Relógio Technos Masculino Classic Steel Prata - 2115MNU/1B', 10, 'Technos', 259.90, 25.99, 'Classic Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1150, 'Relógio Technos Automatico Masculino 8205NW/0P', 10, 'Technos', 599.90, 59.99, 'Automatico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1151, 'Relógio Technos Golf Masculino 2115LAQ/2C', 10, 'Technos', 379.90, 37.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1152, 'Relógio Technos Masculino Racer 2315ACP/1A', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1153, 'Relógio Technos Masculino Militar 2115MLJ/1P', 10, 'Technos', 272.00, 27.20, 'Militar');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1154, 'Relógio Technos Masculino Militar Prata', 10, 'Technos', 272.00, 27.20, 'Militar');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1155, 'Relógio Technos Masculino Steel 2115MNI/0P', 10, 'Technos', 259.90, 25.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1156, 'Relógio Technos Racer Masculino 2115MGO/1P', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1157, 'Relógio Technos Executive Masculino 2115KTE/2X Dourado', 10, 'Technos', 233.94, 23.39, 'Executive');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1158, 'Relógio Technos Skymaster JS25BF/4P Dourado', 10, 'Technos', 689.90, 68.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1159, 'Relógio Technos Masculino Ts Carbon Prata - 6P27CB/1T', 10, 'Technos', 589.90, 58.99, 'Carbon');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1160, 'Relógio Technos Performance - 2115KQB/8L', 10, 'Technos', 249.90, 24.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1161, 'Relógio Technos Steel Masculino Analógico - 2115KNL/1K', 10, 'Technos', 259.90, 25.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1162, 'Relógio Technos Executive Masculino Analógico - 1N12MQ/5B', 10, 'Technos', 379.90, 37.99, 'Executive');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1163, 'Relógio Technos Steel Masculino Analógico - 2115GY/1P', 10, 'Technos', 249.90, 24.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1164, 'Relógio Technos Steel Masculino Analógico - 2115GY/1K', 10, 'Technos', 239.90, 23.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1165, 'Relógio Technos Masculino Classic Ceramic/Saphire Dourado - JS15FI/4P', 10, 'Technos', 839.90, 83.99, 'Ceramic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1166, 'Relógio Technos Masculino Riviera Preto - 2350AC/4P', 10, 'Technos', 479.90, 47.99, 'Riviera');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1167, 'Relógio Technos Masculino Racer Prata - 6P22AE/1P', 10, 'Technos', 339.90, 33.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1168, 'Relógio Technos Masculino Classic Legacy Dourado - JS15BE/4K', 10, 'Technos', 759.90, 75.99, 'Classic Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1169, 'Relógio Technos Unissex Classic Slim Dourado - 9T22AK/4X', 10, 'Technos', 479.90, 47.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1170, 'Relógio Technos Unissex Slim Preto - 9U13AA/4P', 10, 'Technos', 539.90, 53.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1171, 'Relógio Technos Masculino Racer Dourado - 2115MOK/4A', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1172, 'Relógio Technos Masculino Steel Dourado - 2115MPA/4P', 10, 'Technos', 299.90, 29.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1173, 'Relógio Technos Masculino Steel Prata - 6P29AJO/1K', 10, 'Technos', 299.90, 29.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1174, 'Relógio Technos Masculino Steel Prata - 2115MOT/1P', 10, 'Technos', 259.90, 25.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1175, 'Relógio Technos Masculino Steel Prata - 6P29AJK/1P', 10, 'Technos', 299.90, 29.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1176, 'Relógio Technos Masculino Classic Steel Prata - 2115MNR/1A', 10, 'Technos', 259.90, 25.99, 'Classic Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1177, 'Relógio Technos Slim Masculino GL15AN/4A', 10, 'Technos', 479.90, 47.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1178, 'Relógio Technos Grandtech Masculino 6P57AC/2C', 10, 'Technos', 559.90, 55.99, 'Grandtech');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1179, 'Relógio Technos Unissex Slim GL20HJ/2M', 10, 'Technos', 439.90, 43.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1180, 'Relógio Technos Legacy Masculino OS2ABE/1C', 10, 'Technos', 736.00, 73.60, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1181, 'Relógio Technos Steel Masculino 2315KZM/1A', 10, 'Technos', 269.90, 26.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1182, 'Relógio Technos Masculino Racer 2315ACP/1P - Prata', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1183, 'Relógio Technos Masculino Racer 2115MGR/1P - Prata', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1184, 'Relógio Technos Masculino Slim GM10YH/2A', 10, 'Technos', 459.90, 45.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1185, 'Relógio Technos Legacy Masculino OS2ABF/4A', 10, 'Technos', 769.90, 76.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1186, 'Relógio Technos Riviera Prata 2415CI/1A', 10, 'Technos', 399.90, 39.99, 'Riviera');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1187, 'Relógio Technos Steel Masculino 2115LAN/4A', 10, 'Technos', 299.90, 29.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1188, 'Relógio Technos Legacy Masculino Preto JS26AG/4P', 10, 'Technos', 779.90, 77.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1189, 'Relógio Technos Legacy Masculino Dourado JS26AE/4X', 10, 'Technos', 759.90, 75.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1190, 'Relógio Technos Masculino Racer 6P29AIQ/K8P', 10, 'Technos', 349.90, 34.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1191, 'Relógio Technos Golf 6P25BK/1B Prata', 10, 'Technos', 383.92, 38.39, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1192, 'Relógio Technos Racer  6P25BI/8P Prata', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1193, 'Relógio Technos Racer 2115KTD/1A Prata', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1194, 'Relógio Technos Legacy Masculino Cronógrafo - OS20IB/4X', 10, 'Technos', 759.90, 75.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1195, 'Relógio Technos Legacy Masculino Cronógrafo - OS1AAP/4P', 10, 'Technos', 759.90, 75.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1196, 'Relógio Technos Executive Masculino Analógico - 1N12MP/4X', 10, 'Technos', 359.90, 35.99, 'Executive');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1197, 'Relógio Technos Masculino Classic Ceramic/Saphire Prata - JS15FJ/1A', 10, 'Technos', 799.90, 79.99, 'Ceramic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1198, 'Relógio Technos Masculino Racer Dourado - 2115MPI/4A', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1199, 'Relógio Technos Masculino Classic Steel Prata - 2115MOG/K0A', 10, 'Technos', 269.90, 26.99, 'Classic Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1200, 'Relógio Technos Masculino Classic Steel Prata - 2115MNX/K1P', 10, 'Technos', 269.90, 26.99, 'Classic Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1201, 'Relógio Technos Masculino Classic Automatico Dourado - 8205OG/2P', 10, 'Technos', 592.00, 59.20, 'Automatico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1202, 'Relógio Technos Masculino Classic Automatico Prata - 8205OE/1K', 10, 'Technos', 739.90, 73.99, 'Automatico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1203, 'Relógio Technos Masculino Performance Racer Prata - 2117LAN/1P', 10, 'Technos', 259.90, 25.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1204, 'Relógio Technos Masculino Steel Prata - 2115MPK/1A', 10, 'Technos', 259.90, 25.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1205, 'Relógio Technos Masculino Classic Automatico Dourado - 8205NL/4K', 10, 'Technos', 779.90, 77.99, 'Automatico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1206, 'Relógio Technos Masculino Classic Steel Dourado - 2305AM/4C', 10, 'Technos', 439.90, 43.99, 'Classic Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1207, 'Relógio Technos Masculino Steel Dourado - 2305AY/4X', 10, 'Technos', 299.90, 29.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1208, 'Relógio Technos Masculino Steel Dourado - 2305AZ/2B', 10, 'Technos', 259.90, 25.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1209, 'Relógio Technos Masculino Steel Preto - 2305BA/2A', 10, 'Technos', 279.90, 27.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1210, 'Relógio Technos Masculino Racer Prata - 2115MOL/1B', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1211, 'Relógio Technos Masculino Racer Dourado - 2115MOM/8B', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1212, 'Relógio Technos Masculino Skymaster Dourado - JS15FE/4P', 10, 'Technos', 679.90, 67.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1213, 'Relógio Technos Masculino Skymaster Prata - JS15FF/1A', 10, 'Technos', 639.90, 63.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1214, 'Relógio Technos Masculino Skymaster Dourado - JS15FE/4C', 10, 'Technos', 680.90, 68.09, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1215, 'Relógio Technos Masculino Riviera Dourado - 2350AD/4X', 10, 'Technos', 459.90, 45.99, 'Riviera');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1216, 'Relógio Technos Masculino Racer Prata - 2117LAR/1P', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1217, 'Relógio Technos Masculino Racer Dourado - 2117LAS/4X', 10, 'Technos', 339.90, 33.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1218, 'Relógio Technos Masculino Legacy Dourado - JS16AB/4P', 10, 'Technos', 899.90, 89.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1219, 'Relógio Technos Masculino Legacy Grafite - JS16AA/4C', 10, 'Technos', 919.90, 91.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1220, 'Relógio Technos Masculino Classic Legacy Dourado - JS15BE/4X', 10, 'Technos', 959.90, 95.99, 'Classic Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1221, 'Relógio Technos Masculino Performance Racer Prata - 2115KSX/1A', 10, 'Technos', 259.90, 25.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1222, 'Relógio Technos Masculino Performance Racer Prata - 2115KSX/1P', 10, 'Technos', 259.90, 25.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1223, 'Relógio Technos Masculino Classic Steel Dourado - 2115KPR/4A', 10, 'Technos', 439.90, 43.99, 'Classic Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1224, 'Relógio Technos Masculino Racer Prata - 2315ACI/1A', 10, 'Technos', 319.90, 31.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1225, 'Relógio Technos Masculino Racer Dourado - 2315ACK/4P', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1226, 'Relógio Technos Masculino Racer Prata - 2315KZO/1P', 10, 'Technos', 319.90, 31.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1227, 'Relógio Technos Masculino Racer Dourado - 2315KZP/4B', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1228, 'Relógio Technos Masculino Racer Prata - 2315KZN/8R', 10, 'Technos', 249.90, 24.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1229, 'Relógio Technos Masculino Racer Dourado - 2315KZP/4A', 10, 'Technos', 359.90, 35.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1230, 'Relógio Technos Masculino Classic Steel Dourado - 2115MOF/4P', 10, 'Technos', 299.90, 29.99, 'Classic Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1231, 'Relógio Technos Unissex Classic Slim Prata - 9T22AI/1A', 10, 'Technos', 479.90, 47.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1232, 'Relógio Technos Unissex Slim Dourado - 9T22AJ/2B', 10, 'Technos', 479.90, 47.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1233, 'Relógio Technos Unissex Classic Slim Rosé - 9T22AL/4C', 10, 'Technos', 499.90, 49.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1234, 'Relógio Technos Unissex Slim Dourado - 9T13AB/4B', 10, 'Technos', 479.90, 47.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1235, 'Relógio Technos Unissex Slim Prata - 9U13AC/1B', 10, 'Technos', 439.90, 43.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1236, 'Relógio Technos Masculino Essence Dourado - F06111AA/4W', 10, 'Technos', 999.90, 99.99, 'Essence');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1237, 'Relógio Technos Masculino Essence Prata - F06111AB/1W', 10, 'Technos', 959.90, 95.99, 'Essence');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1238, 'Relógio Technos Masculino Essence Preto - F06111AC/4W', 10, 'Technos', 1019.90, 101.99, 'Essence');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1239, 'Relógio Technos Masculino Steel Prata - 2115MOZ/1A', 10, 'Technos', 259.90, 25.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1240, 'Relógio Technos Masculino Racer Dourado - 2115MPC/4K', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1241, 'Relógio Technos Masculino Steel Dourado - 6P29AJN/4X', 10, 'Technos', 339.90, 33.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1242, 'Relógio Technos Masculino Racer Prata - 2115MPD/1A', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1243, 'Relógio Technos Masculino Automatico Prata - 82S7AA/1A', 10, 'Technos', 759.90, 75.99, 'Automatico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1244, 'Relógio Technos Masculino Automatico Preto - 82S7AC/4P', 10, 'Technos', 819.90, 81.99, 'Automatico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1245, 'Relógio Technos Unissex Slim Rosé - 1L45AY/4C', 10, 'Technos', 499.90, 49.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1246, 'Relógio Technos Masculino Automatico Dourado - 82S7AB/4X', 10, 'Technos', 799.90, 79.99, 'Automatico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1247, 'Relógio Technos Unissex Slim Dourado - 1L45AZ/4B', 10, 'Technos', 479.90, 47.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1248, 'Relógio Technos Unissex Classic Slim Dourado - 2025LTK/4A', 10, 'Technos', 519.90, 51.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1249, 'Relógio Technos Unissex Classic Slim Prata - 2025LTL/1K', 10, 'Technos', 439.90, 43.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1250, 'Relógio Technos Unissex Classic Slim Preto - 2025LTM/4P', 10, 'Technos', 499.90, 49.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1251, 'Relógio Technos Calendário Lunar Masculino Dourado - 6P80AC/4P', 10, 'Technos', 399.90, 39.99, 'Calendário Lunar');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1252, 'Relógio Technos Masculino Racer Prata - 2115MOW/1B', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1253, 'Relógio Technos Masculino Steel Dourado - 2115MOS/4A', 10, 'Technos', 299.90, 29.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1254, 'Relógio Technos Masculino Skydiver Prata - T20562/1R', 10, 'Technos', 519.90, 51.99, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1255, 'Relógio Technos Masculino Skydiver Prata - T20562/1L', 10, 'Technos', 519.90, 51.99, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1256, 'Relógio Technos Masculino Skydiver Prata - T20562/1B', 10, 'Technos', 519.90, 51.99, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1257, 'Relógio Technos Masculino Classic Steel Prata - 2115KQK/1C', 10, 'Technos', 259.90, 25.99, 'Classic Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1258, 'Relógio Technos Masculino Skydiver Prata - T20562/1P', 10, 'Technos', 519.90, 51.99, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1259, 'Relógio Technos Masculino Classic Steel Dourado - 6P29AJI/4K', 10, 'Technos', 339.90, 33.99, 'Classic Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1260, 'Relógio Technos Masculino Performance Acqua Prata - JS25BP/0P', 10, 'Technos', 899.90, 89.99, 'Acqua');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1261, 'Relógio Technos Masculino Racer 2115MGT/1A', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1262, 'Relógio Technos Masculino Performance Racer Dourado - 2115MOD/4D', 10, 'Technos', 359.90, 35.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1263, 'Relógio Technos Masculino Performance Skymaster Prata - 6S21AC/0P', 10, 'Technos', 639.90, 63.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1264, 'Relógio Technos Masculino Performance Skymaster Dourado - 6S21AB/1D', 10, 'Technos', 679.90, 67.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1265, 'Relógio Technos Masculino Skymaster Prata - 6S21AA/1A', 10, 'Technos', 639.90, 63.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1266, 'Relógio Technos Masculino Skymaster Prata - JS26AH/1P', 10, 'Technos', 639.90, 63.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1267, 'Relógio Technos Masculino Skymaster Dourado - JS26AJ/4A', 10, 'Technos', 679.90, 67.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1268, 'Relógio Technos Masculino Skymaster Dourado - JS26AK/4X', 10, 'Technos', 679.90, 67.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1269, 'Relógio Technos Masculino Performance Racer Prata - 2115MOC/1A', 10, 'Technos', 279.90, 27.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1270, 'Relógio Technos Masculino Performance Racer Prata - 2115MOB/1P', 10, 'Technos', 319.90, 31.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1271, 'Relógio Technos Masculino Performance Racer Dourado - 2115MNZ/4P', 10, 'Technos', 299.90, 29.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1272, 'Relógio Technos Masculino Performance Racer Prata - 2115MNY/1B', 10, 'Technos', 259.90, 25.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1273, 'Relógio Technos Masculino Performance Racer Dourado - 2305AV/4X', 10, 'Technos', 319.90, 31.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1274, 'Relógio Technos Masculino Performance Racer Prata - 2305AU/1A', 10, 'Technos', 279.90, 27.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1275, 'Relógio Technos Masculino Performance Racer Dourado - 2305AT/8P', 10, 'Technos', 279.90, 27.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1276, 'Relógio Technos Masculino Classic Steel Dourado - 2115MNW/4P', 10, 'Technos', 299.90, 29.99, 'Classic Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1277, 'Relógio Technos Masculino Classic Steel Prata - 2115MNV/1P', 10, 'Technos', 279.90, 27.99, 'Classic Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1278, 'Relógio Technos Masculino Classic Automatico Dourado - 8205OF/4P', 10, 'Technos', 779.90, 77.99, 'Automatico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1279, 'Relógio Technos Automatico Masculino 8205NX/4A', 10, 'Technos', 779.00, 77.90, 'Automatico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1280, 'Relógio Technos Masculino Legacy Dourado - JS25BI/4B', 10, 'Technos', 959.00, 95.90, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1281, 'Relógio Technos Masculino Steel 2115MLC/1C', 10, 'Technos', 269.90, 26.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1282, 'Relógio Technos Masculino Classic Steel Dourado - 2115MNP/1D', 10, 'Technos', 299.90, 29.99, 'Classic Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1283, 'Relógio Technos Masculino Classic Steel Dourado - 2115MNQ/0D', 10, 'Technos', 259.90, 25.99, 'Classic Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1284, 'Relógio Technos Masculino Performance Racer Dourado - 2117LAK/1P', 10, 'Technos', 299.90, 29.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1285, 'Relógio Technos Masculino Performance Racer Dourado - 2117LAL/1B', 10, 'Technos', 299.90, 29.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1286, 'Relógio Technos Masculino Steel 2115KNQ/1K', 10, 'Technos', 269.90, 26.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1287, 'Relógio Technos Automatico Masculino 8205NX/4B', 10, 'Technos', 624.00, 62.40, 'Automatico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1288, 'Relógio Technos Masculino Performance Acqua Prata - 2315KZQ/0A', 10, 'Technos', 688.00, 68.80, 'Acqua');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1289, 'Relógio Technos Masculino Racer 2115MGS/4P', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1290, 'Relógio Technos Masculino Racer 2115MGS/4B', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1291, 'Relógio Technos Masculino Racer 2115MGR/1B', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1292, 'Relógio Technos Ceramic Masculino JS15EU/1P', 10, 'Technos', 720.00, 72.00, 'Ceramic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1293, 'Relógio Technos Slim Masculino GL15AO/1C', 10, 'Technos', 416.00, 41.60, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1294, 'Relógio Technos Unissex Slim 1L22WI/4P', 10, 'Technos', 479.90, 47.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1295, 'Relógio Technos Unissex Slim GL20AQ/4P', 10, 'Technos', 479.90, 47.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1296, 'Relógio Technos Masculino Racer 2315KZN/8P - Preto', 10, 'Technos', 249.90, 24.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1297, 'Relógio Technos Masculino Performance Acqua Prata - JS25BQ/8P', 10, 'Technos', 859.90, 85.99, 'Acqua');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1298, 'Relógio Technos Masculino Legacy JS15ER/4A', 10, 'Technos', 759.90, 75.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1299, 'Relógio Technos Masculino Steel Prata - 2115MLA/1P', 10, 'Technos', 259.90, 25.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1300, 'Relógio Technos Steel Masculino 2115MMJ/0B', 10, 'Technos', 269.90, 26.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1301, 'Relógio Technos Masculino Racer 2115MLO/1K - Prata', 10, 'Technos', 309.90, 30.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1302, 'Relógio Technos Masculino Racer 2115MGU/8K', 10, 'Technos', 175.00, 17.50, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1303, 'Relógio Technos Masculino Racer 2115MGT/1P', 10, 'Technos', 249.90, 24.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1304, 'Relógio Technos Steel Masculino 2115MMH/1B', 10, 'Technos', 259.90, 25.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1305, 'Relógio Technos Masculino Steel 2115MKW/1V', 10, 'Technos', 269.90, 26.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1306, 'Relógio Technos Carbon Masculino JS15EW/4P', 10, 'Technos', 829.90, 82.99, 'Carbon');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1307, 'Relógio Technos Riviera Feminino 2115KQQ/4X', 10, 'Technos', 459.90, 45.99, 'Riviera');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1308, 'Relógio Technos Racer Masculino 2117LAI/1P', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1309, 'Relógio Technos Racer Masculino 2117LAH/1B', 10, 'Technos', 229.90, 22.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1310, 'Relógio Technos Executive Masculino 2115LAT/4C', 10, 'Technos', 429.90, 42.99, 'Executive');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1311, 'Relógio Technos Executive Masculino 2115LAS/4K', 10, 'Technos', 399.90, 39.99, 'Executive');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1312, 'Relógio Technos Executive Masculino 2115LAU/1A', 10, 'Technos', 359.90, 35.99, 'Executive');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1313, 'Relógio Technos Executive Masculino 2115LAR/4P', 10, 'Technos', 399.90, 39.99, 'Executive');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1314, 'Relógio Technos Carbon Masculino JS15EX/4P', 10, 'Technos', 839.90, 83.99, 'Carbon');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1315, 'Relógio Technos Ceramic Masculino JS15ET/4P', 10, 'Technos', 839.90, 83.99, 'Ceramic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1316, 'Relógio Technos Golf Masculino 2115LAP/4X', 10, 'Technos', 399.90, 39.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1317, 'Relógio Technos Racer Masculino 2115LAK/1P', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1318, 'Relógio Technos Racer Masculino 2115LAK/1B', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1319, 'Relógio Technos Carbon Masculino JS15EV/1P', 10, 'Technos', 789.90, 78.99, 'Carbon');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1320, 'Relógio Technos Masculino Steel 2115LAN/4X', 10, 'Technos', 299.90, 29.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1321, 'Relógio Technos Masculino Steel 2115MMU/5B', 10, 'Technos', 279.90, 27.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1322, 'Relógio Technos Masculino Racer 2115MMV/4P', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1323, 'Relógio Technos Masculino Racer 2115MMW/1K', 10, 'Technos', 256.00, 25.60, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1324, 'Relógio Technos Masculino Racer 2115MMX/8A', 10, 'Technos', 249.90, 24.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1325, 'Relógio Technos Masculino Racer 2115MMY/4K', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1326, 'Relógio Technos Masculino Skymaster JS15EY/4P', 10, 'Technos', 689.90, 68.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1327, 'Relógio Technos Masculino Skymaster JS15EZ/5B', 10, 'Technos', 709.90, 70.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1328, 'Relógio Technos Masculino Skymaster JS15FA/1A', 10, 'Technos', 649.90, 64.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1329, 'Relógio Technos Masculino Skymaster JS15FB/4P', 10, 'Technos', 699.90, 69.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1330, 'Relógio Technos Masculino Racer 2117LAF/8B', 10, 'Technos', 249.90, 24.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1331, 'Relógio Technos Masculino Racer 2117LAJ/8B', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1332, 'Relógio Technos Masculino Steel 2115MNG/4C', 10, 'Technos', 329.90, 32.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1333, 'Relógio Technos Masculino Steel 2115MNG/4X', 10, 'Technos', 299.90, 29.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1334, 'Relógio Technos Masculino Legacy 2035MLA/4P', 10, 'Technos', 759.90, 75.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1335, 'Relógio Technos Masculino Legacy 2035MLB/4A', 10, 'Technos', 779.90, 77.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1336, 'Relógio Technos Masculino Legacy 2035MLC/1P', 10, 'Technos', 752.00, 75.20, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1337, 'Relógio Technos Masculino Ceramic/Saphire JS25BR/4P', 10, 'Technos', 759.90, 75.99, 'Ceramic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1338, 'Relógio Technos Masculino Ceramic/Saphire JS25BS/1A', 10, 'Technos', 720.00, 72.00, 'Ceramic');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1339, 'Relógio Technos Masculino Racer 2315ACO/8R - Preto', 10, 'Technos', 249.90, 24.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1340, 'Relógio Technos Masculino Racer 2115MGS/4A - Dourado', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1341, 'Relógio Technos Masculino Racer 2115MGS/4K - Dourado', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1342, 'Relógio Technos Masculino Racer 2115MGR/1K - Prata', 10, 'Technos', 249.90, 24.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1343, 'Relógio Technos Skymaster Masculino JS15FC/4P', 10, 'Technos', 689.90, 68.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1344, 'Relógio Technos Skymaster Masculino JS15FC/4X', 10, 'Technos', 689.90, 68.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1345, 'Relógio Technos Skymaster Masculino JS15FD/1A', 10, 'Technos', 649.90, 64.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1346, 'Relógio Technos Vitra Masculino Prata JS15EO/1P', 10, 'Technos', 869.90, 86.99, 'Vitra');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1347, 'Relógio Technos Steel Masculino 2315KZM/1P', 10, 'Technos', 269.90, 26.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1348, 'Relógio Technos Steel Masculino 2315KZL/4B', 10, 'Technos', 299.90, 29.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1349, 'Relógio Technos Masculino Steel 2115MKW/1M', 10, 'Technos', 269.90, 26.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1350, 'Relógio Technos Masculino Steel Prata - 2115MKY/1A', 10, 'Technos', 260.90, 26.09, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1351, 'Relógio Technos Masculino Carbon OS20HM/8P', 10, 'Technos', 829.90, 82.99, 'Carbon');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1352, 'Relógio Technos Legacy Masculino Azul JS26AF/4A', 10, 'Technos', 779.90, 77.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1353, 'Relógio Technos Vitra Masculino Dourado JS15EP/4X', 10, 'Technos', 909.90, 90.99, 'Vitra');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1354, 'Relógio Technos Masculino Carbon OS20HM/1B', 10, 'Technos', 869.90, 86.99, 'Carbon');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1355, 'Relógio Technos Steel Masculino 2115LAM/4K', 10, 'Technos', 299.90, 29.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1356, 'Relógio Technos Masculino Slim GM10YG/1P', 10, 'Technos', 439.90, 43.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1357, 'Relógio Technos Masculino Slim GM10YF/4X', 10, 'Technos', 479.90, 47.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1358, 'Relógio Technos Grandtech OS10CR/4A Dourado', 10, 'Technos', 639.90, 63.99, 'Grandtech');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1359, 'Relógio Technos Racer 2115KZA/8P Preto', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1360, 'Relógio Technos Racer 2115KYZ/4A Dourado', 10, 'Technos', 339.90, 33.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1361, 'Relógio Technos Racer 2115KYY/8K Preto', 10, 'Technos', 269.90, 26.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1362, 'Relógio Technos Racer 2115KYX/1P Prata', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1363, 'Relógio Technos Legacy Masculino OS2ABH/4P', 10, 'Technos', 800.00, 80.00, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1364, 'Relógio Technos Legacy Masculino OS2ABG/8P', 10, 'Technos', 719.90, 71.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1365, 'Relógio Technos Racer Masculino 2115MGQ/4A', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1366, 'Relógio Technos Racer Masculino 2115MGO/1B', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1367, 'Relógio Technos Golf Masculino 2115LAO/1A', 10, 'Technos', 359.90, 35.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1368, 'Relógio Technos Grandtech OS10CR/4K Dourado', 10, 'Technos', 639.90, 63.99, 'Grandtech');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1369, 'Relógio Technos Skymaster Masculino 6P25BM/1K', 10, 'Technos', 439.90, 43.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1370, 'Relógio Technos Skymaster Masculino 2415CL/4P', 10, 'Technos', 639.90, 63.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1371, 'Relógio Technos Skymaster Masculino 2415CK/4A', 10, 'Technos', 629.90, 62.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1372, 'Relógio Technos Skymaster Masculino 2415CJ/0P', 10, 'Technos', 589.90, 58.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1373, 'Relógio Technos Steel Masculino 2115LAY/1V', 10, 'Technos', 269.90, 26.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1374, 'Relógio Technos Steel Masculino 2115LAL/0P', 10, 'Technos', 269.90, 26.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1375, 'Relógio Technos Golf 2305AS/5K Bicolor', 10, 'Technos', 509.90, 50.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1376, 'Relógio Technos Legacy Masculino Prata JS26AD/1P', 10, 'Technos', 949.90, 94.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1377, 'Relógio Technos Executive Masculino Dourado 2115KZC/4X', 10, 'Technos', 399.90, 39.99, 'Executive');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1378, 'Relógio Technos Executive Masculino Dourado 2115KZC/4A', 10, 'Technos', 429.90, 42.99, 'Executive');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1379, 'Relógio Technos Skydiver Masculino T20565/1P', 10, 'Technos', 599.90, 59.99, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1380, 'Relógio Technos Racer 2115KTM/1P Prata', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1381, 'Relógio Technos Racer 2115KTM/1C Prata', 10, 'Technos', 289.90, 28.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1382, 'Relógio Technos Skydiver T205IX/0P Marrom', 10, 'Technos', 559.90, 55.99, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1383, 'Relógio Technos Racer Masculino Prata 2115KZB/1B', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1384, 'Relógio Technos Racer Masculino Prata 2115KZB/1P', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1385, 'Relógio Technos Racer Masculino Prata 2115KZB/1A', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1386, 'Relógio Technos Automatico 8205NO/5A Bicolor', 10, 'Technos', 518.00, 51.80, 'Automatico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1387, 'Relógio Technos Automatico 8205NM/1B Prata', 10, 'Technos', 476.00, 47.60, 'Automatico');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1388, 'Relógio Technos Racer 2115KZZ/1C Prata', 10, 'Technos', 289.90, 28.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1389, 'Relógio Technos Racer 2115KZZ/1A Prata', 10, 'Technos', 289.90, 28.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1390, 'Relógio Technos Racer 2115KTM/1B Prata', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1391, 'Relógio Technos Racer 2315ACL/4P Dourado', 10, 'Technos', 409.90, 40.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1392, 'Relógio Technos Skydiver T205IW/1P Prata', 10, 'Technos', 512.00, 51.20, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1393, 'Relógio Technos Racer 2315ACH/8P Preto', 10, 'Technos', 289.90, 28.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1394, 'Relógio Technos Legacy JS15EM/4A Dourado', 10, 'Technos', 759.90, 75.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1395, 'Relógio Technos Legacy JS15EL/4C Bicolor', 10, 'Technos', 779.90, 77.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1396, 'Relógio Technos Legacy JS15EK/8P Preto', 10, 'Technos', 719.90, 71.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1397, 'Relógio Technos Riviera Dourado 2415CH/4X', 10, 'Technos', 459.90, 45.99, 'Riviera');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1398, 'Relógio Technos Steel 2115KTP/4P Dourado', 10, 'Technos', 299.90, 29.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1399, 'Relógio Technos Masculino Racer Analógico - 2115KTC/1P', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1400, 'Relógio Technos Masculino Racer Analógico - 2115KTB/8P', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1401, 'Relógio Technos Masculino Racer Analógico - 2115KSS/1P', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1402, 'Relógio Technos Masculino Golf Analógico - 2115KSP/0K', 10, 'Technos', 279.90, 27.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1403, 'Relógio Technos Masculino Golf Analógico - 2115KSO/2C', 10, 'Technos', 216.93, 21.69, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1404, 'Relógio Technos Skymaster JS15EN/1C Prata', 10, 'Technos', 489.90, 48.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1405, 'Relógio Technos Executive Masculino 2115KTH/4M Dourado', 10, 'Technos', 399.90, 39.99, 'Executive');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1406, 'Relógio Technos Executive Masculino 2115KTG/1P Prata', 10, 'Technos', 359.90, 35.99, 'Executive');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1407, 'Relógio Technos Skydiver Masculino T205FX/1B Prata', 10, 'Technos', 639.90, 63.99, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1408, 'Relógio Technos Masculino Golf Analógico - 2115KSO/2A', 10, 'Technos', 309.90, 30.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1409, 'Relógio Technos Carbon Masculino OS1AAU/1C Prata', 10, 'Technos', 539.90, 53.99, 'Carbon');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1410, 'Relógio Technos Masculino Executive 2115KSC/K1C', 10, 'Technos', 359.90, 35.99, 'Executive');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1411, 'Relógio Technos Masculino Legacy Analógico - T205FU/4X', 10, 'Technos', 759.90, 75.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1412, 'Relógio Technos Masculino Grandtech Analógico - 6P25BA/1C', 10, 'Technos', 324.00, 32.40, 'Grandtech');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1413, 'Relógio Technos Masculino Grandtech Analógico - 6P25AZ/0M', 10, 'Technos', 324.00, 32.40, 'Grandtech');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1414, 'Relógio Technos Masculino Grandtech Analógico - 6P25AY/4C', 10, 'Technos', 245.94, 24.59, 'Grandtech');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1415, 'Relógio Technos Masculino Legacy Analógico - JS15BE/8X', 10, 'Technos', 909.90, 90.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1416, 'Relógio Technos Masculino Racer Analógico - 2115KSR/8L', 10, 'Technos', 289.90, 28.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1417, 'Relógio Technos Masculino Racer Analógico - 2115KSR/8Y', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1418, 'Relógio Technos Masculino Steel Analógico - 2035MFC/1A', 10, 'Technos', 175.00, 17.50, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1419, 'Relógio Technos Masculino Racer Analógico - 2115KTD/1K', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1420, 'Relógio Technos Racer 2115KSU/1R Prata', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1421, 'Relógio Technos Racer 2115KSU/1Y Prata', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1422, 'Relógio Technos Masculino Racer Analógico - 2115KSZ/8A', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1423, 'Relógio Technos Masculino Racer Analógico - 6P29AIR/8P', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1424, 'Relógio Technos Masculino Slim Analógico - 6P29AIS/5B', 10, 'Technos', 449.90, 44.99, 'Slim');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1425, 'Relógio Technos Racer 2115KSX/1Y Prata', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1426, 'Relógio Technos Racer 2115KSX/1R Prata', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1427, 'Relógio Technos Racer 2115KSY/1A Prata', 10, 'Technos', 309.90, 30.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1428, 'Relógio Technos Skymaster JS25BH/1P Prata', 10, 'Technos', 649.90, 64.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1429, 'Relógio Technos Racer 2115KSQ/1Y Prata', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1430, 'Relógio Technos Masculino Racer Analógico - 2115KSV/1R', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1431, 'Relógio Technos Masculino Racer Analógico - 2115KSV/1Y', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1432, 'Relógio Technos Masculino Skymaster Analógico - 2415CE/4D', 10, 'Technos', 496.00, 49.60, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1433, 'Relógio Technos Masculino Skymaster Analógico - 6P25BF/4P', 10, 'Technos', 559.90, 55.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1434, 'Relógio Technos Masculino Skymaster Analógico - 6P25BG/1A', 10, 'Technos', 528.00, 52.80, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1435, 'Relógio Technos Masculino Skymaster Analógico - 6P25BG/1P', 10, 'Technos', 528.00, 52.80, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1436, 'Relógio Technos Masculino Steel 1S13BCTDY/1C', 10, 'Technos', 309.90, 30.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1437, 'Relógio Technos Masculino Steel 1S13BCTDY/1B', 10, 'Technos', 309.90, 30.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1438, 'Relógio Technos Legacy 6P29AIM/8A Prata', 10, 'Technos', 532.00, 53.20, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1439, 'Relógio Technos Racer 2115KSL/1Y Prata', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1440, 'Relógio Technos Racer 2115KSL/1R Prata', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1441, 'Relógio Technos Racer 2115KSL/1P Prata', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1442, 'Relógio Technos Racer 2115KSL/1A Prata', 10, 'Technos', 299.90, 29.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1443, 'Relógio Technos Steel 2115KSK/1C Prata', 10, 'Technos', 269.90, 26.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1444, 'Relógio Technos Steel 2115KSA/1P Prata', 10, 'Technos', 269.90, 26.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1445, 'Relógio Technos Masculino Steel 1S13BWTDY/4X', 10, 'Technos', 299.90, 29.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1446, 'Relógio Technos Steel Masculino Analógico - 2035MCW/1P', 10, 'Technos', 269.90, 26.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1447, 'Relógio Technos Skydiver Masculino Ana Digi  - T205FQ/5B', 10, 'Technos', 599.90, 59.99, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1448, 'Relógio Technos Executive Masculino Analógico - 2115KRP/3V', 10, 'Technos', 269.90, 26.99, 'Executive');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1449, 'Relógio Technos Skydiver Masculino Ana Digi  - T205FQ/5P', 10, 'Technos', 599.90, 59.99, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1450, 'Relógio Technos Racer Masculino Analógico - 2315ABZ/8R', 10, 'Technos', 269.90, 26.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1451, 'Relógio Technos Racer Masculino Analógico - 2315ABY/1P', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1452, 'Relógio Technos Golf Masculino Analógico - 2115KQU/4C', 10, 'Technos', 399.90, 39.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1453, 'Relógio Technos Golf Masculino Analógico - 2115KQU/4A', 10, 'Technos', 399.90, 39.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1454, 'Relógio Technos Grandtech Masculino Multifunção - 6P29AIC/4C', 10, 'Technos', 449.90, 44.99, 'Grandtech');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1455, 'Relógio Technos Skydiver Masculino Ana Digi  - T205FL/4P', 10, 'Technos', 639.90, 63.99, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1456, 'Relógio Technos Skydiver Masculino Ana Digi  - T205FL/4A', 10, 'Technos', 639.90, 63.99, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1457, 'Relógio Technos Skydiver Masculino Ana Digi  - T205FM/1C', 10, 'Technos', 599.90, 59.99, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1458, 'Relógio Technos Skydiver Masculino Ana Digi  - T205FM/1A', 10, 'Technos', 599.90, 59.99, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1459, 'Relógio Technos Golf Masculino Analógico - 2115KRM/4C', 10, 'Technos', 399.90, 39.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1460, 'Relógio Technos Golf Masculino Analógico - 2115KRO/1M', 10, 'Technos', 369.90, 36.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1461, 'Relógio Technos Golf Masculino Analógico - 2115KRN/5A', 10, 'Technos', 419.90, 41.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1462, 'Relógio Technos Legacy Masculino Prata 2115KOV/MK1P', 10, 'Technos', 469.90, 46.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1463, 'Relógio Technos Masculino Riviera - GL10IA/M4P', 10, 'Technos', 336.00, 33.60, 'Riviera');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1464, 'Relógio Technos Grandtech Masculino Multifunção - 6P22AD/1P', 10, 'Technos', 439.90, 43.99, 'Grandtech');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1465, 'Relógio Technos Grandtech Masculino Multifunção - 6P29AIF/4P', 10, 'Technos', 449.90, 44.99, 'Grandtech');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1466, 'Relógio Technos Golf Masculino Analógico - 2115KQS/4K', 10, 'Technos', 399.90, 39.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1467, 'Relógio Technos Racer Masculino Analógico - 2036LNV/1R', 10, 'Technos', 197.94, 19.79, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1468, 'Relógio Technos Performance - 6P29AHW/1Y', 10, 'Technos', 339.90, 33.99, 'Performance');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1469, 'Relógio Technos Grandtech Masculino Multifunção - 6P25AP/1M', 10, 'Technos', 347.94, 34.79, 'Grandtech');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1470, 'Relógio Technos Golf Masculino Analógico - 2115KPR/4X', 10, 'Technos', 489.90, 48.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1471, 'Relógio Technos Militar Masculino Analógico - 2035LYE/1U', 10, 'Technos', 359.90, 35.99, 'Militar');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1472, 'Relógio Technos Ts Carbon Masculino - 0527AD/8P', 10, 'Technos', 729.90, 72.99, 'Carbon');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1473, 'Relógio Technos Ts Carbon Masculino Cronógrafo - OS1AAZ/0C', 10, 'Technos', 949.90, 94.99, 'Carbon');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1474, 'Relógio Technos Skydiver Masculino Ana Digi  - T20557/9B', 10, 'Technos', 519.90, 51.99, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1475, 'Relógio Technos Golf Masculino Analógico - 2115RV/4M', 10, 'Technos', 489.90, 48.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1476, 'Relógio Technos Steel Masculino Analógico - 2115GW/5K', 10, 'Technos', 349.90, 34.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1477, 'Relógio Technos Skymaster Masculino Analógico - 2115GS/1P', 10, 'Technos', 379.90, 37.99, 'Skymaster');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1478, 'Relógio Technos Racer Masculino Analógico - 2115GU/1R', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1479, 'Relógio Technos Skydiver Masculino Ana Digi  - T20557/1P', 10, 'Technos', 519.90, 51.99, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1480, 'Relógio Technos Solar Masculino Cronógrafo - VS75AA/1C', 10, 'Technos', 659.90, 65.99, 'Solar');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1481, 'Relógio Technos Legacy Masculino Cronógrafo - OS20IK/4X', 10, 'Technos', 759.90, 75.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1482, 'Relógio Technos Ts Carbon Masculino Cronógrafo - OS1AAS/1P', 10, 'Technos', 639.90, 63.99, 'Carbon');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1483, 'Relógio Technos Acqua Masculino Cronógrafo - OS10EV/8L', 10, 'Technos', 619.90, 61.99, 'Acqua');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1484, 'Relógio Technos Acqua Masculino Cronógrafo - OS10EP/8P', 10, 'Technos', 619.90, 61.99, 'Acqua');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1485, 'Relógio Technos Legacy Masculino Cronógrafo - JS15BA/3C', 10, 'Technos', 969.90, 96.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1486, 'Relógio Technos Legacy Masculino Cronógrafo - JS15AO/4X', 10, 'Technos', 759.90, 75.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1487, 'Relógio Technos Solar  Masculino Dourado - AS37AB/4B', 10, 'Technos', 969.90, 96.99, 'Solar');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1488, 'Relógio Technos Legacy Masculino Analógico - 2315ABL/4P', 10, 'Technos', 569.90, 56.99, 'Legacy');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1489, 'Relógio Technos Acqua Masculino Analógico - 2115KPA/1Y', 10, 'Technos', 529.90, 52.99, 'Acqua');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1490, 'Relógio Technos Executive Masculino Analógico - 2115KOW/4K', 10, 'Technos', 529.90, 52.99, 'Executive');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1491, 'Relógio Technos Racer Masculino Analógico - 2115KOU/1P', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1492, 'Relógio Technos Steel Masculino Analógico - 2115KNO/2P', 10, 'Technos', 259.90, 25.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1493, 'Relógio Technos Acqua Masculino Analógico - 2115KMB/1P', 10, 'Technos', 528.00, 52.80, 'Acqua');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1494, 'Relógio Technos Golf Masculino Analógico - 2105AU/4X', 10, 'Technos', 399.90, 39.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1495, 'Relógio Technos Steel Masculino Analógico - 2035LRU/5K', 10, 'Technos', 259.90, 25.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1496, 'Relógio Technos Steel Masculino Analógico - 2015BYYTD/4B', 10, 'Technos', 299.90, 29.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1497, 'Relógio Technos Ts Digiana Masculino Ana Digi  - 0527AB/4P', 10, 'Technos', 849.90, 84.99, 'Ts Digiana');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1498, 'Relógio Technos Ts Carbon Masculino Cronógrafo - OS1AAU/1A', 10, 'Technos', 559.90, 55.99, 'Carbon');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1499, 'Relógio Technos Skydiver Masculino Ana Digi  - T205FG/4P', 10, 'Technos', 809.90, 80.99, 'Skydiver');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1500, 'Relógio Technos Ts Carbon Masculino Cronógrafo - OS2AAK/1K', 10, 'Technos', 809.90, 80.99, 'Carbon');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1501, 'Relógio Technos Racer Masculino Multifunção - 6P29AHL/1P', 10, 'Technos', 469.90, 46.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1502, 'Relógio Technos Racer Masculino Multifunção - 6P29AHJ/1A', 10, 'Technos', 369.90, 36.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1503, 'Relógio Technos Golf Masculino Analógico - 2115TT/4P', 10, 'Technos', 489.90, 48.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1504, 'Relógio Technos Steel Masculino Analógico - 2015BZE/2B', 10, 'Technos', 309.90, 30.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1505, 'Relógio Technos Golf Masculino Analógico - 2305AF/4X', 10, 'Technos', 489.90, 48.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1506, 'Relógio Technos Golf Masculino Analógico - 2315YJ/4P', 10, 'Technos', 399.90, 39.99, 'Golf');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1507, 'Relógio Technos Steel Masculino Analógico - 2115TF/4X', 10, 'Technos', 299.90, 29.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1508, 'Relógio Technos Racer Masculino Analógico - 2035XH/1P', 10, 'Technos', 259.90, 25.99, 'Racer');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1509, 'Relógio Technos Steel Masculino Analógico - 2115GR/4X', 10, 'Technos', 299.90, 29.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1510, 'Relógio Technos Steel Masculino Analógico - 2035JE/1P', 10, 'Technos', 269.90, 26.99, 'Steel');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1511, 'Relógio Technos Riviera Masculino Analógico - 2115EF/4X', 10, 'Technos', 459.90, 45.99, 'Riviera');
INSERT INTO wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) VALUES (1512, 'Relógio Technos Executive Masculino Analógico - 1S13BB/5K', 10, 'Technos', 221.94, 22.19, 'Executive');


--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 199
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: wristwatch; Owner: postgres
--

SELECT pg_catalog.setval('wristwatch.user_id_seq', 1, false);


--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 201
-- Name: wristwatch_id_seq; Type: SEQUENCE SET; Schema: wristwatch; Owner: postgres
--

SELECT pg_catalog.setval('wristwatch.wristwatch_id_seq', 1512, true);


--
-- TOC entry 2816 (class 2606 OID 16408)
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (name);


--
-- TOC entry 2826 (class 2606 OID 16495)
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (name, brand_name);


--
-- TOC entry 2824 (class 2606 OID 16485)
-- Name: purchase purchase_pkey; Type: CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (salesman_name, brand_name);


--
-- TOC entry 2828 (class 2606 OID 16510)
-- Name: sale sale_pkey; Type: CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (id_wristwatch, salesman_name);


--
-- TOC entry 2818 (class 2606 OID 16410)
-- Name: salesman salesman_pkey; Type: CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.salesman
    ADD CONSTRAINT salesman_pkey PRIMARY KEY (name);


--
-- TOC entry 2820 (class 2606 OID 16412)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id, email);


--
-- TOC entry 2822 (class 2606 OID 16432)
-- Name: wristwatch wristwatch_pkey; Type: CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.wristwatch
    ADD CONSTRAINT wristwatch_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 16433)
-- Name: wristwatch fk_brand_name; Type: FK CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.wristwatch
    ADD CONSTRAINT fk_brand_name FOREIGN KEY (brand_name) REFERENCES wristwatch.brand(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2833 (class 2606 OID 16496)
-- Name: collection fk_collection_brand_name; Type: FK CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.collection
    ADD CONSTRAINT fk_collection_brand_name FOREIGN KEY (brand_name) REFERENCES wristwatch.brand(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2832 (class 2606 OID 16451)
-- Name: purchase fk_purchase_brand_name; Type: FK CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.purchase
    ADD CONSTRAINT fk_purchase_brand_name FOREIGN KEY (brand_name) REFERENCES wristwatch.brand(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2831 (class 2606 OID 16446)
-- Name: purchase fk_purchase_salesman_name; Type: FK CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.purchase
    ADD CONSTRAINT fk_purchase_salesman_name FOREIGN KEY (salesman_name) REFERENCES wristwatch.salesman(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2834 (class 2606 OID 16511)
-- Name: sale fk_sale_id_wristwatch; Type: FK CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.sale
    ADD CONSTRAINT fk_sale_id_wristwatch FOREIGN KEY (id_wristwatch) REFERENCES wristwatch.wristwatch(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2835 (class 2606 OID 16516)
-- Name: sale fk_sale_salesman_name; Type: FK CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.sale
    ADD CONSTRAINT fk_sale_salesman_name FOREIGN KEY (salesman_name) REFERENCES wristwatch.salesman(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2830 (class 2606 OID 16501)
-- Name: wristwatch fk_wristwatch_id_collection; Type: FK CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.wristwatch
    ADD CONSTRAINT fk_wristwatch_id_collection FOREIGN KEY (collection_name, brand_name) REFERENCES wristwatch.collection(name, brand_name);


-- Completed on 2019-01-12 17:20:04 -02

--
-- PostgreSQL database dump complete
--

