# Guía de uso

## Exportar datos de Stella a csv
Usar la función de Stella `Exportar datos` para exportar los datos de las tablas a formato `.xls`, para posteriormente guardarlos con extensión `.csv` desde Microsoft Excel. Para fines de demostración, en la carpeta [`csvs`](/lab2/csvs/) se incluyen los archivos `.csv` generados a partir de una simulación, con los cuales se pueden realizar los siguientes pasos.

## Instalar paquetes y ejecutar main.py

Para ejecutar estos pasos es necesario tener Python instalado en su sistema.

### 1. Instalar paquetes necesarios

Abra una terminal o línea de comandos y ejecute el siguiente comando para instalar los paquetes requeridos:

```bash
pip install matplotlib pandas
```

Este comando instalará:
- matplotlib: para crear gráficos y visualizaciones
- pandas: para manipulación y análisis de datos

### 2. Modificar ruta local de ubicación de archivos csv

Navegar al directorio del proyecto. Una vez en el directorio correcto, abrir el archivo [`main.py`](/lab2/python/main.py) en un editor de texto o editor de código fuente de su preferencia, y ubicar las siguientes líneas:

```python
#INGRESAR DIRECCION LOCAL DE CSVS
direccion_local_de_csvs = "/Users/Joaquín/Documents/Github/taller-dinamica/lab2/csvs/"
```

Reemplace el valor asignado a la variable `direccion_local_de_csvs` con la ruta de su directorio local donde se encuentran los archivos CSV.


### 3. Ejecutar main.py

Ejecute el archivo [`main.py`](/lab2/python/main.py) mencionado anteriormente.

### Notas adicionales

- Asegúrese de tener Python instalado en tu sistema.
- Si está usando un entorno virtual, actívelo antes de instalar los paquetes y ejecutar el script.
- Si encuentra errores relacionados con la importación de módulos, verifique que los paquetes se hayan instalado correctamente.
- Dependiendo de su configuración, podría necesitar usar `pip3` en lugar de `pip` para instalar los paquetes.
