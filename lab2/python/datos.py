import pandas as pd
from conexion import conectar_bd

def obtener_datos(tabla):
    conexion = conectar_bd()
    consulta = f"SELECT * FROM {tabla}"
    df = pd.read_sql(consulta, conexion)
    conexion.close()
    return df

def importar_csv_a_sqlite(archivo_csv, tabla, columnas):
    # Lee el CSV
    df = pd.read_csv(archivo_csv)

    # Renombrar columnas según el diccionario proporcionado
    df.columns = columnas

    # Conectar a la base de datos
    conexion = conectar_bd()

    # Insertar el DataFrame corregido en la base de datos SQLite
    df.to_sql(tabla, conexion, if_exists='replace', index=False)

    # Cerrar la conexión
    conexion.close()

def importar_datos(direccion_local_de_csvs):
    diccionario_datos = {
        "aumentoanimales.csv": {
            "tabla": "aumento_animales",
            "columnas": ["years", "disponibilidad_alimento", "tasa_reproduccion", "disponibilidad_refugio"]
        },
        "biomasa.csv": {
            "tabla": "biomasa",
            "columnas": ["years", "tasa_crecimiento_total", "biomasa_total_bosque"]
        },
        "disminucionbiomasa.csv": {
            "tabla": "disminucion_biomasa",
            "columnas": ["years", "disminucion_biomasa", "tasa_disminucion_total"]
        },
        "poblacionbosques.csv": {
            "tabla": "poblacion_bosques",
            "columnas": ["years", "animales", "proporcion_aves", "proporcion_terrestres"]
        },
        "quema.csv": {
            "tabla": "quema",
            "columnas": ["years", "frecuencia_quemas", "severidad_quema"]
        }
    }
    for key in diccionario_datos.keys():
        archivo_csv = direccion_local_de_csvs + key
        tabla = diccionario_datos[key]["tabla"]
        columnas = diccionario_datos[key]["columnas"]
        importar_csv_a_sqlite(archivo_csv, tabla, columnas)

