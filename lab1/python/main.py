import tkinter as tk
from tkinter import ttk
from tkinter import messagebox
from datos import obtener_datos
from graficador import graficar_datos


def generar_grafica():
    tabla = combo_tabla.get()
    columnas_seleccionadas = [var.get() for var in variables if var.get()]

    if tabla and columnas_seleccionadas:
        df = obtener_datos(tabla)
        if 'months' in columnas_seleccionadas:
            messagebox.showwarning("Advertencia", "'months' no puede ser seleccionado para graficar.")
        else:
            graficar_datos(df, columnas_seleccionadas, f"Comportamiento del sistema en {tabla}", figura_canvas)
    else:
        messagebox.showwarning("Advertencia", "Por favor, selecciona una tabla y al menos una columna.")


def cargar_columnas(event):
    tabla = combo_tabla.get()
    if tabla:
        df = obtener_datos(tabla)
        columnas = [col for col in df.columns if col != 'months']

        # Limpia los checkboxes anteriores
        for widget in frame_checkboxes.winfo_children():
            widget.destroy()

        # Crea un checkbox para cada columna
        global variables
        variables = []
        for col in columnas:
            var = tk.StringVar(value=col)
            chk = tk.Checkbutton(frame_checkboxes, text=col, variable=var, onvalue=col, offvalue="")
            chk.pack(anchor="w")
            variables.append(var)


# Crear la ventana principal
ventana = tk.Tk()
ventana.title("Visualizador de Datos")

# Etiqueta y combo para seleccionar la tabla
label_tabla = tk.Label(ventana, text="Selecciona una tabla:")
label_tabla.pack(pady=5)

combo_tabla = ttk.Combobox(ventana, values=[
    "sector_vehicular", "areas_verdes", "capacidad_hospitalaria",
    "contaminacion_lima", "desechos_urbanos", "hombres_enfermos",
    "mujeres_enfermas", "ninos_enfermos", "personas_enfermas",
    "poblacion_hombres", "poblacion_mujeres", "poblacion_lima",
    "sector_industrial"
])
combo_tabla.pack(pady=5)
combo_tabla.bind("<<ComboboxSelected>>", cargar_columnas)

# Frame para los checkboxes de columnas
frame_checkboxes = tk.Frame(ventana)
frame_checkboxes.pack(pady=5, fill='both', expand=True)

# Botón para generar la gráfica
boton_graficar = tk.Button(ventana, text="Ver comportamiento", command=generar_grafica)
boton_graficar.pack(pady=20)

# Frame para el gráfico
figura_canvas = tk.Frame(ventana)
figura_canvas.pack(fill='both', expand=True)
# Ejecutar la interfaz
ventana.mainloop()
