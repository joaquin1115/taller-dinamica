import pandas as pd
from conexion import conectar_bd

def obtener_datos(tabla):
    conexion = conectar_bd()
    consulta = f"SELECT * FROM {tabla}"
    df = pd.read_sql(consulta, conexion)
    conexion.close()
    return df
