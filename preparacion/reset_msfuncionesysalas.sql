\c postgres
drop database msfuncionesysalas;
create database msfuncionesysalas;
\c msfuncionesysalas
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

--
-- Name: estado_disponibilidad_butaca_estado_butaca_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_disponibilidad_butaca_estado_butaca_enum AS ENUM (
    'DISPONIBLE',
    'OCUPADA',
    'RESERVADA',
    'FUERA_DE_SERVICIO'
);


ALTER TYPE public.estado_disponibilidad_butaca_estado_butaca_enum OWNER TO grupou;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: butaca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.butaca (
    id integer NOT NULL,
    nro_butaca integer NOT NULL,
    fila_id integer
);


ALTER TABLE public.butaca OWNER TO grupou;

--
-- Name: butaca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.butaca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.butaca_id_seq OWNER TO grupou;

--
-- Name: butaca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.butaca_id_seq OWNED BY public.butaca.id;


--
-- Name: disponibilidad_butaca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disponibilidad_butaca (
    id integer NOT NULL,
    funcion_id integer,
    butaca_id integer,
    estado_disponibilidad_butaca_id integer
);


ALTER TABLE public.disponibilidad_butaca OWNER TO grupou;

--
-- Name: disponibilidad_butaca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disponibilidad_butaca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.disponibilidad_butaca_id_seq OWNER TO grupou;

--
-- Name: disponibilidad_butaca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disponibilidad_butaca_id_seq OWNED BY public.disponibilidad_butaca.id;


--
-- Name: estado_disponibilidad_butaca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado_disponibilidad_butaca (
    id integer NOT NULL,
    estado_butaca public.estado_disponibilidad_butaca_estado_butaca_enum NOT NULL
);


ALTER TABLE public.estado_disponibilidad_butaca OWNER TO grupou;

--
-- Name: estado_disponibilidad_butaca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_disponibilidad_butaca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estado_disponibilidad_butaca_id_seq OWNER TO grupou;

--
-- Name: estado_disponibilidad_butaca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_disponibilidad_butaca_id_seq OWNED BY public.estado_disponibilidad_butaca.id;


--
-- Name: fila; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fila (
    id integer NOT NULL,
    letra_fila character(1) NOT NULL,
    sala_id integer
);


ALTER TABLE public.fila OWNER TO grupou;

--
-- Name: fila_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fila_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fila_id_seq OWNER TO grupou;

--
-- Name: fila_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fila_id_seq OWNED BY public.fila.id;


--
-- Name: formato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.formato (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    precio numeric(10,2) NOT NULL
);


ALTER TABLE public.formato OWNER TO grupou;

--
-- Name: formato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.formato_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.formato_id_seq OWNER TO grupou;

--
-- Name: formato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.formato_id_seq OWNED BY public.formato.id;


--
-- Name: funcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcion (
    id integer NOT NULL,
    esta_disponible boolean NOT NULL,
    fecha date NOT NULL,
    pelicula_id integer NOT NULL,
    usuario_id integer NOT NULL,
    "salaId" integer,
    "formatoId" integer,
    "idiomaId" integer,
    hora time without time zone DEFAULT '00:00:00'::time without time zone NOT NULL
);


ALTER TABLE public.funcion OWNER TO grupou;

--
-- Name: funcion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.funcion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.funcion_id_seq OWNER TO grupou;

--
-- Name: funcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.funcion_id_seq OWNED BY public.funcion.id;


