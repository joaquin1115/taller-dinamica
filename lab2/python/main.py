import tkinter as tk
from tkinter import ttk
from tkinter import messagebox
from datos import obtener_datos
from graficador import graficar_datos
from PIL import ImageTk, Image

def generar_grafica():
    tabla = combo_tabla.get()
    columnas_seleccionadas = [var.get() for var in variables if var.get()]

    if tabla and columnas_seleccionadas:
        df = obtener_datos(tabla)
        if 'years' in columnas_seleccionadas:
            messagebox.showwarning("Advertencia", "'years' no puede ser seleccionado para graficar.")
        else:
            graficar_datos(df, columnas_seleccionadas, f"Comportamiento del sistema en {tabla}", figura_canvas)
    else:
        messagebox.showwarning("Advertencia", "Por favor, selecciona una tabla y al menos una columna.")


def cargar_columnas(event):
    tabla = combo_tabla.get()
    if tabla:
        df = obtener_datos(tabla)
        columnas = [col for col in df.columns if col != 'years']

        # Limpia los checkboxes anteriores
        for widget in frame_checkboxes.winfo_children():
            widget.destroy()

        # Crea un checkbox para cada columna
        global variables
        variables = []
        for col in columnas:
            var = tk.StringVar(value=col)
            chk = tk.Checkbutton(frame_checkboxes, text=col,font=("Rockwell",11), variable=var, onvalue=col, offvalue="")
            chk.pack(anchor="w")
            variables.append(var)


# Crear la ventana principal
ventana = tk.Tk()
ventana.geometry("1600x800")
ventana.title("Modelo Dinámico")
ventana.title("Visualizador de Datos")
label_titulo = tk.Label(ventana, text= "Modelo de Simulación dinámica",font = ("Rockwell",15))
label_titulo.grid(row=0,sticky="we")
# Etiqueta y combo para seleccionar la tabla

image = Image.open("diseño/selecciona_una_tabla.png")
image = image.resize((200, 35), Image.LANCZOS)
foto2 = ImageTk.PhotoImage(image)

label_tabla = tk.Label(ventana, text="Selecciona una tabla:",font = ("Rockwell",12),image=foto2,compound="center")
label_tabla.grid(row=1,column=0)

image = Image.open("diseño/boton_seleccionar.png")
image = image.resize((200, 35), Image.LANCZOS)
foto = ImageTk.PhotoImage(image)

combo_tabla = ttk.Combobox(ventana, values=[
    "aumento_animales", "biomasa", "disminucion_biomasa",
    "poblacion_bosques", "quema"
],font=("Rockwell",15),)
combo_tabla.grid(row=1,column=1)
combo_tabla.bind("<<ComboboxSelected>>", cargar_columnas)

# Frame para los checkboxes de columnas
frame_checkboxes = tk.Frame(ventana)
frame_checkboxes.grid(row=2,column=1)

# Botón para generar la gráfica
boton_graficar = tk.Button(ventana, text="Ver comportamiento", command=generar_grafica,image=foto, compound="center",font=("Rockwell",12),borderwidth=0)
boton_graficar.grid(row=3,sticky="we")

# Frame para el gráfico
figura_canvas = tk.Frame(ventana)
figura_canvas.grid(row=4,columnspan= 2,sticky="nsew")

# Ejecutar la interfaz
ventana.mainloop()
