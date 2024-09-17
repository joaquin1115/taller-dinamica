import mysql.connector

def connect_to_db():
    """Conecta a la base de datos MySQL."""
    try:
        conn = mysql.connector.connect(
            host="localhost",
            user="usuario",
            password="password",
            database="taller_db"
        )
        return conn
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None

def get_data_from_db(query):
    """Obtiene los datos de la base de datos según la consulta."""
    conn = connect_to_db()
    if conn:
        cursor = conn.cursor()
        cursor.execute(query)
        result = cursor.fetchall()
        conn.close()
        return result
    return None
