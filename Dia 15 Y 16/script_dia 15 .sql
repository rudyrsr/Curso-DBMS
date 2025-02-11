-- SQL Manager 2007 Lite for PostgreSQL 4.4.0.6
-- ---------------------------------------
-- Host      : localhost
-- Database  : postgres
-- Version   : PostgreSQL 8.3.3, compiled by Visual C++ build 1400


SET check_function_bodies = false;
--
-- Structure for table aula (OID = 24576) : 
--
SET search_path = public, pg_catalog;
CREATE TABLE public.aula (
    id_aula integer NOT NULL,
    codigo_aula character varying(20) NOT NULL,
    ubicacion character varying(20) NOT NULL,
    capacidad integer NOT NULL
) WITHOUT OIDS;
--
-- Structure for table dia (OID = 24579) : 
--
CREATE TABLE public.dia (
    id_dia integer NOT NULL,
    nombre_dia character varying(20) NOT NULL
) WITHOUT OIDS;
--
-- Structure for table docente (OID = 24582) : 
--
CREATE TABLE public.docente (
    codigo_doc character varying(20) NOT NULL,
    nombre_doc character varying(30) NOT NULL,
    apellido_pat character varying(50) NOT NULL,
    apellido_mat character varying(50) NOT NULL,
    profesion character varying(50) NOT NULL
) WITHOUT OIDS;
--
-- Structure for table doc_mat (OID = 24585) : 
--
CREATE TABLE public.doc_mat (
    codigo_mat character varying(20) NOT NULL,
    codigo_doc character varying(20) NOT NULL,
    grupo integer NOT NULL
) WITHOUT OIDS;
--
-- Structure for table horario (OID = 24588) : 
--
CREATE TABLE public.horario (
    id_horario integer NOT NULL,
    fecha_inicio date NOT NULL,
    horario_inicio time without time zone NOT NULL,
    horario_salida time without time zone NOT NULL,
    turno_hor character varying(15) NOT NULL
) WITHOUT OIDS;
--
-- Structure for table hora_mat_aula (OID = 24591) : 
--
CREATE TABLE public.hora_mat_aula (
    id_horario integer NOT NULL,
    id_dia integer NOT NULL,
    codigo_mat character varying(20) NOT NULL,
    id_aula integer NOT NULL
) WITHOUT OIDS;
--
-- Structure for table materia (OID = 24594) : 
--
CREATE TABLE public.materia (
    codigo_mat character varying(20) NOT NULL,
    nombre_mat character varying(30) NOT NULL,
    nivel character varying(30) NOT NULL
) WITHOUT OIDS;
--
-- Definition for view vista1 (OID = 24650) : 
--
CREATE VIEW public.vista1 AS
SELECT d.codigo_doc, d.nombre_doc, d.apellido_pat, d.apellido_mat, d.profesion
FROM docente d, horario h, dia di, hora_mat_aula hmt, materia m, doc_mat dm
WHERE (((((((((d.codigo_doc)::text = (dm.codigo_doc)::text) AND
    ((dm.codigo_mat)::text = (m.codigo_mat)::text)) AND
    ((m.codigo_mat)::text = (hmt.codigo_mat)::text)) AND (hmt.id_horario =
    h.id_horario)) AND (hmt.id_dia = di.id_dia)) AND ((di.nombre_dia)::text
    = 'Lunes'::text)) AND (h.horario_inicio >= '14:00:00'::time without
    time zone)) AND (h.horario_salida <= '17:00:00'::time without time zone));

--
-- Definition for view vista2 (OID = 24654) : 
--
CREATE VIEW public.vista2 AS
SELECT d.nombre_doc AS nombre, d.apellido_pat, m.nombre_mat AS apellido_mater
FROM docente d, doc_mat dm, materia m
WHERE ((((d.codigo_doc)::text = (dm.codigo_doc)::text) AND
    ((dm.codigo_mat)::text = (m.codigo_mat)::text)) AND
    ((d.nombre_doc)::text = 'Carlos'::text));

--
-- Definition for view view1 (OID = 24658) : 
--
CREATE VIEW public.view1 AS
SELECT d.nombre_doc AS nombre, d.apellido_pat AS dasd, m.nombre_mat AS asdasd
FROM docente d, doc_mat dm, materia m
WHERE ((((d.codigo_doc)::text = (dm.codigo_doc)::text) AND
    ((dm.codigo_mat)::text = (m.codigo_mat)::text)) AND
    ((d.nombre_doc)::text = 'Carlos'::text));

