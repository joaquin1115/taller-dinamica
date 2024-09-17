# Guía Rápida: MySQL en Docker

## 1. Iniciar contenedor MySQL

```bash
docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=root_password -e MYSQL_DATABASE=taller_bd -e MYSQL_USER=usuario -e MYSQL_PASSWORD=password -p 3306:3306 -d mysql:latest
```

Este comando:
- Crea un contenedor llamado `mysql-container`
- Establece la contraseña de root
- Crea una base de datos llamada `taller_bd`
- Crea un usuario con su contraseña
- Mapea el puerto 3306 del contenedor al 3306 del host

## 2. Iniciar phpMyAdmin

```bash
docker run --name phpmyadmin -d --link mysql-container:db -p 8080:80 phpmyadmin/phpmyadmin
```

Este comando inicia phpMyAdmin y lo vincula con el contenedor MySQL.

## 3. Acceder a phpMyAdmin

1. Abre tu navegador web
2. Visita `http://localhost:8080`
3. Inicia sesión con las credenciales:
   - Usuario: `root`
   - Contraseña: `root_password`

## 4. Copiar archivo CSV al contenedor

```bash
docker cp -a /ruta/local/de/csvs/. mysql-container:/var/lib/mysql-files/
```

Reemplaza `/ruta/local/` con la ruta de tu directorio local donde se encuentra el archivo CSV.

## Notas adicionales

- Asegúrate de tener Docker instalado y en ejecución antes de usar estos comandos.
- Puedes personalizar las contraseñas y nombres de usuario según tus necesidades.
- El archivo CSV copiado estará disponible en el contenedor para importarlo a tu base de datos.
