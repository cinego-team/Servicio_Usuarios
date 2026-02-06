\c postgres
drop database mspeliculas;
create database mspeliculas;
\c mspeliculas
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
-- Name: clasificacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clasificacion (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.clasificacion OWNER TO grupou;

--
-- Name: clasificacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clasificacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clasificacion_id_seq OWNER TO grupou;

--
-- Name: clasificacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clasificacion_id_seq OWNED BY public.clasificacion.id;


--
-- Name: estado_pelicula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado_pelicula (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.estado_pelicula OWNER TO grupou;

--
-- Name: estado_pelicula_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_pelicula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estado_pelicula_id_seq OWNER TO grupou;

--
-- Name: estado_pelicula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_pelicula_id_seq OWNED BY public.estado_pelicula.id;


--
-- Name: genero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genero (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.genero OWNER TO grupou;

--
-- Name: genero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genero_id_seq OWNER TO grupou;

--
-- Name: genero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genero_id_seq OWNED BY public.genero.id;


--
-- Name: pelicula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pelicula (
    id integer NOT NULL,
    titulo character varying(100) NOT NULL,
    director character varying(100) NOT NULL,
    duracion integer NOT NULL,
    fecha_estreno character varying(10),
    sinopsis text,
    url_imagen text,
    empleado_responsable integer NOT NULL,
    genero_id integer NOT NULL,
    clasificacion_id integer NOT NULL,
    estado_id integer NOT NULL
);


ALTER TABLE public.pelicula OWNER TO grupou;

--
-- Name: pelicula_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pelicula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pelicula_id_seq OWNER TO grupou;

--
-- Name: pelicula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pelicula_id_seq OWNED BY public.pelicula.id;


--
-- Name: clasificacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clasificacion ALTER COLUMN id SET DEFAULT nextval('public.clasificacion_id_seq'::regclass);


--
-- Name: estado_pelicula id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_pelicula ALTER COLUMN id SET DEFAULT nextval('public.estado_pelicula_id_seq'::regclass);


--
-- Name: genero id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genero ALTER COLUMN id SET DEFAULT nextval('public.genero_id_seq'::regclass);


--
-- Name: pelicula id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pelicula ALTER COLUMN id SET DEFAULT nextval('public.pelicula_id_seq'::regclass);


--
-- Name: pelicula PK_02f5106365de6c700cef55609e0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pelicula
    ADD CONSTRAINT "PK_02f5106365de6c700cef55609e0" PRIMARY KEY (id);


--
-- Name: genero PK_681c2c8d602304f33f9cc74e6ad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT "PK_681c2c8d602304f33f9cc74e6ad" PRIMARY KEY (id);


--
-- Name: clasificacion PK_7793c9a58181b6e3e54df6020d1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clasificacion
    ADD CONSTRAINT "PK_7793c9a58181b6e3e54df6020d1" PRIMARY KEY (id);


--
-- Name: estado_pelicula PK_ddd42015f9cffdb7573f4272115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_pelicula
    ADD CONSTRAINT "PK_ddd42015f9cffdb7573f4272115" PRIMARY KEY (id);


--
-- Name: pelicula FK_cb7e6dc78533aaf8e7a762f245a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pelicula
    ADD CONSTRAINT "FK_cb7e6dc78533aaf8e7a762f245a" FOREIGN KEY (estado_id) REFERENCES public.estado_pelicula(id);


--
-- Name: pelicula FK_d25f64d62a91917b295e661ee29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pelicula
    ADD CONSTRAINT "FK_d25f64d62a91917b295e661ee29" FOREIGN KEY (clasificacion_id) REFERENCES public.clasificacion(id);


--
-- Name: pelicula FK_f3052d691c9f30f19179a0fc57b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pelicula
    ADD CONSTRAINT "FK_f3052d691c9f30f19179a0fc57b" FOREIGN KEY (genero_id) REFERENCES public.genero(id);


--
-- PostgreSQL database dump complete
--

insert into public.estado_pelicula (nombre) values ('EN CARTELERA'), ('FUERA DE CARTELERA');

insert into
    public.genero (nombre)
values ('ACCION'),
    ('AVENTURA'),
    ('COMEDIA'),
    ('DRAMA'),
    ('TERROR'),
    ('SUSPENSO'),
    ('CIENCIA FICCION'),
    ('FANTASIA'),
    ('ROMANCE'),
    ('MISTERIO'),
    ('ANIMACION'),
    ('DOCUMENTAL'),
    ('MUSICAL'),
    ('CRIMEN'),
    ('GUERRA'),
    ('WESTERN'),
    ('HISTORICA'),
    ('DEPORTES'),
    ('SUPERHEROES'),
    ('CORTOMETRAJE');

insert into
    public.clasificacion (nombre)
values ('ATP'),
    ('SAM13'),
    ('SAM16'),
    ('SAM18'),
    ('C'),
    ('PENDIENTE DE CLASIFICACION');

insert into
    public.pelicula (
        director,
        duracion,
        fecha_estreno,
        sinopsis,
        url_imagen,
        titulo,
        clasificacion_id,
        genero_id,
        estado_id,
        empleado_responsable
    )
values (
        'CHRISTOPHER NOLAN',
        180,
        '2023-07-20',
        'UN FISICO LIDERA EL PROYECTO PARA CONSTRUIR LA PRIMERA BOMBA ATOMICA DURANTE LA SEGUNDA GUERRA MUNDIAL.',
        'https://i.ibb.co/spQ366sr/images.jpg',
        'OPPENHEIMER',
        3,
        17,
        1,
        1
    ),
    (
        'GRETA GERWIG',
        114,
        '2023-07-21',
        'UNA MUÑECA QUE VIVE EN BARBIELAND COMIENZA UNA AVENTURA EN EL MUNDO REAL PARA DESCUBRIR QUIEN ES EN REALIDAD.',
        'https://i.ibb.co/YzXBLDV/71619tdimx-L.jpg',
        'BARBIE',
        1,
        9,
        1,
        1
    ),
    (
        'DENIS VILLENEUVE',
        155,
        '2024-03-01',
        'PAUL ATREIDES SE UNE A LOS FREMEN PARA VENGAR A SU FAMILIA Y ASEGURAR EL FUTURO DE ARRAKIS.',
        'https://i.ibb.co/FbhLKvzv/81-ZMkn8-HGBL.jpg',
        'DUNA: PARTE DOS',
        3,
        7,
        1,
        1
    ),
    (
        'TODD PHILLIPS',
        122,
        '2019-10-04',
        'UN COMEDIANTE FRUSTRADO SE SUMERGE EN LA LOCURA Y SE CONVIERTE EN EL EMBLEMA DEL CAOS EN CIUDAD GOTICA.',
        'https://i.ibb.co/hJwpB8wZ/817-Zj-ZCTQo-L-AC-UF1000-1000-QL80.jpg',
        'JOKER',
        4,
        20,
        2,
        1
    ),
    (
        'PETE DOCTER',
        100,
        '2015-06-19',
        'LAS EMOCIONES DE UNA NIÑA COBRAN VIDA Y TRATAN DE GUIARLA EN UN MOMENTO DIFICIL DE SU VIDA.',
        'https://i.ibb.co/27S2NphF/ac77eae0c2c2f6246b5034af318fc0b4.jpg',
        'INTENSA-MENTE',
        1,
        11,
        2,
        1
    ),
    (
        'DENIS VILLENEUVE',
        166,
        '2021-10-22',
        'UN JOVEN NOBLE DESCUBRE SU DESTINO EN UN PLANETA DESÉRTICO LLENO DE PELIGROS Y TRAICIONES.',
        'https://i.ibb.co/pvdFJqtv/dune-1.jpg',
        'DUNA',
        3,
        7,
        1,
        1
    ),
    (
        'JAMES CAMERON',
        192,
        '2022-12-16',
        'UNA FAMILIA DE LOS NA’VI DEBE PROTEGER SU HOGAR CUANDO UNA VIEJA AMENAZA REGRESA A PANDORA.',
        'https://i.ibb.co/RK0qLyq/avatar-2.jpg',
        'AVATAR: EL CAMINO DEL AGUA',
        1,
        8,
        1,
        1
    ),
    (
        'MATT REEVES',
        176,
        '2022-03-04',
        'UN VIGILANTE ENMASCARADO INTENTA DETENER A UN ASESINO QUE DEJA PISTAS EN TODA GOTHAM.',
        'https://i.ibb.co/Y7JNDR9G/thebatman.jpg',
        'THE BATMAN',
        3,
        19,
        1,
        1
    ),
    (
        'GEORGE MILLER',
        148,
        '2024-05-23',
        'UNA GUERRERA CAPTURADA EN EL DESIERTO LUCHA POR SOBREVIVIR EN UN MUNDO POSTAPOCALIPTICO.',
        'https://i.ibb.co/CpF70pSf/furiosa.jpg',
        'FURIOSA: A MAD MAX SAGA',
        3,
        1,
        1,
        1
    ),
    (
        'HAYAO MIYAZAKI',
        124,
        '2023-12-08',
        'UN JOVEN EMPRENDE UN VIAJE FANTASTICO PARA ENFRENTAR MISTERIOS SOBRE SU FAMILIA.',
        'https://i.ibb.co/cStnD35h/chicoygarza.jpg',
        'EL NIÑO Y LA GARZA',
        1,
        11,
        1,
        1
    ),
    (
        'JOHN KRASINSKI',
        100,
        '2024-05-17',
        'UN GRUPO DE PERSONAS DEBE GUARDAR SILENCIO ABSOLUTO PARA SOBREVIVIR A CRIATURAS SENSIBLES AL SONIDO.',
        'https://i.ibb.co/219Zddmx/aqp.jpg',
        'UN LUGAR EN SILENCIO: DÍA UNO',
        3,
        6,
        1,
        1
    ),
    (
        'RIDLEY SCOTT',
        158,
        '2023-11-22',
        'LA VIDA DE NAPOLEON BONAPARTE MUESTRA SU ASCENSO, CONQUISTAS Y CONFLICTOS PERSONALES.',
        'https://i.ibb.co/8LMzZ31X/napo.jpg',
        'NAPOLEÓN',
        4,
        17,
        1,
        1
    ),
    (
        'TAIKA WAITITI',
        118,
        '2022-07-08',
        'EL DIOS DEL TRUENO DEBE ENFRENTAR A UN ASESINO DE DIOSES MIENTRAS BUSCA REENCONTRARSE A SI MISMO.',
        'https://i.ibb.co/ccK1jVzv/thor4.jpg',
        'THOR: LOVE AND THUNDER',
        1,
        19,
        1,
        1
    ),
    (
        'SAM RAIMI',
        126,
        '2022-05-06',
        'UN HECHICERO VIAJA ENTRE DIMENSIONES PARA PROTEGER EL MULTIVERSO DE UNA AMENAZA DESCONOCIDA.',
        'https://i.ibb.co/9mCWjWV6/dsmm.jpg',
        'DOCTOR STRANGE EN EL MULTIVERSO DE LA LOCURA',
        3,
        19,
        1,
        1
    ),
    (
        'GUILLERMO DEL TORO',
        117,
        '2022-12-09',
        'UNA VERSION OSCURA Y EMOTIVA DE PINOCHO QUE EXPLORA LA PERDIDA, EL AMOR Y LA HUMANIDAD.',
        'https://i.ibb.co/nqWnc9Lb/pinocho.jpg',
        'PINOCHO',
        1,
        11,
        1,
        1
    );