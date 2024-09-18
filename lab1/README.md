# Guía de uso

## Exportar datos de Stella a csv
Usar la función de Stella `Exportar datos` para exportar los datos de las tablas a formato `.xls`, para posteriormente guardarlos con extensión `.csv` desde Microsoft Excel. Para fines de demostración, en la carpeta [`csvs`](/lab1/csvs/) se incluyen los archivos `.csv` generados a partir de una simulación, con los cuales se pueden realizar los siguientes pasos.

## Iniciar MySQL en Docker

Para ejecutar estos pasos es necesario instalar Docker previamente.

### 1. Iniciar contenedor MySQL

```bash
docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=root_password -e MYSQL_DATABASE=taller_bd -e MYSQL_USER=usuario -e MYSQL_PASSWORD=password -p 3306:3306 -d mysql:latest
```

Este comando:
- Crea un contenedor llamado `mysql-container`
- Establece la contraseña de root
- Crea una base de datos llamada `taller_bd`
- Crea un usuario con su contraseña
- Mapea el puerto 3306 del contenedor al 3306 del host

### 2. Copiar archivo CSV al contenedor

```bash
docker cp -a /ruta/local/de/csvs/. mysql-container:/var/lib/mysql-files/
```

Reemplaza `/ruta/local/de/csvs/` con la ruta de tu directorio local donde se encuentran los archivos CSV.

### 3. Iniciar phpMyAdmin

```bash
docker run --name phpmyadmin -d --link mysql-container:db -p 8080:80 phpmyadmin/phpmyadmin
```

Este comando inicia phpMyAdmin y lo vincula con el contenedor MySQL.

### 4. Acceder a phpMyAdmin

1. Abre tu navegador web
2. Visita `http://localhost:8080`
3. Inicia sesión con las credenciales:
   - Usuario: `root`
   - Contraseña: `root_password`

### 5. Crear y poblar las tablas
En phpMyAdmin, ir a `SQL` de la cinta de opciones en la parte superior. Pegar el [script](/lab1/bd-mysql/script.sql) para la creación y poblamiento de tablas. Hacer clic en el botón `Continuar` para ejecutar.

## Instalar paquetes y ejecutar main.py

Para ejecutar estos pasos es necesario tener Python instalado en tu sistema.

### 1. Instalar paquetes necesarios

Abre una terminal o línea de comandos y ejecuta el siguiente comando para instalar los paquetes requeridos:

```bash
pip install matplotlib pandas pymysql PyMySQL[rsa]
```

Este comando instalará:
- matplotlib: para crear gráficos y visualizaciones
- pandas: para manipulación y análisis de datos
- pymysql: para conectar con bases de datos MySQL

### 2. Ejecutar main.py

Navegar al directorio del proyecto. Una vez en el directorio correcto, ejecuta el archivo [`main.py`](/lab1/python/main.py).

### Notas adicionales

- Asegúrate de tener Python instalado en tu sistema.
- Si estás usando un entorno virtual, actívalo antes de instalar los paquetes y ejecutar el script.
- Si encuentras errores relacionados con la importación de módulos, verifica que los paquetes se hayan instalado correctamente.
- Dependiendo de tu configuración, podrías necesitar usar `pip3` en lugar de `pip` para instalar los paquetes.
