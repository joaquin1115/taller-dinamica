USE taller_bd;

SET sql_mode = "";

DROP TABLE IF EXISTS sector_industrial;
DROP TABLE IF EXISTS poblacion_lima;
DROP TABLE IF EXISTS poblacion_mujeres;
DROP TABLE IF EXISTS poblacion_hombres;
DROP TABLE IF EXISTS personas_enfermas;
DROP TABLE IF EXISTS ninos_enfermos;
DROP TABLE IF EXISTS mujeres_enfermas;
DROP TABLE IF EXISTS hombres_enfermos;
DROP TABLE IF EXISTS desechos_urbanos;
DROP TABLE IF EXISTS contaminacion_lima;
DROP TABLE IF EXISTS capacidad_hospitalaria;
DROP TABLE IF EXISTS areas_verdes;
DROP TABLE IF EXISTS sector_vehicular;

-- Habilitar la carga de archivos desde el sistema
SET GLOBAL local_infile = 1;

-- Crear tabla sector_vehicular
CREATE TABLE sector_vehicular (
    months FLOAT PRIMARY KEY,
    vehiculos_combustible_fosil FLOAT,
    vehiculos_gnv FLOAT
);

-- Crear tabla areas_verdes
CREATE TABLE areas_verdes (
    months FLOAT PRIMARY KEY,
    areas_verdes_total FLOAT,
    areas_verdes_cultivadas FLOAT,
    areas_verdes_deforestadas FLOAT
);

-- Crear tabla capacidad_hospitalaria
CREATE TABLE capacidad_hospitalaria (
    months FLOAT PRIMARY KEY,
    capacidad_total FLOAT,
    camas_fuera_de_servicio FLOAT,
    nuevas_camas FLOAT
);

-- Crear tabla contaminacion_lima
CREATE TABLE contaminacion_lima (
    months FLOAT PRIMARY KEY,
    toneladas_pm10 FLOAT,
    incremento_pm10 FLOAT,
    disminucion_pm10 FLOAT
);

-- Crear tabla desechos_urbanos
CREATE TABLE desechos_urbanos (
    months FLOAT PRIMARY KEY,
    desechos_total FLOAT,
    desechos_generados FLOAT,
    desechos_reciclados FLOAT
);

-- Crear tabla hombres_enfermos
CREATE TABLE hombres_enfermos (
    months FLOAT PRIMARY KEY,
    hombres_enfermos_total FLOAT,
    hombres_curados FLOAT,
    hombres_fallecidos FLOAT
);

-- Crear tabla mujeres_enfermas
CREATE TABLE mujeres_enfermas (
    months FLOAT PRIMARY KEY,
    mujeres_enfermas_total FLOAT,
    mujeres_curadas FLOAT,
    mujeres_fallecidas FLOAT
);

-- Crear tabla niños_enfermos
CREATE TABLE ninos_enfermos (
    months FLOAT PRIMARY KEY,
    ninos_enfermos_total FLOAT,
    ninos_curados FLOAT,
    ninos_fallecidos FLOAT
);

-- Crear tabla personas_enfermas
CREATE TABLE personas_enfermas (
    months FLOAT PRIMARY KEY,
    personas_enfermas_total FLOAT,
    personas_fallecidas FLOAT,
    personas_curadas FLOAT
);

-- Crear tabla poblacion_hombres
CREATE TABLE poblacion_hombres (
    months FLOAT PRIMARY KEY,
    hombres_total FLOAT,
    defunciones_hombres FLOAT,
    emigracion_hombres FLOAT,
    nacimientos_hombres FLOAT,
    inmigracion_hombres FLOAT
);

-- Crear tabla poblacion_mujeres
CREATE TABLE poblacion_mujeres (
    months FLOAT PRIMARY KEY,
    mujeres_total FLOAT,
    defunciones_mujeres FLOAT,
    emigracion_mujeres FLOAT,
    nacimientos_mujeres FLOAT,
    inmigracion_mujeres FLOAT
);

