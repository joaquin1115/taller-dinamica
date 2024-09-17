import matplotlib.pyplot as plt

def graficar(x, y, xlabel, ylabel, title):
    """Crea y muestra un gráfico."""
    plt.figure(figsize=(10, 5))
    plt.plot(x, y, marker='o', linestyle='-', color='b')
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.title(title)
    plt.grid(True)
    plt.tight_layout()
    plt.show()
