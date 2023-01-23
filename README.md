# Módulo 2 - Contenedores Docker - Ejercicio Lemoncode challenge




## Tabla de pasos básicos para completar el ejercicio Nº1
- Crear y escribir los respectivos Dockerfiles del frontend y backend
- Descargar la imagen de mongo y correrla con el volumen correspondiente puesto, más las variables de entorno pertinentes como el usuario y contraseña
- Modificar el codigo del backend para que tenga el enlace a mongo que creastes
- añadir al dockerfile ENV ASPNETCORE_URLS=http://+:5000 para que desde el frontend se pueda conectar a topics-api:500
- hacer el docker build con el tag backend
- Se modifica la const LOCAL del fichero server en el frontend y se le pone la direccion que se le dice de http://topics-api:5000/api/topics para que se pueda conectar al backend creado despues.
- Crear la red de lemoncode-challenge con el tipo por defecto=bridge
- Se hace los docker runs de cada fichero empezando por mongo>backend>frontend poniendo por supuesto el --name que coincida con las URLs que se tiene que conectar cada contenedor.
  



## Comados utilizados

### Comandos usados

- Crear network:

  * docker network create lemoncode-challenge

- Para correr mongo:

  * docker run -d --network lemoncode-challenge --name some-mongo -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=secret -v mongo-volume-lemon:/data/db mongo

- Frontend:

  * docker run -dit --name frontend  --network lemoncode-challenge -p 8080:3000 frontend 


- Backend:

  * docker run -d --name topics-api --network lemoncode-challenge backend 