-- Crear tabla poblacion_lima
CREATE TABLE poblacion_lima (
    months FLOAT PRIMARY KEY,
    poblacion_total FLOAT,
    inmigrantes FLOAT,
    defunciones FLOAT,
    emigrantes FLOAT,
    nacimientos FLOAT
);

-- Crear tabla sector_industrial
CREATE TABLE sector_industrial (
    months FLOAT PRIMARY KEY,
    emision_total_pm10 FLOAT
);

-- Poblar tabla sector_vehicular
LOAD DATA INFILE '/var/lib/mysql-files/sector_vehicular.csv'
INTO TABLE sector_vehicular
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(months, vehiculos_combustible_fosil, vehiculos_gnv);

-- Poblar tabla areas_verdes
LOAD DATA INFILE '/var/lib/mysql-files/areas_verdes.csv'
INTO TABLE areas_verdes
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(months, areas_verdes_total, areas_verdes_cultivadas, areas_verdes_deforestadas);

-- Poblar tabla capacidad_hospitalaria
LOAD DATA INFILE '/var/lib/mysql-files/capacidad_hospitalaria.csv'
INTO TABLE capacidad_hospitalaria
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(months, capacidad_total, camas_fuera_de_servicio, nuevas_camas);

-- Poblar tabla contaminacion_lima
LOAD DATA INFILE '/var/lib/mysql-files/contaminacion_lima.csv'
INTO TABLE contaminacion_lima
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(months, toneladas_pm10, incremento_pm10, disminucion_pm10);

-- Poblar tabla desechos_urbanos
LOAD DATA INFILE '/var/lib/mysql-files/desechos_urbanos.csv'
INTO TABLE desechos_urbanos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(months, desechos_total, desechos_generados, desechos_reciclados);

-- Poblar tabla hombres_enfermos
LOAD DATA INFILE '/var/lib/mysql-files/hombres_enfermos.csv'
INTO TABLE hombres_enfermos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(months, hombres_enfermos_total, hombres_curados, hombres_fallecidos);

-- Poblar tabla mujeres_enfermas
LOAD DATA INFILE '/var/lib/mysql-files/mujeres_enfermas.csv'
INTO TABLE mujeres_enfermas
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(months, mujeres_enfermas_total, mujeres_curadas, mujeres_fallecidas);

-- Poblar tabla ninos_enfermos
LOAD DATA INFILE '/var/lib/mysql-files/niños_enfermos.csv'
INTO TABLE ninos_enfermos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(months, ninos_enfermos_total, ninos_curados, ninos_fallecidos);

-- Poblar tabla personas_enfermas
LOAD DATA INFILE '/var/lib/mysql-files/personas_enfermas.csv'
INTO TABLE personas_enfermas
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(months, personas_enfermas_total, personas_fallecidas, personas_curadas);

-- Poblar tabla poblacion_hombres
LOAD DATA INFILE '/var/lib/mysql-files/poblacion_hombres.csv'
INTO TABLE poblacion_hombres
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(months, hombres_total, defunciones_hombres, emigracion_hombres, nacimientos_hombres, inmigracion_hombres);

-- Poblar tabla poblacion_mujeres
LOAD DATA INFILE '/var/lib/mysql-files/poblacion_mujeres.csv'
INTO TABLE poblacion_mujeres
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(months, mujeres_total, defunciones_mujeres, emigracion_mujeres, nacimientos_mujeres, inmigracion_mujeres);

-- Poblar tabla poblacion_lima
LOAD DATA INFILE '/var/lib/mysql-files/poblacion_lima.csv'
INTO TABLE poblacion_lima
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(months, poblacion_total, inmigrantes, defunciones, emigrantes, nacimientos);

-- Poblar tabla sector_industrial
LOAD DATA INFILE '/var/lib/mysql-files/sector_industrial.csv'
INTO TABLE sector_industrial
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(months, emision_total_pm10);
