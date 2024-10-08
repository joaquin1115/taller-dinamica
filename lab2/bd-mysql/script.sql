USE taller_bd;

SET sql_mode = "";

-- Eliminar tablas si existen
DROP TABLE IF EXISTS aumento_animales;
DROP TABLE IF EXISTS biomasa;
DROP TABLE IF EXISTS disminucion_biomasa;
DROP TABLE IF EXISTS poblacion_bosques;
DROP TABLE IF EXISTS quema;

-- Habilitar la carga de archivos desde el sistema
SET GLOBAL local_infile = 1;

-- Crear tabla aumento_animales
CREATE TABLE aumento_animales (
    years FLOAT PRIMARY KEY,
    disponibilidad_alimento FLOAT,
    tasa_reproduccion FLOAT,
    disponibilidad_refugio FLOAT
);

-- Crear tabla biomasa
CREATE TABLE biomasa (
    years FLOAT PRIMARY KEY,
    tasa_crecimiento_total FLOAT,
    biomasa_total_bosque FLOAT
);

-- Crear tabla disminucion_biomasa
CREATE TABLE disminucion_biomasa (
    years FLOAT PRIMARY KEY,
    disminucion_biomasa FLOAT,
    tasa_disminucion_total FLOAT
);

-- Crear tabla poblacion_bosques
CREATE TABLE poblacion_bosques (
    years FLOAT PRIMARY KEY,
    animales FLOAT,
    proporcion_aves FLOAT,
    proporcion_terrestres FLOAT
);

-- Crear tabla quema
CREATE TABLE quema (
    years FLOAT PRIMARY KEY,
    frecuencia_quemas FLOAT,
    severidad_quema FLOAT
);

-- Poblar tabla aumento_animales
LOAD DATA INFILE '/var/lib/mysql-files/aumentoanimales.csv'
INTO TABLE aumento_animales
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(years, disponibilidad_alimento, tasa_reproduccion, disponibilidad_refugio);

-- Poblar tabla biomasa
LOAD DATA INFILE '/var/lib/mysql-files/biomasa.csv'
INTO TABLE biomasa
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(years, tasa_crecimiento_total, biomasa_total_bosque);

-- Poblar tabla disminucion_biomasa
LOAD DATA INFILE '/var/lib/mysql-files/disminucionbiomasa.csv'
INTO TABLE disminucion_biomasa
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(years, disminucion_biomasa, tasa_disminucion_total);

-- Poblar tabla poblacion_bosques
LOAD DATA INFILE '/var/lib/mysql-files/poblacionbosques.csv'
INTO TABLE poblacion_bosques
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(years, animales, proporcion_aves, proporcion_terrestres);

-- Poblar tabla quema
LOAD DATA INFILE '/var/lib/mysql-files/quema.csv'
INTO TABLE quema
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(years, frecuencia_quemas, severidad_quema);
