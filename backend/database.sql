DROP DATABASE IF EXISTS DW4_SOBRE_FUTBOL;
CREATE DATABASE DW4_SOBRE_FUTBOL;
USE DW4_SOBRE_FUTBOL;

CREATE TABLE equipos(
    id_equipo TINYINT(1) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    puntos INT(4),
    apodo VARCHAR(25),
    entrenador VARCHAR(50),
    imagen VARCHAR(50)
)ENGINE='innoDB';

CREATE TABLE usuarios(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(55) UNIQUE NOT NULL,
    clave VARCHAR(255) NOT NULL,
    nombre VARCHAR(55),
    apellido VARCHAR(100),
    fecha_alta DATETIME,
    avatar VARCHAR(100),
    fecha_nacimiento DATE,
    equipo TINYINT(1) UNSIGNED,
    
    FOREIGN KEY(equipo) REFERENCES equipos(id_equipo) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE='innoDB';

CREATE TABLE publicaciones(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    texto text,
    privacidad ENUM('Sólo yo', 'Todos'),
    dia DATE,
    hora TIME,
    usuario INT UNSIGNED,
    imagen VARCHAR(100),
    
    FOREIGN KEY(usuario) REFERENCES usuarios(id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE='innoDB';

CREATE TABLE comentarios(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dia DATE,
    hora TIME,
    publicacion INT UNSIGNED,
    usuario INT UNSIGNED,
    texto VARCHAR(300),
    
    FOREIGN KEY(usuario) REFERENCES usuarios(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(publicacion) REFERENCES publicaciones(id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE='innoDB';


/*==================================================
                    INSERTAR
==================================================*/

INSERT INTO equipos (nombre, entrenador, apodo, puntos, imagen)
VALUES	
('Aldosivi',           'ÁNGEL GUILLERMO HOYOS'  ,'tiburon'         ,08,    'aldosivi.png'),
('Argentinos',         'DIEGO DABOVE'           ,'bicho'           ,25,    'argentinos.png'),
('Arsenal',            'SERGIO RONDINA'         ,'el viaducto'     ,17,    'arsenal.png'),
('Atlético Tucumán',   'RICARDO ZIELINSKI'      ,'el decano'       ,22,    'tucuman.jpg'),
('Banfield',           'JULIO FALCIONI'         ,'el taladro'      ,13,    'banfield.png'),
('Boca Juniors',       'GUSTAVO ALFARO'         ,'xeneise'         ,25,    'boca.png'),
('Central Córdoba',    'GUSTAVO COLEONI'        ,''                ,16,    'centralC.jpg'),
('Colón',              'PABLO LAVALLÉN'         ,'sabalero'        ,13,    'colon.png'),
('Defensa y Justicia', 'MARIANO SOSO'           ,''                ,14,    'defensa.png'),
('Estudiantes',        'GABRIEL MILITO'         ,'picha'           ,22,    'estudiantes.png'),
('Gimnasia y Esgrima', 'MARADONA'               ,'el lobo'         ,10,    'gimnasia.png'),
('Godoy Cruz',         'PABLO VOJVODA'          ,'tomba'           ,06,    'godoyCruz.png'),
('Huracán',            'NÉSTOR APUZZO'          ,'globo'           ,14,    'huracan.png'),
('Independiente',      'FERNANDO BERÓN'         ,'el rojo'         ,20,    'independiente.png'),
('Lanús',              'LUIS ZUBELDÍA'          ,'el granate'      ,25,    'lanus.png'),
('Newells Old Boys',   'FRANK DARÍO KUDELKA'    ,'la lepra'        ,21,    'newlls.png'),
('Patronato',          'MARIO SCIACQUA'         ,''                ,13,    'patronato.png'),
('Racing',             'EDUARDO COUDET'         ,'la academia'     ,24,    'racing.png'),
('River Plate (ARG)',  'MARCELO GALLARDO'       ,'gallinas'        ,24,    'riber.png'),
('Rosario Central',    'DIEGO COCCA'            ,'canalla'         ,19,    'rosario.png'),
('San Lorenzo',        'DIEGO MONARRIZ'         ,'ciclon'          ,19,    'sanSilencio.png'),
('Talleres',           'ALEXANDER MEDINA'       ,'la gloria'       ,19,    'talleres.png'),
('Unión de Santa Fe',  'LEONARDO MADELÓN'       ,'tatengue'        ,16,    'union.png'),
('Vélez Sarsfield',    'GABRIEL HEINZE'         ,'el fortin'       ,22,    'velez.png');





/*TODAS LAS CLAVES SON 1234*/
INSERT INTO usuarios(nombre, apellido, email, clave, fecha_alta, avatar, equipo, fecha_nacimiento)
VALUES
('Willy', 'Cordon', 'cordonwilly24@gmail.com', '$2y$10$2cxR4r.B86y7nnfhaRGKKuiIsnsNKLs/yUQ6RQS8/pEfMTh2WLhM2', now(), 'boca.jpg', 6, '1992-12-22'),
('alejandro', 'didonato', 'alejandro.didonato@davinci.edu.ar', '$2y$10$2cxR4r.B86y7nnfhaRGKKuiIsnsNKLs/yUQ6RQS8/pEfMTh2WLhM2', now(), 'riber.png', 19, '1992-12-22'),
('Luna', 'Lovegod', 'lunalovegod@gmail.com', '$2y$10$2cxR4r.B86y7nnfhaRGKKuiIsnsNKLs/yUQ6RQS8/pEfMTh2WLhM2', now(), 'luna.jpg', 3, '1992-12-22'),
('Draco', 'Malfoy', 'dracomalfoy@gmail.com', '$2y$10$2cxR4r.B86y7nnfhaRGKKuiIsnsNKLs/yUQ6RQS8/pEfMTh2WLhM2', now(), 'draco.jpg', 4, '1992-12-22'),
('Hermione', 'Granger', 'jermaioni@gmail.com', '$2y$10$2cxR4r.B86y7nnfhaRGKKuiIsnsNKLs/yUQ6RQS8/pEfMTh2WLhM2', now(), 'hermione.jpg', 1, '1992-12-22');

INSERT INTO publicaciones (texto, privacidad, dia, hora, usuario, imagen)
VALUES
('Me quiero comprar esta mochila', 'Todos', '2019-12-25', '10:20:30', 3, 'mochila.jpg'),
('Necesito una lechuza nueva', 'Todos', '2019-12-25', '10:20:30', 1, null),
('La escena del baile en la septima película fue cualquier cosa', 'Todos', '2019-12-25', '10:20:30', 1, null),
('Voldemort LTA', 'Todos', '2019-12-25', '10:20:30', 1, null),
('¿Alguien sabe de alguna crema para las cicatrices?', 'Todos', '2019-12-25', '10:20:30', 1, null),
('Espero no morir en la Copa de los Tres Magos', 'Todos', '2019-12-25', '10:20:30', 2, null),
('Despreciando a los sangre impura con los más lindos', 'Todos', '2019-12-25', '10:20:30', 4, null);

INSERT INTO comentarios(texto, publicacion, usuario, dia, hora)
VALUES
('Callate Lunática', 1, 4, '2019-12-25', '10:20:30'),
('Andate a freir churros Malfoy LTA', 1, 1, '2019-12-25', '10:20:30'),
('Jajaja buena esa Harry', 1, 2, '2019-12-25', '10:20:30'),
('Dejen de pelear. Tiene que haber Fairplay', 1, 5, '2019-12-25', '10:20:30'),
('Harry Popoter está triste', 2, 4, '2019-12-25', '10:20:30');