--
-- Data for table public.aula (OID = 24576) (LIMIT 0,10)
--
INSERT INTO aula (id_aula, codigo_aula, ubicacion, capacidad)
VALUES (652, 'A01-652', 'Bajo el bloque', 40);

INSERT INTO aula (id_aula, codigo_aula, ubicacion, capacidad)
VALUES (690, '00-690A', 'Edificio nuevo', 30);

INSERT INTO aula (id_aula, codigo_aula, ubicacion, capacidad)
VALUES (691, '00-691B', 'Edificio nuevo', 50);

INSERT INTO aula (id_aula, codigo_aula, ubicacion, capacidad)
VALUES (692, '00-692', 'Edificio nuevo', 50);

INSERT INTO aula (id_aula, codigo_aula, ubicacion, capacidad)
VALUES (693, '00-693', 'Edificio nuevo', 50);

INSERT INTO aula (id_aula, codigo_aula, ubicacion, capacidad)
VALUES (617, '00-617', 'Edificio nuevo', 60);

INSERT INTO aula (id_aula, codigo_aula, ubicacion, capacidad)
VALUES (632, '00-632', 'Edificio industrial', 30);

INSERT INTO aula (id_aula, codigo_aula, ubicacion, capacidad)
VALUES (633, '00-633', 'Edificio industrial', 30);

INSERT INTO aula (id_aula, codigo_aula, ubicacion, capacidad)
VALUES (634, '00-633', 'Edificio industrial', 30);

INSERT INTO aula (id_aula, codigo_aula, ubicacion, capacidad)
VALUES (635, '00-635', 'Edificio industrial', 30);

--
-- Data for table public.dia (OID = 24579) (LIMIT 0,6)
--
INSERT INTO dia (id_dia, nombre_dia)
VALUES (1, 'Lunes');

INSERT INTO dia (id_dia, nombre_dia)
VALUES (2, 'Martes');

INSERT INTO dia (id_dia, nombre_dia)
VALUES (3, 'Miercoles');

INSERT INTO dia (id_dia, nombre_dia)
VALUES (4, 'Jueves');

INSERT INTO dia (id_dia, nombre_dia)
VALUES (5, 'Viernes');

INSERT INTO dia (id_dia, nombre_dia)
VALUES (6, 'Sabado');

--
-- Data for table public.docente (OID = 24582) (LIMIT 0,5)
--
INSERT INTO docente (codigo_doc, nombre_doc, apellido_pat, apellido_mat, profesion)
VALUES ('100', 'Carlos', 'Montenegro', 'Aguilar', 'Ingeniero Civil');

INSERT INTO docente (codigo_doc, nombre_doc, apellido_pat, apellido_mat, profesion)
VALUES ('101', 'Ana', 'Cespedes', 'Aguilar', 'Ingeniero Industrial');

INSERT INTO docente (codigo_doc, nombre_doc, apellido_pat, apellido_mat, profesion)
VALUES ('103', 'ACarla', 'Camacho', 'Villarroel', 'Ingeniero Civil');

INSERT INTO docente (codigo_doc, nombre_doc, apellido_pat, apellido_mat, profesion)
VALUES ('104', 'Cecilia', 'Hinojosa', 'Lopez', 'Ingeniero Quimica');

INSERT INTO docente (codigo_doc, nombre_doc, apellido_pat, apellido_mat, profesion)
VALUES ('105', 'Roger', 'Hinojosa', 'Romero', 'Ingeniero Sistemas');

--
-- Data for table public.doc_mat (OID = 24585) (LIMIT 0,12)
--
INSERT INTO doc_mat (codigo_mat, codigo_doc, grupo)
VALUES ('10', '100', 1);

INSERT INTO doc_mat (codigo_mat, codigo_doc, grupo)
VALUES ('11', '100', 2);

INSERT INTO doc_mat (codigo_mat, codigo_doc, grupo)
VALUES ('11', '105', 3);

INSERT INTO doc_mat (codigo_mat, codigo_doc, grupo)
VALUES ('18', '101', 1);

INSERT INTO doc_mat (codigo_mat, codigo_doc, grupo)
VALUES ('19', '101', 2);

INSERT INTO doc_mat (codigo_mat, codigo_doc, grupo)
VALUES ('19', '103', 3);

INSERT INTO doc_mat (codigo_mat, codigo_doc, grupo)
VALUES ('30', '104', 4);

