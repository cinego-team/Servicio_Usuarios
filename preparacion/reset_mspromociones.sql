\c postgres
drop database mspromociones;
create database mspromociones;
\c mspromociones
--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.5 (Debian 17.5-1.pgdg120+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dias (
    id integer NOT NULL,
    nombre character varying(10) NOT NULL
);


ALTER TABLE public.dias OWNER TO grupou;

--
-- Name: dias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dias_id_seq OWNER TO grupou;

--
-- Name: dias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dias_id_seq OWNED BY public.dias.id;


--
-- Name: promocion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promocion (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    porcentaje_descuento integer NOT NULL,
    tipo_cliente_id integer NOT NULL,
    dia_id integer NOT NULL
);


ALTER TABLE public.promocion OWNER TO grupou;

--
-- Name: promocion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promocion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promocion_id_seq OWNER TO grupou;

--
-- Name: promocion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promocion_id_seq OWNED BY public.promocion.id;


--
-- Name: dias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dias ALTER COLUMN id SET DEFAULT nextval('public.dias_id_seq'::regclass);


--
-- Name: promocion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promocion ALTER COLUMN id SET DEFAULT nextval('public.promocion_id_seq'::regclass);


--
-- Name: dias PK_c3ec07a9d7a384961b1446b72f6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dias
    ADD CONSTRAINT "PK_c3ec07a9d7a384961b1446b72f6" PRIMARY KEY (id);


--
-- Name: promocion PK_cc82201f126d1e004467fc54bfc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promocion
    ADD CONSTRAINT "PK_cc82201f126d1e004467fc54bfc" PRIMARY KEY (id);


--
-- Name: promocion FK_092e0ec58d7117917365bd789b0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promocion
    ADD CONSTRAINT "FK_092e0ec58d7117917365bd789b0" FOREIGN KEY (dia_id) REFERENCES public.dias(id);


--
-- PostgreSQL database dump complete
--

insert into public.dias (nombre) values ('LUNES'),
    ('MARTES'),
    ('MIERCOLES'),
    ('JUEVES'),
    ('VIERNES'),
    ('SABADO'),
    ('DOMINGO');

insert into
    public.promocion (
        nombre,
        porcentaje_descuento,
        tipo_cliente_id,
        dia_id
    )
values (' 2 X 1', 50, 1, 3),
    (
        'DESCUENTO JUBILADOS',
        70,
        2,
        7
    ),
    (
        'JUEVES UNIVERSITARIO',
        40,
        3,
        4
    );