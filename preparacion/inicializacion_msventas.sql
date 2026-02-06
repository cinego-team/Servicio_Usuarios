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
-- Name: entrada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrada (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    es_usado boolean NOT NULL,
    expiracion timestamp without time zone NOT NULL,
    disponibilidad_butaca_id integer NOT NULL,
    venta_id integer NOT NULL
);


ALTER TABLE public.entrada OWNER TO grupou;

--
-- Name: entrada_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entrada_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entrada_id_seq OWNER TO grupou;

--
-- Name: entrada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entrada_id_seq OWNED BY public.entrada.id;


--
-- Name: estado_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado_venta (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.estado_venta OWNER TO grupou;

--
-- Name: estado_venta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_venta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estado_venta_id_seq OWNER TO grupou;

--
-- Name: estado_venta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_venta_id_seq OWNED BY public.estado_venta.id;


--
-- Name: venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venta (
    id integer NOT NULL,
    fecha timestamp without time zone NOT NULL,
    total numeric(10,2) NOT NULL,
    promocion_id integer,
    cliente_id integer NOT NULL,
    fecha_funcion date NOT NULL,
    hora_funcion time without time zone NOT NULL,
    estado_venta_id integer
);


ALTER TABLE public.venta OWNER TO grupou;

--
-- Name: venta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.venta_id_seq OWNER TO grupou;

--
-- Name: venta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venta_id_seq OWNED BY public.venta.id;


--
-- Name: entrada id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrada ALTER COLUMN id SET DEFAULT nextval('public.entrada_id_seq'::regclass);


--
-- Name: estado_venta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_venta ALTER COLUMN id SET DEFAULT nextval('public.estado_venta_id_seq'::regclass);


--
-- Name: venta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta ALTER COLUMN id SET DEFAULT nextval('public.venta_id_seq'::regclass);


--
-- Name: estado_venta PK_7e4322837c5653604499274e3b6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_venta
    ADD CONSTRAINT "PK_7e4322837c5653604499274e3b6" PRIMARY KEY (id);


--
-- Name: venta PK_8bb53d01fe72521d5cfb1f149d4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT "PK_8bb53d01fe72521d5cfb1f149d4" PRIMARY KEY (id);


--
-- Name: entrada PK_e7a5c037c8d52f966bc70325e5b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT "PK_e7a5c037c8d52f966bc70325e5b" PRIMARY KEY (id);


--
-- Name: entrada FK_79fd0c7f64aa5cbf4b88d8d9c81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT "FK_79fd0c7f64aa5cbf4b88d8d9c81" FOREIGN KEY (venta_id) REFERENCES public.venta(id);


--
-- Name: venta FK_8e5bd8b7fc21bdda7be9977946a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT "FK_8e5bd8b7fc21bdda7be9977946a" FOREIGN KEY (estado_venta_id) REFERENCES public.estado_venta(id);


--
-- PostgreSQL database dump complete
--

insert into
    public.estado_venta (nombre)
values ('APROBADA'),
    ('RECHAZADA'),
    ('PENDIENTE DE PAGO');

INSERT INTO
    public.venta (
        fecha,
        total,
        cliente_id,
        fecha_funcion,
        hora_funcion,
        estado_venta_id
    )
VALUES (
        '2026-01-05 10:00:00',
        6000.00,
        3,
        '2026-01-05',
        '14:00:00',
        1
    ),
    (
        '2026-01-05 11:00:00',
        6000.00,
        4,
        '2026-01-05',
        '14:30:00',
        1
    ),
    (
        '2026-01-06 10:00:00',
        6000.00,
        5,
        '2026-01-06',
        '19:00:00',
        1
    ),
    (
        '2026-01-06 11:00:00',
        6000.00,
        3,
        '2026-01-06',
        '19:30:00',
        1
    ),
    (
        '2026-01-07 10:00:00',
        6000.00,
        4,
        '2026-01-07',
        '20:00:00',
        1
    ),
    (
        '2026-01-08 10:00:00',
        6000.00,
        5,
        '2026-01-08',
        '20:30:00',
        1
    ),
    (
        '2026-01-09 10:00:00',
        6000.00,
        3,
        '2026-01-09',
        '21:00:00',
        1
    ),
    (
        '2026-01-10 10:00:00',
        6000.00,
        4,
        '2026-01-10',
        '22:00:00',
        1
    ),
    (
        '2026-01-11 10:00:00',
        6000.00,
        5,
        '2026-01-11',
        '22:30:00',
        1
    ),
    (
        '2026-01-12 10:00:00',
        6000.00,
        3,
        '2026-01-12',
        '15:00:00',
        1
    ),
    (
        '2026-01-13 10:00:00',
        6000.00,
        4,
        '2026-01-13',
        '16:30:00',
        1
    ),
    (
        '2026-01-14 10:00:00',
        6000.00,
        5,
        '2026-01-14',
        '19:00:00',
        1
    ),
    (
        '2026-01-15 10:00:00',
        6000.00,
        3,
        '2026-01-15',
        '19:30:00',
        1
    ),
    (
        '2026-01-16 10:00:00',
        6000.00,
        4,
        '2026-01-16',
        '20:00:00',
        1
    );

-- FEBRERO 2026
INSERT INTO
    public.venta (
        fecha,
        total,
        cliente_id,
        fecha_funcion,
        hora_funcion,
        estado_venta_id
    )
VALUES (
        '2026-02-02 10:00:00',
        6000.00,
        3,
        '2026-02-02',
        '14:00:00',
        1
    ),
    (
        '2026-02-03 10:00:00',
        6000.00,
        4,
        '2026-02-03',
        '17:30:00',
        1
    ),
    (
        '2026-02-05 10:00:00',
        6000.00,
        5,
        '2026-02-05',
        '19:00:00',
        1
    ),
    (
        '2026-02-07 10:00:00',
        6000.00,
        3,
        '2026-02-07',
        '20:30:00',
        1
    ),
    (
        '2026-02-10 10:00:00',
        6000.00,
        4,
        '2026-02-10',
        '21:00:00',
        1
    ),
    (
        '2026-02-14 10:00:00',
        6000.00,
        5,
        '2026-02-14',
        '19:30:00',
        1
    ),
    (
        '2026-02-15 10:00:00',
        6000.00,
        3,
        '2026-02-15',
        '22:00:00',
        1
    ),
    (
        '2026-02-20 10:00:00',
        6000.00,
        4,
        '2026-02-20',
        '18:00:00',
        1
    );

-- MARZO 2026
INSERT INTO
    public.venta (
        fecha,
        total,
        cliente_id,
        fecha_funcion,
        hora_funcion,
        estado_venta_id
    )
VALUES (
        '2026-03-01 10:00:00',
        6000.00,
        3,
        '2026-03-01',
        '15:00:00',
        1
    ),
    (
        '2026-03-05 10:00:00',
        6000.00,
        4,
        '2026-03-05',
        '19:00:00',
        1
    ),
    (
        '2026-03-08 10:00:00',
        6000.00,
        5,
        '2026-03-08',
        '19:30:00',
        1
    ),
    (
        '2026-03-10 10:00:00',
        6000.00,
        3,
        '2026-03-10',
        '20:00:00',
        1
    ),
    (
        '2026-03-12 10:00:00',
        6000.00,
        4,
        '2026-03-12',
        '21:30:00',
        1
    ),
    (
        '2026-03-15 10:00:00',
        6000.00,
        5,
        '2026-03-15',
        '22:00:00',
        1
    ),
    (
        '2026-03-20 10:00:00',
        6000.00,
        3,
        '2026-03-20',
        '17:00:00',
        1
    ),
    (
        '2026-03-25 10:00:00',
        6000.00,
        4,
        '2026-03-25',
        '18:30:00',
        1
    );

-- ABRIL 2026 (2do trimestre)
INSERT INTO
    public.venta (
        fecha,
        total,
        cliente_id,
        fecha_funcion,
        hora_funcion,
        estado_venta_id
    )
VALUES (
        '2026-04-01 10:00:00',
        6000.00,
        3,
        '2026-04-01',
        '14:30:00',
        1
    ),
    (
        '2026-04-05 10:00:00',
        6000.00,
        4,
        '2026-04-05',
        '19:00:00',
        1
    ),
    (
        '2026-04-10 10:00:00',
        6000.00,
        5,
        '2026-04-10',
        '20:00:00',
        1
    ),
    (
        '2026-04-15 10:00:00',
        6000.00,
        3,
        '2026-04-15',
        '21:00:00',
        1
    ),
    (
        '2026-04-20 10:00:00',
        6000.00,
        4,
        '2026-04-20',
        '19:30:00',
        1
    ),
    (
        '2026-04-25 10:00:00',
        6000.00,
        5,
        '2026-04-25',
        '22:30:00',
        1
    );

-- MAYO 2026
INSERT INTO
    public.venta (
        fecha,
        total,
        cliente_id,
        fecha_funcion,
        hora_funcion,
        estado_venta_id
    )
VALUES (
        '2026-05-01 10:00:00',
        6000.00,
        3,
        '2026-05-01',
        '15:00:00',
        1
    ),
    (
        '2026-05-05 10:00:00',
        6000.00,
        4,
        '2026-05-05',
        '18:00:00',
        1
    ),
    (
        '2026-05-10 10:00:00',
        6000.00,
        5,
        '2026-05-10',
        '19:00:00',
        1
    ),
    (
        '2026-05-15 10:00:00',
        6000.00,
        3,
        '2026-05-15',
        '20:30:00',
        1
    ),
    (
        '2026-05-20 10:00:00',
        6000.00,
        4,
        '2026-05-20',
        '21:00:00',
        1
    ),
    (
        '2026-05-25 10:00:00',
        6000.00,
        5,
        '2026-05-25',
        '22:00:00',
        1
    );

-- JUNIO 2026
INSERT INTO
    public.venta (
        fecha,
        total,
        cliente_id,
        fecha_funcion,
        hora_funcion,
        estado_venta_id
    )
VALUES (
        '2026-06-01 10:00:00',
        6000.00,
        3,
        '2026-06-01',
        '14:00:00',
        1
    ),
    (
        '2026-06-05 10:00:00',
        6000.00,
        4,
        '2026-06-05',
        '17:30:00',
        1
    ),
    (
        '2026-06-10 10:00:00',
        6000.00,
        5,
        '2026-06-10',
        '19:30:00',
        1
    ),
    (
        '2026-06-15 10:00:00',
        6000.00,
        3,
        '2026-06-15',
        '20:00:00',
        1
    ),
    (
        '2026-06-20 10:00:00',
        6000.00,
        4,
        '2026-06-20',
        '21:30:00',
        1
    );

-- JULIO 2026 (3er trimestre)
INSERT INTO
    public.venta (
        fecha,
        total,
        cliente_id,
        fecha_funcion,
        hora_funcion,
        estado_venta_id
    )
VALUES (
        '2026-07-01 10:00:00',
        6000.00,
        3,
        '2026-07-01',
        '15:30:00',
        1
    ),
    (
        '2026-07-05 10:00:00',
        6000.00,
        4,
        '2026-07-05',
        '19:00:00',
        1
    ),
    (
        '2026-07-10 10:00:00',
        6000.00,
        5,
        '2026-07-10',
        '20:00:00',
        1
    ),
    (
        '2026-07-15 10:00:00',
        6000.00,
        3,
        '2026-07-15',
        '21:00:00',
        1
    ),
    (
        '2026-07-20 10:00:00',
        6000.00,
        4,
        '2026-07-20',
        '22:00:00',
        1
    );

-- AGOSTO 2026
INSERT INTO
    public.venta (
        fecha,
        total,
        cliente_id,
        fecha_funcion,
        hora_funcion,
        estado_venta_id
    )
VALUES (
        '2026-08-01 10:00:00',
        6000.00,
        3,
        '2026-08-01',
        '14:00:00',
        1
    ),
    (
        '2026-08-05 10:00:00',
        6000.00,
        4,
        '2026-08-05',
        '18:30:00',
        1
    ),
    (
        '2026-08-10 10:00:00',
        6000.00,
        5,
        '2026-08-10',
        '19:30:00',
        1
    ),
    (
        '2026-08-15 10:00:00',
        6000.00,
        3,
        '2026-08-15',
        '20:30:00',
        1
    ),
    (
        '2026-08-20 10:00:00',
        6000.00,
        4,
        '2026-08-20',
        '21:30:00',
        1
    );

-- SEPTIEMBRE 2026
INSERT INTO
    public.venta (
        fecha,
        total,
        cliente_id,
        fecha_funcion,
        hora_funcion,
        estado_venta_id
    )
VALUES (
        '2026-09-01 10:00:00',
        6000.00,
        3,
        '2026-09-01',
        '15:00:00',
        1
    ),
    (
        '2026-09-05 10:00:00',
        6000.00,
        4,
        '2026-09-05',
        '17:00:00',
        1
    ),
    (
        '2026-09-10 10:00:00',
        6000.00,
        5,
        '2026-09-10',
        '19:00:00',
        1
    ),
    (
        '2026-09-15 10:00:00',
        6000.00,
        3,
        '2026-09-15',
        '20:00:00',
        1
    ),
    (
        '2026-09-20 10:00:00',
        6000.00,
        4,
        '2026-09-20',
        '22:00:00',
        1
    );

-- OCTUBRE 2026 (4to trimestre)
INSERT INTO
    public.venta (
        fecha,
        total,
        cliente_id,
        fecha_funcion,
        hora_funcion,
        estado_venta_id
    )
VALUES (
        '2026-10-01 10:00:00',
        6000.00,
        3,
        '2026-10-01',
        '14:30:00',
        1
    ),
    (
        '2026-10-05 10:00:00',
        6000.00,
        4,
        '2026-10-05',
        '18:00:00',
        1
    ),
    (
        '2026-10-10 10:00:00',
        6000.00,
        5,
        '2026-10-10',
        '19:30:00',
        1
    ),
    (
        '2026-10-15 10:00:00',
        6000.00,
        3,
        '2026-10-15',
        '20:30:00',
        1
    ),
    (
        '2026-10-20 10:00:00',
        6000.00,
        4,
        '2026-10-20',
        '21:00:00',
        1
    );

-- NOVIEMBRE 2026
INSERT INTO
    public.venta (
        fecha,
        total,
        cliente_id,
        fecha_funcion,
        hora_funcion,
        estado_venta_id
    )
VALUES (
        '2026-11-01 10:00:00',
        6000.00,
        3,
        '2026-11-01',
        '15:30:00',
        1
    ),
    (
        '2026-11-05 10:00:00',
        6000.00,
        4,
        '2026-11-05',
        '17:30:00',
        1
    ),
    (
        '2026-11-10 10:00:00',
        6000.00,
        5,
        '2026-11-10',
        '19:00:00',
        1
    ),
    (
        '2026-11-15 10:00:00',
        6000.00,
        3,
        '2026-11-15',
        '20:00:00',
        1
    ),
    (
        '2026-11-20 10:00:00',
        6000.00,
        4,
        '2026-11-20',
        '22:30:00',
        1
    );

-- DICIEMBRE 2026
INSERT INTO
    public.venta (
        fecha,
        total,
        cliente_id,
        fecha_funcion,
        hora_funcion,
        estado_venta_id
    )
VALUES (
        '2026-12-01 10:00:00',
        6000.00,
        3,
        '2026-12-01',
        '14:00:00',
        1
    ),
    (
        '2026-12-05 10:00:00',
        6000.00,
        4,
        '2026-12-05',
        '18:30:00',
        1
    ),
    (
        '2026-12-10 10:00:00',
        6000.00,
        5,
        '2026-12-10',
        '19:30:00',
        1
    ),
    (
        '2026-12-15 10:00:00',
        6000.00,
        3,
        '2026-12-15',
        '20:30:00',
        1
    ),
    (
        '2026-12-20 10:00:00',
        6000.00,
        4,
        '2026-12-20',
        '21:30:00',
        1
    ),
    (
        '2026-12-25 10:00:00',
        6000.00,
        5,
        '2026-12-25',
        '22:00:00',
        1
    );

INSERT INTO
    public.entrada (
        token,
        es_usado,
        expiracion,
        disponibilidad_butaca_id,
        venta_id
    )
VALUES (
        'token-v6-e1',
        false,
        '2026-01-05 23:59:59',
        1,
        6
    ),
    (
        'token-v6-e2',
        false,
        '2026-01-05 23:59:59',
        2,
        6
    ),
    (
        'token-v7-e1',
        false,
        '2026-01-05 23:59:59',
        3,
        7
    ),
    (
        'token-v8-e1',
        false,
        '2026-01-06 23:59:59',
        4,
        8
    ),
    (
        'token-v8-e2',
        false,
        '2026-01-06 23:59:59',
        5,
        8
    ),
    (
        'token-v9-e1',
        false,
        '2026-01-06 23:59:59',
        6,
        9
    ),
    (
        'token-v10-e1',
        false,
        '2026-01-07 23:59:59',
        7,
        10
    ),
    (
        'token-v11-e1',
        false,
        '2026-01-08 23:59:59',
        8,
        11
    ),
    (
        'token-v12-e1',
        false,
        '2026-01-09 23:59:59',
        9,
        12
    ),
    (
        'token-v13-e1',
        false,
        '2026-01-10 23:59:59',
        10,
        13
    ),
    (
        'token-v14-e1',
        false,
        '2026-01-11 23:59:59',
        11,
        14
    ),
    (
        'token-v15-e1',
        false,
        '2026-01-12 23:59:59',
        12,
        15
    ),
    (
        'token-v16-e1',
        false,
        '2026-01-13 23:59:59',
        13,
        16
    ),
    (
        'token-v17-e1',
        false,
        '2026-01-14 23:59:59',
        14,
        17
    ),
    (
        'token-v18-e1',
        false,
        '2026-01-15 23:59:59',
        15,
        18
    ),
    (
        'token-v19-e1',
        false,
        '2026-01-16 23:59:59',
        16,
        19
    );

-- Febrero (ventas 20-27)
INSERT INTO
    public.entrada (
        token,
        es_usado,
        expiracion,
        disponibilidad_butaca_id,
        venta_id
    )
VALUES (
        'token-v20-e1',
        false,
        '2026-02-02 23:59:59',
        17,
        20
    ),
    (
        'token-v21-e1',
        false,
        '2026-02-03 23:59:59',
        18,
        21
    ),
    (
        'token-v22-e1',
        false,
        '2026-02-05 23:59:59',
        19,
        22
    ),
    (
        'token-v23-e1',
        false,
        '2026-02-07 23:59:59',
        20,
        23
    ),
    (
        'token-v24-e1',
        false,
        '2026-02-10 23:59:59',
        1,
        24
    ),
    (
        'token-v25-e1',
        false,
        '2026-02-14 23:59:59',
        2,
        25
    ),
    (
        'token-v26-e1',
        false,
        '2026-02-15 23:59:59',
        3,
        26
    ),
    (
        'token-v27-e1',
        false,
        '2026-02-20 23:59:59',
        4,
        27
    );

-- Marzo (ventas 28-35)
INSERT INTO
    public.entrada (
        token,
        es_usado,
        expiracion,
        disponibilidad_butaca_id,
        venta_id
    )
VALUES (
        'token-v28-e1',
        false,
        '2026-03-01 23:59:59',
        5,
        28
    ),
    (
        'token-v29-e1',
        false,
        '2026-03-05 23:59:59',
        6,
        29
    ),
    (
        'token-v30-e1',
        false,
        '2026-03-08 23:59:59',
        7,
        30
    ),
    (
        'token-v31-e1',
        false,
        '2026-03-10 23:59:59',
        8,
        31
    ),
    (
        'token-v32-e1',
        false,
        '2026-03-12 23:59:59',
        9,
        32
    ),
    (
        'token-v33-e1',
        false,
        '2026-03-15 23:59:59',
        10,
        33
    ),
    (
        'token-v34-e1',
        false,
        '2026-03-20 23:59:59',
        11,
        34
    ),
    (
        'token-v35-e1',
        false,
        '2026-03-25 23:59:59',
        12,
        35
    );

-- Abril (ventas 36-41)
INSERT INTO
    public.entrada (
        token,
        es_usado,
        expiracion,
        disponibilidad_butaca_id,
        venta_id
    )
VALUES (
        'token-v36-e1',
        false,
        '2026-04-01 23:59:59',
        13,
        36
    ),
    (
        'token-v37-e1',
        false,
        '2026-04-05 23:59:59',
        14,
        37
    ),
    (
        'token-v38-e1',
        false,
        '2026-04-10 23:59:59',
        15,
        38
    ),
    (
        'token-v39-e1',
        false,
        '2026-04-15 23:59:59',
        16,
        39
    ),
    (
        'token-v40-e1',
        false,
        '2026-04-20 23:59:59',
        17,
        40
    ),
    (
        'token-v41-e1',
        false,
        '2026-04-25 23:59:59',
        18,
        41
    );

-- Mayo (ventas 42-47)
INSERT INTO
    public.entrada (
        token,
        es_usado,
        expiracion,
        disponibilidad_butaca_id,
        venta_id
    )
VALUES (
        'token-v42-e1',
        false,
        '2026-05-01 23:59:59',
        19,
        42
    ),
    (
        'token-v43-e1',
        false,
        '2026-05-05 23:59:59',
        20,
        43
    ),
    (
        'token-v44-e1',
        false,
        '2026-05-10 23:59:59',
        1,
        44
    ),
    (
        'token-v45-e1',
        false,
        '2026-05-15 23:59:59',
        2,
        45
    ),
    (
        'token-v46-e1',
        false,
        '2026-05-20 23:59:59',
        3,
        46
    ),
    (
        'token-v47-e1',
        false,
        '2026-05-25 23:59:59',
        4,
        47
    );

-- Junio (ventas 48-52)
INSERT INTO
    public.entrada (
        token,
        es_usado,
        expiracion,
        disponibilidad_butaca_id,
        venta_id
    )
VALUES (
        'token-v48-e1',
        false,
        '2026-06-01 23:59:59',
        5,
        48
    ),
    (
        'token-v49-e1',
        false,
        '2026-06-05 23:59:59',
        6,
        49
    ),
    (
        'token-v50-e1',
        false,
        '2026-06-10 23:59:59',
        7,
        50
    ),
    (
        'token-v51-e1',
        false,
        '2026-06-15 23:59:59',
        8,
        51
    ),
    (
        'token-v52-e1',
        false,
        '2026-06-20 23:59:59',
        9,
        52
    );

-- Julio (ventas 53-57)
INSERT INTO
    public.entrada (
        token,
        es_usado,
        expiracion,
        disponibilidad_butaca_id,
        venta_id
    )
VALUES (
        'token-v53-e1',
        false,
        '2026-07-01 23:59:59',
        10,
        53
    ),
    (
        'token-v54-e1',
        false,
        '2026-07-05 23:59:59',
        11,
        54
    ),
    (
        'token-v55-e1',
        false,
        '2026-07-10 23:59:59',
        12,
        55
    ),
    (
        'token-v56-e1',
        false,
        '2026-07-15 23:59:59',
        13,
        56
    ),
    (
        'token-v57-e1',
        false,
        '2026-07-20 23:59:59',
        14,
        57
    );

-- Agosto (ventas 58-62)
INSERT INTO
    public.entrada (
        token,
        es_usado,
        expiracion,
        disponibilidad_butaca_id,
        venta_id
    )
VALUES (
        'token-v58-e1',
        false,
        '2026-08-01 23:59:59',
        15,
        58
    ),
    (
        'token-v59-e1',
        false,
        '2026-08-05 23:59:59',
        16,
        59
    ),
    (
        'token-v60-e1',
        false,
        '2026-08-10 23:59:59',
        17,
        60
    ),
    (
        'token-v61-e1',
        false,
        '2026-08-15 23:59:59',
        18,
        61
    ),
    (
        'token-v62-e1',
        false,
        '2026-08-20 23:59:59',
        19,
        62
    );

-- Septiembre (ventas 63-67)
INSERT INTO
    public.entrada (
        token,
        es_usado,
        expiracion,
        disponibilidad_butaca_id,
        venta_id
    )
VALUES (
        'token-v63-e1',
        false,
        '2026-09-01 23:59:59',
        20,
        63
    ),
    (
        'token-v64-e1',
        false,
        '2026-09-05 23:59:59',
        1,
        64
    ),
    (
        'token-v65-e1',
        false,
        '2026-09-10 23:59:59',
        2,
        65
    ),
    (
        'token-v66-e1',
        false,
        '2026-09-15 23:59:59',
        3,
        66
    ),
    (
        'token-v67-e1',
        false,
        '2026-09-20 23:59:59',
        4,
        67
    );

-- Octubre (ventas 68-72)
INSERT INTO
    public.entrada (
        token,
        es_usado,
        expiracion,
        disponibilidad_butaca_id,
        venta_id
    )
VALUES (
        'token-v68-e1',
        false,
        '2026-10-01 23:59:59',
        5,
        68
    ),
    (
        'token-v69-e1',
        false,
        '2026-10-05 23:59:59',
        6,
        69
    ),
    (
        'token-v70-e1',
        false,
        '2026-10-10 23:59:59',
        7,
        70
    ),
    (
        'token-v71-e1',
        false,
        '2026-10-15 23:59:59',
        8,
        71
    ),
    (
        'token-v72-e1',
        false,
        '2026-10-20 23:59:59',
        9,
        72
    );

-- Noviembre (ventas 73-77)
INSERT INTO
    public.entrada (
        token,
        es_usado,
        expiracion,
        disponibilidad_butaca_id,
        venta_id
    )
VALUES (
        'token-v73-e1',
        false,
        '2026-11-01 23:59:59',
        10,
        73
    ),
    (
        'token-v74-e1',
        false,
        '2026-11-05 23:59:59',
        11,
        74
    ),
    (
        'token-v75-e1',
        false,
        '2026-11-10 23:59:59',
        12,
        75
    ),
    (
        'token-v76-e1',
        false,
        '2026-11-15 23:59:59',
        13,
        76
    ),
    (
        'token-v77-e1',
        false,
        '2026-11-20 23:59:59',
        14,
        77
    );

-- Diciembre (ventas 78-83)
INSERT INTO
    public.entrada (
        token,
        es_usado,
        expiracion,
        disponibilidad_butaca_id,
        venta_id
    )
VALUES (
        'token-v78-e1',
        false,
        '2026-12-01 23:59:59',
        15,
        78
    ),
    (
        'token-v79-e1',
        false,
        '2026-12-05 23:59:59',
        16,
        78
    ),
    (
        'token-v80-e1',
        false,
        '2026-12-10 23:59:59',
        17,
        78
    ),
    (
        'token-v81-e1',
        false,
        '2026-12-15 23:59:59',
        18,
        78
    ),
    (
        'token-v82-e1',
        false,
        '2026-12-20 23:59:59',
        19,
        78
    ),
    (
        'token-v83-e1',
        false,
        '2026-12-25 23:59:59',
        20,
        78
    );