--
-- Name: idioma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.idioma (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.idioma OWNER TO grupou;

--
-- Name: idioma_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.idioma_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.idioma_id_seq OWNER TO grupou;

--
-- Name: idioma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.idioma_id_seq OWNED BY public.idioma.id;


--
-- Name: sala; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sala (
    id integer NOT NULL,
    esta_disponible boolean NOT NULL,
    nro_sala integer NOT NULL
);


ALTER TABLE public.sala OWNER TO grupou;

--
-- Name: sala_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sala_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sala_id_seq OWNER TO grupou;

--
-- Name: sala_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sala_id_seq OWNED BY public.sala.id;


--
-- Name: butaca id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.butaca ALTER COLUMN id SET DEFAULT nextval('public.butaca_id_seq'::regclass);


--
-- Name: disponibilidad_butaca id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disponibilidad_butaca ALTER COLUMN id SET DEFAULT nextval('public.disponibilidad_butaca_id_seq'::regclass);


--
-- Name: estado_disponibilidad_butaca id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_disponibilidad_butaca ALTER COLUMN id SET DEFAULT nextval('public.estado_disponibilidad_butaca_id_seq'::regclass);


--
-- Name: fila id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fila ALTER COLUMN id SET DEFAULT nextval('public.fila_id_seq'::regclass);


--
-- Name: formato id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formato ALTER COLUMN id SET DEFAULT nextval('public.formato_id_seq'::regclass);


--
-- Name: funcion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcion ALTER COLUMN id SET DEFAULT nextval('public.funcion_id_seq'::regclass);


--
-- Name: idioma id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idioma ALTER COLUMN id SET DEFAULT nextval('public.idioma_id_seq'::regclass);


--
-- Name: sala id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sala ALTER COLUMN id SET DEFAULT nextval('public.sala_id_seq'::regclass);


--
-- Name: funcion PK_048102c1546244e94f6dab37f45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcion
    ADD CONSTRAINT "PK_048102c1546244e94f6dab37f45" PRIMARY KEY (id);


--
-- Name: estado_disponibilidad_butaca PK_30d9108d4bf1d1059439dbb9f4b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_disponibilidad_butaca
    ADD CONSTRAINT "PK_30d9108d4bf1d1059439dbb9f4b" PRIMARY KEY (id);


--
-- Name: sala PK_4e5fe0d3e30b64508d2a59daa40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sala
    ADD CONSTRAINT "PK_4e5fe0d3e30b64508d2a59daa40" PRIMARY KEY (id);


--
-- Name: formato PK_5249b356a6dc8ae4b2f337c5f7f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formato
    ADD CONSTRAINT "PK_5249b356a6dc8ae4b2f337c5f7f" PRIMARY KEY (id);


--
-- Name: disponibilidad_butaca PK_726e5e858174d96fe3bd09b1687; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disponibilidad_butaca
    ADD CONSTRAINT "PK_726e5e858174d96fe3bd09b1687" PRIMARY KEY (id);


--
-- Name: fila PK_81148ff4a41e49dcabb536df155; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fila
    ADD CONSTRAINT "PK_81148ff4a41e49dcabb536df155" PRIMARY KEY (id);


--
-- Name: idioma PK_b539601fc1c09986beb80165ad8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idioma
    ADD CONSTRAINT "PK_b539601fc1c09986beb80165ad8" PRIMARY KEY (id);


--
-- Name: butaca PK_e4504b7410500a9f9bbb07dbda9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.butaca
    ADD CONSTRAINT "PK_e4504b7410500a9f9bbb07dbda9" PRIMARY KEY (id);


--
-- Name: funcion FK_2c1de7372691e17863811703696; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcion
    ADD CONSTRAINT "FK_2c1de7372691e17863811703696" FOREIGN KEY ("idiomaId") REFERENCES public.idioma(id);


--
-- Name: fila FK_3260a4d6670b37dde8374918fb6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fila
    ADD CONSTRAINT "FK_3260a4d6670b37dde8374918fb6" FOREIGN KEY (sala_id) REFERENCES public.sala(id) ON DELETE CASCADE;


--
-- Name: funcion FK_52e934b313f47ec677c169220c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcion
    ADD CONSTRAINT "FK_52e934b313f47ec677c169220c7" FOREIGN KEY ("salaId") REFERENCES public.sala(id);


--
-- Name: disponibilidad_butaca FK_740d5c79a8f4cb2b5bc94693ae7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disponibilidad_butaca
    ADD CONSTRAINT "FK_740d5c79a8f4cb2b5bc94693ae7" FOREIGN KEY (estado_disponibilidad_butaca_id) REFERENCES public.estado_disponibilidad_butaca(id);


--
-- Name: disponibilidad_butaca FK_7cc4a667e2ab33bb9279bf307cd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disponibilidad_butaca
    ADD CONSTRAINT "FK_7cc4a667e2ab33bb9279bf307cd" FOREIGN KEY (butaca_id) REFERENCES public.butaca(id);


--
-- Name: funcion FK_9ba48841d3749eed400f1ff6b53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcion
    ADD CONSTRAINT "FK_9ba48841d3749eed400f1ff6b53" FOREIGN KEY ("formatoId") REFERENCES public.formato(id);


--
-- Name: butaca FK_9f5d949cdda62b05cc58782b194; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.butaca
    ADD CONSTRAINT "FK_9f5d949cdda62b05cc58782b194" FOREIGN KEY (fila_id) REFERENCES public.fila(id) ON DELETE CASCADE;


--
-- Name: disponibilidad_butaca FK_df7c9d491213c973c8c3e388c65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disponibilidad_butaca
    ADD CONSTRAINT "FK_df7c9d491213c973c8c3e388c65" FOREIGN KEY (funcion_id) REFERENCES public.funcion(id);


--
-- PostgreSQL database dump complete
--

insert into public.idioma (nombre) values ('ORIGINAL'), ('DOBLAJE CASTELLANO');

insert into
    public.estado_disponibilidad_butaca (estado_butaca)
values ('DISPONIBLE'),
    ('RESERVADA'),
    ('OCUPADA');

insert into
    public.formato (nombre, precio)
values ('2D', 6000),
    ('3D', 8000);

insert into
    public.sala (esta_disponible, nro_sala)
values (true, 1),
    (true, 2),
    (true, 3),
    (true, 4),
    (true, 5),
    (true, 6);

insert into
    public.fila (letra_fila, sala_id)
values ('A', 1),
    ('B', 1),
    ('C', 1),
    ('D', 1),
    ('E', 1),
    ('F', 1),
    ('G', 1),
    ('H', 1),
    ('I', 1),
    ('J', 1),
    ('A', 2),
    ('B', 2),
    ('C', 2),
    ('D', 2),
    ('E', 2),
    ('F', 2),
    ('G', 2),
    ('H', 2),
    ('I', 2),
    ('J', 2),
    ('K', 2),
    ('L', 2),
    ('M', 2),
    ('N', 2),
    ('O', 2),
    ('A', 3),
    ('B', 3),
    ('C', 3),
    ('D', 3),
    ('E', 3),
    ('F', 3),
    ('G', 3),
    ('H', 3),
    ('I', 3),
    ('J', 3),
    ('A', 4),
    ('B', 4),
    ('C', 4),
    ('D', 4),
    ('E', 4),
    ('F', 4),
    ('G', 4),
    ('H', 4),
    ('I', 4),
    ('J', 4),
    ('A', 5),
    ('B', 5),
    ('C', 5),
    ('D', 5),
    ('E', 5),
    ('F', 5),
    ('G', 5),
    ('H', 5),
    ('I', 5),
    ('J', 5),
    ('A', 6),
    ('B', 6),
    ('C', 6),
    ('D', 6),
    ('E', 6),
    ('F', 6),
    ('G', 6),
    ('H', 6),
    ('I', 6),
    ('J', 6),
    ('K', 6),
    ('L', 6),
    ('M', 6),
    ('N', 6),
    ('O', 6);

insert into
    public.butaca (nro_butaca, fila_id)
values ('01', 1),
    ('02', 1),
    ('03', 1),
    ('04', 1),
    ('05', 1),
    ('06', 1),
    ('07', 1),
    ('08', 1),
    ('09', 1),
    ('10', 1),
    ('11', 1),
    ('12', 1),
    ('13', 1),
    ('14', 1),
    ('15', 1),
    ('01', 2),
    ('02', 2),
    ('03', 2),
    ('04', 2),
    ('05', 2),
    ('06', 2),
    ('07', 2),
    ('08', 2),
    ('09', 2),
    ('10', 2),
    ('11', 2),
    ('12', 2),
    ('13', 2),
    ('14', 2),
    ('15', 2),
    ('01', 3),
    ('02', 3),
    ('03', 3),
    ('04', 3),
    ('05', 3),
    ('06', 3),
    ('07', 3),
    ('08', 3),
    ('09', 3),
    ('10', 3),
    ('11', 3),
    ('12', 3),
    ('13', 3),
    ('14', 3),
    ('15', 3),
    ('01', 4),
    ('02', 4),
    ('03', 4),
    ('04', 4),
    ('05', 4),
    ('06', 4),
    ('07', 4),
    ('08', 4),
    ('09', 4),
    ('10', 4),
    ('11', 4),
    ('12', 4),
    ('13', 4),
    ('14', 4),
    ('15', 4),
    ('01', 5),
    ('02', 5),
    ('03', 5),
    ('04', 5),
    ('05', 5),
    ('06', 5),
    ('07', 5),
    ('08', 5),
    ('09', 5),
    ('10', 5),
    ('11', 5),
    ('12', 5),
    ('13', 5),
    ('14', 5),
    ('15', 5),
    ('01', 6),
    ('02', 6),
    ('03', 6),
    ('04', 6),
    ('05', 6),
    ('06', 6),
    ('07', 6),
    ('08', 6),
    ('09', 6),
    ('10', 6),
    ('11', 6),
    ('12', 6),
    ('13', 6),
    ('14', 6),
    ('15', 6),
    ('01', 7),
    ('02', 7),
    ('03', 7),
    ('04', 7),
    ('05', 7),
    ('06', 7),
    ('07', 7),
    ('08', 7),
    ('09', 7),
    ('10', 7),
    ('11', 7),
    ('12', 7),
    ('13', 7),
    ('14', 7),
    ('15', 7),
    ('01', 8),
    ('02', 8),
    ('03', 8),
    ('04', 8),
    ('05', 8),
    ('06', 8),
    ('07', 8),
    ('08', 8),
    ('09', 8),
    ('10', 8),
    ('11', 8),
    ('12', 8),
    ('13', 8),
    ('14', 8),
    ('15', 8),
    ('01', 9),
    ('02', 9),
    ('03', 9),
    ('04', 9),
    ('05', 9),
    ('06', 9),
    ('07', 9),
    ('08', 9),
    ('09', 9),
    ('10', 9),
    ('11', 9),
    ('12', 9),
    ('13', 9),
    ('14', 9),
    ('15', 9),
    ('01', 10),
    ('02', 10),
    ('03', 10),
    ('04', 10),
    ('05', 10),
    ('06', 10),
    ('07', 10),
    ('08', 10),
    ('09', 10),
    ('10', 10),
    ('11', 10),
    ('12', 10),
    ('13', 10),
    ('14', 10),
    ('15', 10),
    ('01', 11),
    ('02', 11),
    ('03', 11),
    ('04', 11),
    ('05', 11),
    ('06', 11),
    ('07', 11),
    ('08', 11),
    ('09', 11),
    ('10', 11),
    ('11', 11),
    ('12', 11),
    ('13', 11),
    ('14', 11),
    ('15', 11),
    ('01', 12),
    ('02', 12),
    ('03', 12),
    ('04', 12),
    ('05', 12),
    ('06', 12),
    ('07', 12),
    ('08', 12),
    ('09', 12),
    ('10', 12),
    ('11', 12),
    ('12', 12),
    ('13', 12),
    ('14', 12),
    ('15', 12),
    ('01', 13),
    ('02', 13),
    ('03', 13),
    ('04', 13),
    ('05', 13),
    ('06', 13),
    ('07', 13),
    ('08', 13),
    ('09', 13),
    ('10', 13),
    ('11', 13),
    ('12', 13),
    ('13', 13),
    ('14', 13),
    ('15', 13),
    ('01', 14),
    ('02', 14),
    ('03', 14),
    ('04', 14),
    ('05', 14),
    ('06', 14),
    ('07', 14),
    ('08', 14),
    ('09', 14),
    ('10', 14),
    ('11', 14),
    ('12', 14),
    ('13', 14),
    ('14', 14),
    ('15', 14),
    ('01', 15),
    ('02', 15),
    ('03', 15),
    ('04', 15),
    ('05', 15),
    ('06', 15),
    ('07', 15),
    ('08', 15),
    ('09', 15),
    ('10', 15),
    ('11', 15),
    ('12', 15),
    ('13', 15),
    ('14', 15),
    ('15', 15),
    ('01', 16),
    ('02', 16),
    ('03', 16),
    ('04', 16),
    ('05', 16),
    ('06', 16),
    ('07', 16),
    ('08', 16),
    ('09', 16),
    ('10', 16),
    ('11', 16),
    ('12', 16),
    ('13', 16),
    ('14', 16),
    ('15', 16),
    ('01', 17),
    ('02', 17),
    ('03', 17),
    ('04', 17),
    ('05', 17),
    ('06', 17),
    ('07', 17),
    ('08', 17),
    ('09', 17),
    ('10', 17),
    ('11', 17),
    ('12', 17),
    ('13', 17),
    ('14', 17),
    ('15', 17),
    ('01', 18),
    ('02', 18),
    ('03', 18),
    ('04', 18),
    ('05', 18),
    ('06', 18),
    ('07', 18),
    ('08', 18),
    ('09', 18),
    ('10', 18),
    ('11', 18),
    ('12', 18),
    ('13', 18),
    ('14', 18),
    ('15', 18),
    ('01', 19),
    ('02', 19),
    ('03', 19),
    ('04', 19),
    ('05', 19),
    ('06', 19),
    ('07', 19),
    ('08', 19),
    ('09', 19),
    ('10', 19),
    ('11', 19),
    ('12', 19),
    ('13', 19),
    ('14', 19),
    ('15', 19),
    ('01', 20),
    ('02', 20),
    ('03', 20),
    ('04', 20),
    ('05', 20),
    ('06', 20),
    ('07', 20),
    ('08', 20),
    ('09', 20),
    ('10', 20),
    ('11', 20),
    ('12', 20),
    ('13', 20),
    ('14', 20),
    ('15', 20),
    ('01', 21),
    ('02', 21),
    ('03', 21),
    ('04', 21),
    ('05', 21),
    ('06', 21),
    ('07', 21),
    ('08', 21),
    ('09', 21),
    ('10', 21),
    ('11', 21),
    ('12', 21),
    ('13', 21),
    ('14', 21),
    ('15', 21),
    ('01', 22),
    ('02', 22),
    ('03', 22),
    ('04', 22),
    ('05', 22),
    ('06', 22),
    ('07', 22),
    ('08', 22),
    ('09', 22),
    ('10', 22),
    ('11', 22),
    ('12', 22),
    ('13', 22),
    ('14', 22),
    ('15', 22),
    ('01', 23),
    ('02', 23),
    ('03', 23),
    ('04', 23),
    ('05', 23),
    ('06', 23),
    ('07', 23),
    ('08', 23),
    ('09', 23),
    ('10', 23),
    ('11', 23),
    ('12', 23),
    ('13', 23),
    ('14', 23),
    ('15', 23),
    ('01', 24),
    ('02', 24),
    ('03', 24),
    ('04', 24),
    ('05', 24),
    ('06', 24),
    ('07', 24),
    ('08', 24),
    ('09', 24),
    ('10', 24),
    ('11', 24),
    ('12', 24),
    ('13', 24),
    ('14', 24),
    ('15', 24),
    ('01', 25),
    ('02', 25),
    ('03', 25),
    ('04', 25),
    ('05', 25),
    ('06', 25),
    ('07', 25),
    ('08', 25),
    ('09', 25),
    ('10', 25),
    ('11', 25),
    ('12', 25),
    ('13', 25),
    ('14', 25),
    ('15', 25),
    ('01', 26),
    ('02', 26),
    ('03', 26),
    ('04', 26),
    ('05', 26),
    ('06', 26),
    ('07', 26),
    ('08', 26),
    ('09', 26),
    ('10', 26),
    ('11', 26),
    ('12', 26),
    ('13', 26),
    ('14', 26),
    ('15', 26),
    ('01', 27),
    ('02', 27),
    ('03', 27),
    ('04', 27),
    ('05', 27),
    ('06', 27),
    ('07', 27),
    ('08', 27),
    ('09', 27),
    ('10', 27),
    ('11', 27),
    ('12', 27),
    ('13', 27),
    ('14', 27),
    ('15', 27),
    ('01', 28),
    ('02', 28),
    ('03', 28),
    ('04', 28),
    ('05', 28),
    ('06', 28),
    ('07', 28),
    ('08', 28),
    ('09', 28),
    ('10', 28),
    ('11', 28),
    ('12', 28),
    ('13', 28),
    ('14', 28),
    ('15', 28),
    ('01', 29),
    ('02', 29),
    ('03', 29),
    ('04', 29),
    ('05', 29),
    ('06', 29),
    ('07', 29),
    ('08', 29),
    ('09', 29),
    ('10', 29),
    ('11', 29),
    ('12', 29),
    ('13', 29),
    ('14', 29),
    ('15', 29),
    ('01', 30),
    ('02', 30),
    ('03', 30),
    ('04', 30),
    ('05', 30),
    ('06', 30),
    ('07', 30),
    ('08', 30),
    ('09', 30),
    ('10', 30),
    ('11', 30),
    ('12', 30),
    ('13', 30),
    ('14', 30),
    ('15', 30),
    ('01', 31),
    ('02', 31),
    ('03', 31),
    ('04', 31),
    ('05', 31),
    ('06', 31),
    ('07', 31),
    ('08', 31),
    ('09', 31),
    ('10', 31),
    ('11', 31),
    ('12', 31),
    ('13', 31),
    ('14', 31),
    ('15', 31),
    ('01', 32),
    ('02', 32),
    ('03', 32),
    ('04', 32),
    ('05', 32),
    ('06', 32),
    ('07', 32),
    ('08', 32),
    ('09', 32),
    ('10', 32),
    ('11', 32),
    ('12', 32),
    ('13', 32),
    ('14', 32),
    ('15', 32),
    ('01', 33),
    ('02', 33),
    ('03', 33),
    ('04', 33),
    ('05', 33),
    ('06', 33),
    ('07', 33),
    ('08', 33),
    ('09', 33),
    ('10', 33),
    ('11', 33),
    ('12', 33),
    ('13', 33),
    ('14', 33),
    ('15', 33),
    ('01', 34),
    ('02', 34),
    ('03', 34),
    ('04', 34),
    ('05', 34),
    ('06', 34),
    ('07', 34),
    ('08', 34),
    ('09', 34),
    ('10', 34),
    ('11', 34),
    ('12', 34),
    ('13', 34),
    ('14', 34),
    ('15', 34),
    ('01', 35),
    ('02', 35),
    ('03', 35),
    ('04', 35),
    ('05', 35),
    ('06', 35),
    ('07', 35),
    ('08', 35),
    ('09', 35),
    ('10', 35),
    ('11', 35),
    ('12', 35),
    ('13', 35),
    ('14', 35),
    ('15', 35),
    ('01', 36),
    ('02', 36),
    ('03', 36),
    ('04', 36),
    ('05', 36),
    ('06', 36),
    ('07', 36),
    ('08', 36),
    ('09', 36),
    ('10', 36),
    ('11', 36),
    ('12', 36),
    ('13', 36),
    ('14', 36),
    ('15', 36),
    ('01', 37),
    ('02', 37),
    ('03', 37),
    ('04', 37),
    ('05', 37),
    ('06', 37),
    ('07', 37),
    ('08', 37),
    ('09', 37),
    ('10', 37),
    ('11', 37),
    ('12', 37),
    ('13', 37),
    ('14', 37),
    ('15', 37),
    ('01', 38),
    ('02', 38),
    ('03', 38),
    ('04', 38),
    ('05', 38),
    ('06', 38),
    ('07', 38),
    ('08', 38),
    ('09', 38),
    ('10', 38),
    ('11', 38),
    ('12', 38),
    ('13', 38),
    ('14', 38),
    ('15', 38),
    ('01', 39),
    ('02', 39),
    ('03', 39),
    ('04', 39),
    ('05', 39),
    ('06', 39),
    ('07', 39),
    ('08', 39),
    ('09', 39),
    ('10', 39),
    ('11', 39),
    ('12', 39),
    ('13', 39),
    ('14', 39),
    ('15', 39),
    ('01', 40),
    ('02', 40),
    ('03', 40),
    ('04', 40),
    ('05', 40),
    ('06', 40),
    ('07', 40),
    ('08', 40),
    ('09', 40),
    ('10', 40),
    ('11', 40),
    ('12', 40),
    ('13', 40),
    ('14', 40),
    ('15', 40),
    ('01', 41),
    ('02', 41),
    ('03', 41),
    ('04', 41),
    ('05', 41),
    ('06', 41),
    ('07', 41),
    ('08', 41),
    ('09', 41),
    ('10', 41),
    ('11', 41),
    ('12', 41),
    ('13', 41),
    ('14', 41),
    ('15', 41),
    ('01', 42),
    ('02', 42),
    ('03', 42),
    ('04', 42),
    ('05', 42),
    ('06', 42),
    ('07', 42),
    ('08', 42),
    ('09', 42),
    ('10', 42),
    ('11', 42),
    ('12', 42),
    ('13', 42),
    ('14', 42),
    ('15', 42),
    ('01', 43),
    ('02', 43),
    ('03', 43),
    ('04', 43),
    ('05', 43),
    ('06', 43),
    ('07', 43),
    ('08', 43),
    ('09', 43),
    ('10', 43),
    ('11', 43),
    ('12', 43),
    ('13', 43),
    ('14', 43),
    ('15', 43),
    ('01', 44),
    ('02', 44),
    ('03', 44),
    ('04', 44),
    ('05', 44),
    ('06', 44),
    ('07', 44),
    ('08', 44),
    ('09', 44),
    ('10', 44),
    ('11', 44),
    ('12', 44),
    ('13', 44),
    ('14', 44),
    ('15', 44),
    ('01', 45),
    ('02', 45),
    ('03', 45),
    ('04', 45),
    ('05', 45),
    ('06', 45),
    ('07', 45),
    ('08', 45),
    ('09', 45),
    ('10', 45),
    ('11', 45),
    ('12', 45),
    ('13', 45),
    ('14', 45),
    ('15', 45),
    ('01', 46),
    ('02', 46),
    ('03', 46),
    ('04', 46),
    ('05', 46),
    ('06', 46),
    ('07', 46),
    ('08', 46),
    ('09', 46),
    ('10', 46),
    ('11', 46),
    ('12', 46),
    ('13', 46),
    ('14', 46),
    ('15', 46),
    ('01', 47),
    ('02', 47),
    ('03', 47),
    ('04', 47),
    ('05', 47),
    ('06', 47),
    ('07', 47),
    ('08', 47),
    ('09', 47),
    ('10', 47),
    ('11', 47),
    ('12', 47),
    ('13', 47),
    ('14', 47),
    ('15', 47),
    ('01', 48),
    ('02', 48),
    ('03', 48),
    ('04', 48),
    ('05', 48),
    ('06', 48),
    ('07', 48),
    ('08', 48),
    ('09', 48),
    ('10', 48),
    ('11', 48),
    ('12', 48),
    ('13', 48),
    ('14', 48),
    ('15', 48),
    ('01', 49),
    ('02', 49),
    ('03', 49),
    ('04', 49),
    ('05', 49),
    ('06', 49),
    ('07', 49),
    ('08', 49),
    ('09', 49),
    ('10', 49),
    ('11', 49),
    ('12', 49),
    ('13', 49),
    ('14', 49),
    ('15', 49),
    ('01', 50),
    ('02', 50),
    ('03', 50),
    ('04', 50),
    ('05', 50),
    ('06', 50),
    ('07', 50),
    ('08', 50),
    ('09', 50),
    ('10', 50),
    ('11', 50),
    ('12', 50),
    ('13', 50),
    ('14', 50),
    ('15', 50),
    ('01', 51),
    ('02', 51),
    ('03', 51),
    ('04', 51),
    ('05', 51),
    ('06', 51),
    ('07', 51),
    ('08', 51),
    ('09', 51),
    ('10', 51),
    ('11', 51),
    ('12', 51),
    ('13', 51),
    ('14', 51),
    ('15', 51),
    ('01', 52),
    ('02', 52),
    ('03', 52),
    ('04', 52),
    ('05', 52),
    ('06', 52),
    ('07', 52),
    ('08', 52),
    ('09', 52),
    ('10', 52),
    ('11', 52),
    ('12', 52),
    ('13', 52),
    ('14', 52),
    ('15', 52),
    ('01', 53),
    ('02', 53),
    ('03', 53),
    ('04', 53),
    ('05', 53),
    ('06', 53),
    ('07', 53),
    ('08', 53),
    ('09', 53),
    ('10', 53),
    ('11', 53),
    ('12', 53),
    ('13', 53),
    ('14', 53),
    ('15', 53),
    ('01', 54),
    ('02', 54),
    ('03', 54),
    ('04', 54),
    ('05', 54),
    ('06', 54),
    ('07', 54),
    ('08', 54),
    ('09', 54),
    ('10', 54),
    ('11', 54),
    ('12', 54),
    ('13', 54),
    ('14', 54),
    ('15', 54),
    ('01', 55),
    ('02', 55),
    ('03', 55),
    ('04', 55),
    ('05', 55),
    ('06', 55),
    ('07', 55),
    ('08', 55),
    ('09', 55),
    ('10', 55),
    ('11', 55),
    ('12', 55),
    ('13', 55),
    ('14', 55),
    ('15', 55),
    ('01', 56),
    ('02', 56),
    ('03', 56),
    ('04', 56),
    ('05', 56),
    ('06', 56),
    ('07', 56),
    ('08', 56),
    ('09', 56),
    ('10', 56),
    ('11', 56),
    ('12', 56),
    ('13', 56),
    ('14', 56),
    ('15', 56),
    ('01', 57),
    ('02', 57),
    ('03', 57),
    ('04', 57),
    ('05', 57),
    ('06', 57),
    ('07', 57),
    ('08', 57),
    ('09', 57),
    ('10', 57),
    ('11', 57),
    ('12', 57),
    ('13', 57),
    ('14', 57),
    ('15', 57),
    ('01', 58),
    ('02', 58),
    ('03', 58),
    ('04', 58),
    ('05', 58),
    ('06', 58),
    ('07', 58),
    ('08', 58),
    ('09', 58),
    ('10', 58),
    ('11', 58),
    ('12', 58),
    ('13', 58),
    ('14', 58),
    ('15', 58),
    ('01', 59),
    ('02', 59),
    ('03', 59),
    ('04', 59),
    ('05', 59),
    ('06', 59),
    ('07', 59),
    ('08', 59),
    ('09', 59),
    ('10', 59),
    ('11', 59),
    ('12', 59),
    ('13', 59),
    ('14', 59),
    ('15', 59),
    ('01', 60),
    ('02', 60),
    ('03', 60),
    ('04', 60),
    ('05', 60),
    ('06', 60),
    ('07', 60),
    ('08', 60),
    ('09', 60),
    ('10', 60),
    ('11', 60),
    ('12', 60),
    ('13', 60),
    ('14', 60),
    ('15', 60),
    ('01', 61),
    ('02', 61),
    ('03', 61),
    ('04', 61),
    ('05', 61),
    ('06', 61),
    ('07', 61),
    ('08', 61),
    ('09', 61),
    ('10', 61),
    ('11', 61),
    ('12', 61),
    ('13', 61),
    ('14', 61),
    ('15', 61),
    ('01', 62),
    ('02', 62),
    ('03', 62),
    ('04', 62),
    ('05', 62),
    ('06', 62),
    ('07', 62),
    ('08', 62),
    ('09', 62),
    ('10', 62),
    ('11', 62),
    ('12', 62),
    ('13', 62),
    ('14', 62),
    ('15', 62),
    ('01', 63),
    ('02', 63),
    ('03', 63),
    ('04', 63),
    ('05', 63),
    ('06', 63),
    ('07', 63),
    ('08', 63),
    ('09', 63),
    ('10', 63),
    ('11', 63),
    ('12', 63),
    ('13', 63),
    ('14', 63),
    ('15', 63),
    ('01', 64),
    ('02', 64),
    ('03', 64),
    ('04', 64),
    ('05', 64),
    ('06', 64),
    ('07', 64),
    ('08', 64),
    ('09', 64),
    ('10', 64),
    ('11', 64),
    ('12', 64),
    ('13', 64),
    ('14', 64),
    ('15', 64),
    ('01', 65),
    ('02', 65),
    ('03', 65),
    ('04', 65),
    ('05', 65),
    ('06', 65),
    ('07', 65),
    ('08', 65),
    ('09', 65),
    ('10', 65),
    ('11', 65),
    ('12', 65),
    ('13', 65),
    ('14', 65),
    ('15', 65),
    ('01', 66),
    ('02', 66),
    ('03', 66),
    ('04', 66),
    ('05', 66),
    ('06', 66),
    ('07', 66),
    ('08', 66),
    ('09', 66),
    ('10', 66),
    ('11', 66),
    ('12', 66),
    ('13', 66),
    ('14', 66),
    ('15', 66),
    ('01', 67),
    ('02', 67),
    ('03', 67),
    ('04', 67),
    ('05', 67),
    ('06', 67),
    ('07', 67),
    ('08', 67),
    ('09', 67),
    ('10', 67),
    ('11', 67),
    ('12', 67),
    ('13', 67),
    ('14', 67),
    ('15', 67),
    ('01', 68),
    ('02', 68),
    ('03', 68),
    ('04', 68),
    ('05', 68),
    ('06', 68),
    ('07', 68),
    ('08', 68),
    ('09', 68),
    ('10', 68),
    ('11', 68),
    ('12', 68),
    ('13', 68),
    ('14', 68),
    ('15', 68),
    ('01', 69),
    ('02', 69),
    ('03', 69),
    ('04', 69),
    ('05', 69),
    ('06', 69),
    ('07', 69),
    ('08', 69),
    ('09', 69),
    ('10', 69),
    ('11', 69),
    ('12', 69),
    ('13', 69),
    ('14', 69),
    ('15', 69),
    ('01', 70),
    ('02', 70),
    ('03', 70),
    ('04', 70),
    ('05', 70),
    ('06', 70),
    ('07', 70),
    ('08', 70),
    ('09', 70),
    ('10', 70),
    ('11', 70),
    ('12', 70),
    ('13', 70),
    ('14', 70),
    ('15', 70);

INSERT INTO
    public.funcion (
        esta_disponible,
        fecha,
        hora,
        pelicula_id,
        usuario_id,
        "salaId",
        "formatoId",
        "idiomaId"
    )
VALUES (
        true,
        '2025-12-31',
        '20:00',
        2,
        1,
        4,
        1,
        1
    ),
    (
        true,
        '2026-01-01',
        '16:00',
        2,
        1,
        4,
        2,
        2
    ),
    (
        false,
        '2026-01-02',
        '18:30',
        2,
        1,
        4,
        1,
        2
    );

INSERT INTO
    public.disponibilidad_butaca (
        funcion_id,
        butaca_id,
        estado_disponibilidad_butaca_id
    )
VALUES (1, 526, 1),
    (1, 527, 2),
    (1, 528, 3),
    (1, 529, 1),
    (1, 530, 2),
    (1, 531, 3),
    (1, 532, 1),
    (1, 533, 2),
    (1, 534, 3),
    (1, 535, 1),
    (1, 536, 2),
    (1, 537, 3),
    (1, 538, 1),
    (1, 539, 2),
    (1, 540, 3),
    (1, 541, 1),
    (1, 542, 2),
    (1, 543, 3),
    (1, 544, 1),
    (1, 545, 2),
    (1, 546, 3),
    (1, 547, 1),
    (1, 548, 2),
    (1, 549, 3),
    (1, 550, 1),
    (1, 551, 2),
    (1, 552, 3),
    (1, 553, 1),
    (1, 554, 2),
    (1, 555, 3),
    (1, 556, 1),
    (1, 557, 2),
    (1, 558, 3),
    (1, 559, 1),
    (1, 560, 2),
    (1, 561, 3),
    (1, 562, 1),
    (1, 563, 2),
    (1, 564, 3),
    (1, 565, 1),
    (1, 566, 2),
    (1, 567, 3),
    (1, 568, 1),
    (1, 569, 2),
    (1, 570, 3),
    (1, 571, 1),
    (1, 572, 2),
    (1, 573, 3),
    (1, 574, 1),
    (1, 575, 2),
    (1, 576, 3),
    (1, 577, 1),
    (1, 578, 2),
    (1, 579, 3),
    (1, 580, 1),
    (1, 581, 2),
    (1, 582, 3),
    (1, 583, 1),
    (1, 584, 2),
    (1, 585, 3),
    (1, 586, 1),
    (1, 587, 2),
    (1, 588, 3),
    (1, 589, 1),
    (1, 590, 2),
    (1, 591, 3),
    (1, 592, 1),
    (1, 593, 2),
    (1, 594, 3),
    (1, 595, 1),
    (1, 596, 2),
    (1, 597, 3),
    (1, 598, 1),
    (1, 599, 2),
    (1, 600, 3),
    (1, 601, 1),
    (1, 602, 2),
    (1, 603, 3),
    (1, 604, 1),
    (1, 605, 2),
    (1, 606, 3),
    (1, 607, 1),
    (1, 608, 2),
    (1, 609, 3),
    (1, 610, 1),
    (1, 611, 2),
    (1, 612, 3),
    (1, 613, 1),
    (1, 614, 2),
    (1, 615, 3),
    (1, 616, 1),
    (1, 617, 2),
    (1, 618, 3),
    (1, 619, 1),
    (1, 620, 2),
    (1, 621, 3),
    (1, 622, 1),
    (1, 623, 2),
    (1, 624, 3),
    (1, 625, 1),
    (1, 626, 2),
    (1, 627, 3),
    (1, 628, 1),
    (1, 629, 2),
    (1, 630, 3),
    (1, 631, 1),
    (1, 632, 2),
    (1, 633, 3),
    (1, 634, 1),
    (1, 635, 2),
    (1, 636, 3),
    (1, 637, 1),
    (1, 638, 2),
    (1, 639, 3),
    (1, 640, 1),
    (1, 641, 2),
    (1, 642, 3),
    (1, 643, 1),
    (1, 644, 2),
    (1, 645, 3),
    (1, 646, 1),
    (1, 647, 2),
    (1, 648, 3),
    (1, 649, 1),
    (1, 650, 2),
    (1, 651, 3),
    (1, 652, 1),
    (1, 653, 2),
    (1, 654, 3),
    (1, 655, 1),
    (1, 656, 2),
    (1, 657, 3),
    (1, 658, 1),
    (1, 659, 2),
    (1, 660, 3),
    (1, 661, 1),
    (1, 662, 2),
    (1, 663, 3),
    (1, 664, 1),
    (1, 665, 2),
    (1, 666, 3),
    (1, 667, 1),
    (1, 668, 2),
    (1, 669, 3),
    (1, 670, 1),
    (1, 671, 2),
    (1, 672, 3),
    (1, 673, 1),
    (1, 674, 2),
    (1, 675, 3),
    (2, 526, 1),
    (2, 527, 2),
    (2, 528, 2),
    (2, 529, 1),
    (2, 530, 2),
    (2, 531, 3),
    (2, 532, 1),
    (2, 533, 2),
    (2, 534, 3),
    (2, 535, 1),
    (2, 536, 1),
    (2, 537, 3),
    (2, 538, 1),
    (2, 539, 2),
    (2, 540, 2),
    (2, 541, 1),
    (2, 542, 2),
    (2, 543, 3),
    (2, 544, 1),
    (2, 545, 2),
    (2, 546, 3),
    (2, 547, 1),
    (2, 548, 2),
    (2, 549, 3),
    (2, 550, 3),
    (2, 551, 2),
    (2, 552, 3),
    (2, 553, 1),
    (2, 554, 2),
    (2, 555, 3),
    (2, 556, 2),
    (2, 557, 2),
    (2, 558, 3),
    (2, 559, 1),
    (2, 560, 2),
    (2, 561, 3),
    (2, 562, 2),
    (2, 563, 2),
    (2, 564, 3),
    (2, 565, 1),
    (2, 566, 2),
    (2, 567, 1),
    (2, 568, 1),
    (2, 569, 2),
    (2, 570, 3),
    (2, 571, 1),
    (2, 572, 3),
    (2, 573, 3),
    (2, 574, 1),
    (2, 575, 2),
    (2, 576, 3),
    (2, 577, 1),
    (2, 578, 2),
    (2, 579, 2),
    (2, 580, 1),
    (2, 581, 2),
    (2, 582, 3),
    (2, 583, 1),
    (2, 584, 2),
    (2, 585, 3),
    (2, 586, 1),
    (2, 587, 2),
    (2, 588, 3),
    (2, 589, 1),
    (2, 590, 1),
    (2, 591, 3),
    (2, 592, 1),
    (2, 593, 2),
    (2, 594, 3),
    (2, 595, 1),
    (2, 596, 2),
    (2, 597, 3),
    (2, 598, 1),
    (2, 599, 2),
    (2, 600, 3),
    (2, 601, 2),
    (2, 602, 2),
    (2, 603, 3),
    (2, 604, 1),
    (2, 605, 2),
    (2, 606, 3),
    (2, 607, 1),
    (2, 608, 2),
    (2, 609, 2),
    (2, 610, 1),
    (2, 611, 2),
    (2, 612, 3),
    (2, 613, 1),
    (2, 614, 2),
    (2, 615, 3),
    (2, 616, 1),
    (2, 617, 2),
    (2, 618, 3),
    (2, 619, 3),
    (2, 620, 2),
    (2, 621, 3),
    (2, 622, 1),
    (2, 623, 2),
    (2, 624, 3),
    (2, 625, 1),
    (2, 626, 2),
    (2, 627, 3),
    (2, 628, 1),
    (2, 629, 2),
    (2, 630, 3),
    (2, 631, 3),
    (2, 632, 2),
    (2, 633, 3),
    (2, 634, 1),
    (2, 635, 2),
    (2, 636, 3),
    (2, 637, 1),
    (2, 638, 2),
    (2, 639, 3),
    (2, 640, 1),
    (2, 641, 1),
    (2, 642, 3),
    (2, 643, 1),
    (2, 644, 2),
    (2, 645, 3),
    (2, 646, 1),
    (2, 647, 2),
    (2, 648, 3),
    (2, 649, 1),
    (2, 650, 1),
    (2, 651, 1),
    (2, 652, 1),
    (2, 653, 2),
    (2, 654, 3),
    (2, 655, 1),
    (2, 656, 2),
    (2, 657, 3),
    (2, 658, 1),
    (2, 659, 2),
    (2, 660, 3),
    (2, 661, 1),
    (2, 662, 2),
    (2, 663, 3),
    (2, 664, 1),
    (2, 665, 2),
    (2, 666, 1),
    (2, 667, 1),
    (2, 668, 2),
    (2, 669, 3),
    (2, 670, 1),
    (2, 671, 2),
    (2, 672, 3),
    (2, 673, 1),
    (2, 674, 2),
    (2, 675, 1),
    (3, 526, 1),
    (3, 527, 2),
    (3, 528, 3),
    (3, 529, 1),
    (3, 530, 2),
    (3, 531, 3),
    (3, 532, 1),
    (3, 533, 2),
    (3, 534, 3),
    (3, 535, 1),
    (3, 536, 2),
    (3, 537, 3),
    (3, 538, 1),
    (3, 539, 2),
    (3, 540, 3),
    (3, 541, 1),
    (3, 542, 2),
    (3, 543, 3),
    (3, 544, 1),
    (3, 545, 2),
    (3, 546, 3),
    (3, 547, 1),
    (3, 548, 2),
    (3, 549, 3),
    (3, 550, 1),
    (3, 551, 2),
    (3, 552, 3),
    (3, 553, 1),
    (3, 554, 2),
    (3, 555, 3),
    (3, 556, 1),
    (3, 557, 2),
    (3, 558, 3),
    (3, 559, 1),
    (3, 560, 2),
    (3, 561, 3),
    (3, 562, 1),
    (3, 563, 2),
    (3, 564, 3),
    (3, 565, 1),
    (3, 566, 2),
    (3, 567, 3),
    (3, 568, 1),
    (3, 569, 2),
    (3, 570, 3),
    (3, 571, 1),
    (3, 572, 2),
    (3, 573, 3),
    (3, 574, 1),
    (3, 575, 2),
    (3, 576, 3),
    (3, 577, 1),
    (3, 578, 2),
    (3, 579, 3),
    (3, 580, 1),
    (3, 581, 2),
    (3, 582, 3),
    (3, 583, 1),
    (3, 584, 2),
    (3, 585, 3),
    (3, 586, 1),
    (3, 587, 2),
    (3, 588, 3),
    (3, 589, 1),
    (3, 590, 2),
    (3, 591, 3),
    (3, 592, 1),
    (3, 593, 2),
    (3, 594, 3),
    (3, 595, 1),
    (3, 596, 2),
    (3, 597, 3),
    (3, 598, 1),
    (3, 599, 2),
    (3, 600, 3),
    (3, 601, 1),
    (3, 602, 2),
    (3, 603, 3),
    (3, 604, 1),
    (3, 605, 2),
    (3, 606, 3),
    (3, 607, 1),
    (3, 608, 2),
    (3, 609, 3),
    (3, 610, 1),
    (3, 611, 2),
    (3, 612, 3),
    (3, 613, 1),
    (3, 614, 2),
    (3, 615, 3),
    (3, 616, 1),
    (3, 617, 2),
    (3, 618, 3),
    (3, 619, 1),
    (3, 620, 2),
    (3, 621, 3),
    (3, 622, 1),
    (3, 623, 2),
    (3, 624, 3),
    (3, 625, 1),
    (3, 626, 2),
    (3, 627, 3),
    (3, 628, 1),
    (3, 629, 2),
    (3, 630, 3),
    (3, 631, 1),
    (3, 632, 2),
    (3, 633, 3),
    (3, 634, 1),
    (3, 635, 2),
    (3, 636, 3),
    (3, 637, 1),
    (3, 638, 2),
    (3, 639, 3),
    (3, 640, 1),
    (3, 641, 2),
    (3, 642, 3),
    (3, 643, 1),
    (3, 644, 2),
    (3, 645, 3),
    (3, 646, 1),
    (3, 647, 2),
    (3, 648, 3),
    (3, 649, 1),
    (3, 650, 2),
    (3, 651, 3),
    (3, 652, 1),
    (3, 653, 2),
    (3, 654, 3),
    (3, 655, 1),
    (3, 656, 2),
    (3, 657, 3),
    (3, 658, 1),
    (3, 659, 2),
    (3, 660, 3),
    (3, 661, 1),
    (3, 662, 2),
    (3, 663, 3),
    (3, 664, 1),
    (3, 665, 2),
    (3, 666, 3),
    (3, 667, 1),
    (3, 668, 2),
    (3, 669, 3),
    (3, 670, 1),
    (3, 671, 2),
    (3, 672, 3),
    (3, 673, 1),
    (3, 674, 2),
    (3, 675, 3);