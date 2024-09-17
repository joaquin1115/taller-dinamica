import tkinter as tk
from tkinter import ttk
from conexion_bd import get_data_from_db
from graficos import graficar

# Definir las variables de la base de datos
VARIABLES = [
    "areas_verdes",
    "areas_verdes_cultivadas",
    "areas_verdes_deforestadas",
    "produccion_zinc",
    "cantidad_desechos_domesticos",
    "emision_total_pm10",
    # Puedes agregar más variables aquí...
]

def get_variable_data(variable):
    """Obtiene los datos de la base de datos según la variable seleccionada."""
    query = f"SELECT months, {variable} FROM contaminacion_pm10_lima ORDER BY months"
    data = get_data_from_db(query)
    if data:
        months = [row[0] for row in data]
        values = [row[1] for row in data]
        return months, values
    return None, None

def plot_selected_variable(variable):
    """Llama a la función para graficar la variable seleccionada."""
    months, values = get_variable_data(variable)
    if months and values:
        graficar(months, values, "Mes", variable.replace('_', ' ').capitalize(), f"Evolución de {variable.replace('_', ' ').capitalize()} por Mes")
    else:
        print(f"No se pudieron obtener datos para la variable: {variable}")

def create_interface():
    """Crea la interfaz gráfica del usuario."""
    root = tk.Tk()
    root.title("Gráficos de Contaminación por PM10 en Lima")

    # Etiqueta
    label = ttk.Label(root, text="Seleccione la variable para graficar:")
    label.pack(pady=10)

    # Combobox para seleccionar la variable
    variable_selector = ttk.Combobox(root, values=VARIABLES, state="readonly")
    variable_selector.pack(pady=5)

    # Botón para graficar
    plot_button = ttk.Button(root, text="Graficar",
                             command=lambda: plot_selected_variable(variable_selector.get()))
    plot_button.pack(pady=10)

    # Ejecutar la interfaz
    root.mainloop()

if __name__ == "__main__":
    create_interface()