INSERT INTO doc_mat (codigo_mat, codigo_doc, grupo)
VALUES ('23', '105', 1);

INSERT INTO doc_mat (codigo_mat, codigo_doc, grupo)
VALUES ('24', '105', 2);

INSERT INTO doc_mat (codigo_mat, codigo_doc, grupo)
VALUES ('51', '101', 3);

INSERT INTO doc_mat (codigo_mat, codigo_doc, grupo)
VALUES ('52', '101', 4);

INSERT INTO doc_mat (codigo_mat, codigo_doc, grupo)
VALUES ('53', '101', 2);

--
-- Data for table public.horario (OID = 24588) (LIMIT 0,7)
--
INSERT INTO horario (id_horario, fecha_inicio, horario_inicio, horario_salida, turno_hor)
VALUES (4, '2010-02-01', '12:15:00', '15:45:00', 'tarde');

INSERT INTO horario (id_horario, fecha_inicio, horario_inicio, horario_salida, turno_hor)
VALUES (5, '2010-02-01', '15:45:00', '16:00:00', 'tarde');

INSERT INTO horario (id_horario, fecha_inicio, horario_inicio, horario_salida, turno_hor)
VALUES (6, '2010-02-01', '20:15:00', '21:45:00', 'noche');

INSERT INTO horario (id_horario, fecha_inicio, horario_inicio, horario_salida, turno_hor)
VALUES (3, '2010-02-01', '16:45:00', '20:15:00', 'noche');

INSERT INTO horario (id_horario, fecha_inicio, horario_inicio, horario_salida, turno_hor)
VALUES (8, '2010-02-01', '14:00:00', '17:00:00', 'tarde');

INSERT INTO horario (id_horario, fecha_inicio, horario_inicio, horario_salida, turno_hor)
VALUES (2, '2010-02-01', '14:00:00', '16:00:00', 'ma?ana');

INSERT INTO horario (id_horario, fecha_inicio, horario_inicio, horario_salida, turno_hor)
VALUES (1, '2010-09-06', '15:00:00', '17:00:00', 'ma?ana');

--
-- Data for table public.hora_mat_aula (OID = 24591) (LIMIT 0,6)
--
INSERT INTO hora_mat_aula (id_horario, id_dia, codigo_mat, id_aula)
VALUES (2, 1, '10', 652);

INSERT INTO hora_mat_aula (id_horario, id_dia, codigo_mat, id_aula)
VALUES (3, 2, '11', 690);

INSERT INTO hora_mat_aula (id_horario, id_dia, codigo_mat, id_aula)
VALUES (6, 3, '18', 691);

INSERT INTO hora_mat_aula (id_horario, id_dia, codigo_mat, id_aula)
VALUES (1, 4, '19', 692);

INSERT INTO hora_mat_aula (id_horario, id_dia, codigo_mat, id_aula)
VALUES (4, 5, '30', 693);

INSERT INTO hora_mat_aula (id_horario, id_dia, codigo_mat, id_aula)
VALUES (5, 6, '51', 617);

--
-- Data for table public.materia (OID = 24594) (LIMIT 0,10)
--
INSERT INTO materia (codigo_mat, nombre_mat, nivel)
VALUES ('10', 'Dibujo Tecnico', 'C');

INSERT INTO materia (codigo_mat, nombre_mat, nivel)
VALUES ('11', 'Redes', 'D');

INSERT INTO materia (codigo_mat, nombre_mat, nivel)
VALUES ('18', 'OperativaI', 'C');

INSERT INTO materia (codigo_mat, nombre_mat, nivel)
VALUES ('19', 'OperativaII', 'D');

INSERT INTO materia (codigo_mat, nombre_mat, nivel)
VALUES ('30', 'Quimica Basica', 'A');

INSERT INTO materia (codigo_mat, nombre_mat, nivel)
VALUES ('51', 'Fisica I', 'A');

INSERT INTO materia (codigo_mat, nombre_mat, nivel)
VALUES ('52', 'Fisica II', 'B');

INSERT INTO materia (codigo_mat, nombre_mat, nivel)
VALUES ('53', 'Fisica III', 'C');

INSERT INTO materia (codigo_mat, nombre_mat, nivel)
VALUES ('23', 'Programacion', 'A');

INSERT INTO materia (codigo_mat, nombre_mat, nivel)
VALUES ('24', 'Elementos', 'B');

