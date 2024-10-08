import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg


def graficar_datos(df, columnas, titulo, figura_canvas):
    fig, ax = plt.subplots()

    for columna in columnas:
        ax.plot(df['years'], df[columna], marker='o', linewidth=1,
                label=columna)

    ax.set_xlabel('years')
    ax.set_ylabel('Values')
    ax.set_title(titulo)
    ax.legend()

    # Borra el gráfico actual en el canvas
    for widget in figura_canvas.winfo_children():
        widget.destroy()

    # Inserta el nuevo gráfico en el canvas
    canvas = FigureCanvasTkAgg(fig, master=figura_canvas)
    canvas.draw()
    canvas.get_tk_widget().pack(fill='both', expand=True)
