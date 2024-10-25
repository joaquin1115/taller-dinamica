import sqlite3

def conectar_bd():
    conexion = sqlite3.connect("taller_bd.db")  # Crea o abre la base de datos local
    return conexion
