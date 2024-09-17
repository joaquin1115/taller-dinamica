import pymysql

def conectar_bd():
    conexion = pymysql.connect(
        host="localhost",
        user="usuario",
        password="password",
        database="taller_bd"
    )
    return conexion
