\c msusuarios;
insert into roles (id, name) values
(1, 'EMPLEADO'),
(2, 'CLIENTE');
insert into permissions (id, code) values
(1, 'EMPLEADO'),
(2, 'CLIENTE');
insert into users (id, email, password, "roleId") values
(1, 'email1@jotmail.com', '$2b$10$KDQxgwkdaKTWJD8y5GSyAeDfu6DaNIypIo5qG7/x7e1qN.WjnhuWq', 1),
(2, 'email2@jotmail.com', '$2b$10$59tcm4WzdfvHUYTEMyjqeeUpg7cRPuQKoqe7PMOtEI4I7.o1gg1HG', 1),
(3, 'email3@jotmail.com', '$2b$10$Lw17SNre/cfCTkA33/o4Z.1u5tpjWAi8AMVLVYNRaVxxIrf1TXO6u', 2),
(4, 'email4@jotmail.com', '$2b$10$.UIsZbO6NBaGq1XQLiYAr.xWaKBOVgEsvsJyWmyc.KLDIzDvc3E/O', 2);
insert into roles_permissions_permissions ("rolesId", "permissionsId") values
(1, 1),
(1, 2),
(2, 2);

\c msventas;
insert into estado_venta (nombre) values ('APROBADA'), ('RECHAZADA'), ('PENDIENTE DE PAGO');

\c msfuncionesysalas
insert into estado_disponibilidad_butaca (nombre) values ('DISPONIBLE'), ('RESERVADA'), ('OCUPADA');
insert into formato (nombre, precio) values ('2D', 6000), ('3D', 8000);

\c mspeliculas
insert into estado_pelicula (nombre) values ('EN CARTELERA'), ('FUERA DE CARTELERA');
insert into genero (nombre) values
('ACCION'),
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
insert into clasificacion (nombre) values
('ATP'),
('SAM13'),
('SAM16'),
('SAM18'),
('C'),
('PENDIENTE DE CLASIFICACION');
insert into idioma (nombre) values ('ORIGINAL'), ('DOBLAJE CASTELLANO');
insert into pelicula 
(director, duracion, 'fechaEstreno', sinopsis, titulo, idioma, clasificacion, genero, 'estadoPelicula', 'empleadoResponsable') 
values
('CHRISTOPHER NOLAN', 180, '2023-07-20', 'UN FISICO LIDERA EL PROYECTO PARA CONSTRUIR LA PRIMERA BOMBA ATOMICA DURANTE LA SEGUNDA GUERRA MUNDIAL.', 'OPPENHEIMER', 1, 3, 17, 1, 1),
('GRETA GERWIG', 114, '2023-07-21', 'UNA MUÑECA QUE VIVE EN BARBIELAND COMIENZA UNA AVENTURA EN EL MUNDO REAL PARA DESCUBRIR QUIEN ES EN REALIDAD.', 'BARBIE', 1, 1, 9, 1, 1),
('DENIS VILLENEUVE', 155, '2024-03-01', 'PAUL ATREIDES SE UNE A LOS FREMEN PARA VENGAR A SU FAMILIA Y ASEGURAR EL FUTURO DE ARRAKIS.', 'DUNA: PARTE DOS', 1, 3, 7, 1, 1),
('TODD PHILLIPS', 122, '2019-10-04', 'UN COMEDIANTE FRUSTRADO SE SUMERGE EN LA LOCURA Y SE CONVIERTE EN EL EMBLEMA DEL CAOS EN CIUDAD GOTICA.', 'JOKER', 2, 4, 20, 2, 1),
('PETE DOCTER', 100, '2015-06-19', 'LAS EMOCIONES DE UNA NIÑA COBRAN VIDA Y TRATAN DE GUIARLA EN UN MOMENTO DIFICIL DE SU VIDA.', 'INTENSA-MENTE', 2, 1, 11, 2, 1);