--
-- Definition for index aula_pk (OID = 24597) : 
--
CREATE UNIQUE INDEX aula_pk ON aula USING btree (id_aula);
--
-- Definition for index dia_pk (OID = 24598) : 
--
CREATE UNIQUE INDEX dia_pk ON dia USING btree (id_dia);
--
-- Definition for index docente_pk (OID = 24599) : 
--
CREATE UNIQUE INDEX docente_pk ON docente USING btree (codigo_doc);
--
-- Definition for index r2_fk (OID = 24600) : 
--
CREATE INDEX r2_fk ON doc_mat USING btree (codigo_mat);
--
-- Definition for index r1_fk (OID = 24601) : 
--
CREATE INDEX r1_fk ON doc_mat USING btree (codigo_doc);
--
-- Definition for index horario_pk (OID = 24602) : 
--
CREATE UNIQUE INDEX horario_pk ON horario USING btree (id_horario);
--
-- Definition for index r3_fk (OID = 24603) : 
--
CREATE INDEX r3_fk ON hora_mat_aula USING btree (codigo_mat);
--
-- Definition for index r4_fk (OID = 24604) : 
--
CREATE INDEX r4_fk ON hora_mat_aula USING btree (id_horario);
--
-- Definition for index r5_fk (OID = 24605) : 
--
CREATE INDEX r5_fk ON hora_mat_aula USING btree (id_dia);
--
-- Definition for index r6_fk (OID = 24606) : 
--
CREATE INDEX r6_fk ON hora_mat_aula USING btree (id_aula);
--
-- Definition for index materia_pk (OID = 24607) : 
--
CREATE UNIQUE INDEX materia_pk ON materia USING btree (codigo_mat);
--
-- Definition for index pk_aula (OID = 24608) : 
--
ALTER TABLE ONLY aula
    ADD CONSTRAINT pk_aula PRIMARY KEY (id_aula);
--
-- Definition for index pk_dia (OID = 24610) : 
--
ALTER TABLE ONLY dia
    ADD CONSTRAINT pk_dia PRIMARY KEY (id_dia);
--
-- Definition for index pk_docente (OID = 24612) : 
--
ALTER TABLE ONLY docente
    ADD CONSTRAINT pk_docente PRIMARY KEY (codigo_doc);
--
-- Definition for index pk_horario (OID = 24614) : 
--
ALTER TABLE ONLY horario
    ADD CONSTRAINT pk_horario PRIMARY KEY (id_horario);
--
-- Definition for index pk_hora_mat_aula (OID = 24616) : 
--
ALTER TABLE ONLY hora_mat_aula
    ADD CONSTRAINT pk_hora_mat_aula PRIMARY KEY (id_horario);
--
-- Definition for index pk_materia (OID = 24618) : 
--
ALTER TABLE ONLY materia
    ADD CONSTRAINT pk_materia PRIMARY KEY (codigo_mat);
--
-- Definition for index fk_doc_mat_r1_docente (OID = 24620) : 
--
ALTER TABLE ONLY doc_mat
    ADD CONSTRAINT fk_doc_mat_r1_docente FOREIGN KEY (codigo_doc) REFERENCES docente(codigo_doc) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_doc_mat_r2_materia (OID = 24625) : 
--
ALTER TABLE ONLY doc_mat
    ADD CONSTRAINT fk_doc_mat_r2_materia FOREIGN KEY (codigo_mat) REFERENCES materia(codigo_mat) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_hora_mat_r3_materia (OID = 24630) : 
--
ALTER TABLE ONLY hora_mat_aula
    ADD CONSTRAINT fk_hora_mat_r3_materia FOREIGN KEY (codigo_mat) REFERENCES materia(codigo_mat) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_hora_mat_r4_horario (OID = 24635) : 
--
ALTER TABLE ONLY hora_mat_aula
    ADD CONSTRAINT fk_hora_mat_r4_horario FOREIGN KEY (id_horario) REFERENCES horario(id_horario) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_hora_mat_r5_dia (OID = 24640) : 
--
ALTER TABLE ONLY hora_mat_aula
    ADD CONSTRAINT fk_hora_mat_r5_dia FOREIGN KEY (id_dia) REFERENCES dia(id_dia) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_hora_mat_r6_aula (OID = 24645) : 
--
ALTER TABLE ONLY hora_mat_aula
    ADD CONSTRAINT fk_hora_mat_r6_aula FOREIGN KEY (id_aula) REFERENCES aula(id_aula) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
