\c postgres
drop database msusuarios;
create database msusuarios;
\c msusuarios

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
-- Name: permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission (
    id integer NOT NULL,
    code character varying NOT NULL
);


ALTER TABLE public.permission OWNER TO grupou;

--
-- Name: permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permission_id_seq OWNER TO grupou;

--
-- Name: permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permission_id_seq OWNED BY public.permission.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying NOT NULL,
    tipo_cliente_id integer
);


ALTER TABLE public.roles OWNER TO grupou;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO grupou;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: roles_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles_permissions (
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.roles_permissions OWNER TO grupou;

--
-- Name: tipo_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_cliente (
    id integer NOT NULL,
    denominacion character varying(100) NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE public.tipo_cliente OWNER TO grupou;

--
-- Name: tipo_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_cliente_id_seq OWNER TO grupou;

--
-- Name: tipo_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_cliente_id_seq OWNED BY public.tipo_cliente.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    contrasena character varying(255) NOT NULL,
    fecha_nacimiento date NOT NULL,
    nro_telefono character varying(20) NOT NULL,
    legajo integer,
    role_id integer
);


ALTER TABLE public.users OWNER TO grupou;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO grupou;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission ALTER COLUMN id SET DEFAULT nextval('public.permission_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: tipo_cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_cliente ALTER COLUMN id SET DEFAULT nextval('public.tipo_cliente_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: roles_permissions PK_0cd11f0b35c4d348c6ebb9b36b7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT "PK_0cd11f0b35c4d348c6ebb9b36b7" PRIMARY KEY (role_id, permission_id);


--
-- Name: tipo_cliente PK_13a2b6e733e2e9c45b036ec692d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_cliente
    ADD CONSTRAINT "PK_13a2b6e733e2e9c45b036ec692d" PRIMARY KEY (id);


--
-- Name: permission PK_3b8b97af9d9d8807e41e6f48362; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT "PK_3b8b97af9d9d8807e41e6f48362" PRIMARY KEY (id);


--
-- Name: users PK_a3ffb1c0c8416b9fc6f907b7433; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);


--
-- Name: roles PK_c1433d71a4838793a49dcad46ab; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT "PK_c1433d71a4838793a49dcad46ab" PRIMARY KEY (id);


--
-- Name: roles REL_1c72ef89550bdf03e66c462049; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT "REL_1c72ef89550bdf03e66c462049" UNIQUE (tipo_cliente_id);


--
-- Name: permission UQ_30e166e8c6359970755c5727a23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT "UQ_30e166e8c6359970755c5727a23" UNIQUE (code);


--
-- Name: roles UQ_648e3f5447f725579d7d4ffdfb7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT "UQ_648e3f5447f725579d7d4ffdfb7" UNIQUE (name);


--
-- Name: IDX_337aa8dba227a1fe6b73998307; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_337aa8dba227a1fe6b73998307" ON public.roles_permissions USING btree (permission_id);


--
-- Name: IDX_7d2dad9f14eddeb09c256fea71; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_7d2dad9f14eddeb09c256fea71" ON public.roles_permissions USING btree (role_id);


--
-- Name: roles FK_1c72ef89550bdf03e66c4620491; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT "FK_1c72ef89550bdf03e66c4620491" FOREIGN KEY (tipo_cliente_id) REFERENCES public.tipo_cliente(id);


--
-- Name: roles_permissions FK_337aa8dba227a1fe6b73998307b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT "FK_337aa8dba227a1fe6b73998307b" FOREIGN KEY (permission_id) REFERENCES public.permission(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: roles_permissions FK_7d2dad9f14eddeb09c256fea719; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT "FK_7d2dad9f14eddeb09c256fea719" FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users FK_a2cecd1a3531c0b041e29ba46e1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_a2cecd1a3531c0b041e29ba46e1" FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- PostgreSQL database dump complete
--

insert into
    public.tipo_cliente (denominacion, descripcion)
values ('BASIC', 'Cliente básico.'),
    (
        'JUBILADO',
        'Adultos mayores jubilados con beneficios.'
    ),
    (
        'ESTUDIANTE',
        'Estudiantes comprobables con beneficios.'
    );

insert into
    public.roles (name, tipo_cliente_id)
values ('EMPLEADO', null),
    ('CLIENTE', 1);

insert into public.permission (code) values ('EMPLEADO'), ('CLIENTE');
-- todas las contrasenas son 'Contrasena?1'
insert into
    public.users (
        nombre,
        apellido,
        email,
        contrasena,
        fecha_nacimiento,
        nro_telefono,
        legajo,
        role_id
    )
values (
        'Ramiro',
        'Lynch Ramonda',
        'ramiro@hotmail.com',
        '$2b$10$iH1r6fojOvqkG2PMsQQGn.HdUAjePLnY9DKDdSqojPdGSrXqmRzFq',
        '2003-11-26',
        '3535649261',
        15886,
        1
    ),
    (
        'Valentino',
        'Pajón',
        'valentino@hotmail.com',
        '$2b$10$dvamvl02P7OzNa5UILTu9OtVOnGh5SXE/XjiFyxwQovD.w8055eXe',
        '2004-04-07',
        '3534413564',
        16338,
        1
    ),
    (
        'Gianella',
        'Rocha Vendivengo',
        'gianella@hotmail.com',
        '$2b$10$1ZeXMzVq.vLKfziEGM3ROuqSIh4B4nHVZ6KwZ99sgM39AowtUBh4e',
        '2004-11-21',
        '3537580542',
        15662,
        2
    ),
    (
        'Camila',
        'Villarreal',
        'camila@hotmail.com',
        '$2b$10$bH267x2JZ0UgDQbdQ3GZZ.nRcTPHsXFvX6cBy0vbYcvbp6GzdnjA.',
        '2004-11-28',
        '3534770446',
        15695,
        2
    ),
    (
        'Maria',
        'Rocha',
        'gianellarochavendivengo123@gmail.com',
        '$2b$10$lGsg1q9DcOVrUYTB2mT2He.cBoXvLkwLUwT4LZ8kn70H3zXmsFKe6',
        '1980-08-08',
        '+543537580542',
        NULL,
        2
    );

insert into
    public.roles_permissions (role_id, permission_id)
values (1, 1),
    (1, 2),
    (2, 2);