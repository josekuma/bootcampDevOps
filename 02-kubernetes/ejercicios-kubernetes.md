# Ejercicio 1 de kubernetes - Monolito de memoria

## Pasos para completarlo

    1) Meterse en la carpeta de todo-ap y hacer el docker build de la imagen.

`docker build -t todo-app .`
    
    2) Se crea el repositorio de Docker Hub y se retagea el nombre de la imagen a la del repositorio y luego se pushea
`docker tag todo-app josegguerrer/todo-app`
`docker push josegguerrer/todo-app`

    3) Se crea un archivo yaml con el Deployment y se escribe todo el codigo con el nombre 'todo' tanto en el nombre del recurso Deployment, como del template del pod que va a crear. Tambien se especifica el container en el que incluirá la imagen de docker hub que subimos y las variables de entorno que se nos piden y en NODE_ENV elijo el entorno de development para así tener más herramientas y recursos y bajar las posiblidades de que se me cuelgue por algo.
    4) Se crea el yaml de Service y se pone de tipo LoadBalancer, se abre el puerto 3000 y se selecciona el nombre del Deployment que es para quien va a servir.
    5) Se aplica
`kubectl apply -f Deployment.yml -f Service.yaml`
    6) Se debe de crear el tunnel para poder comunicar el cluster con el localhost y se ejecuta en una terminal diferente el `minikube tunnel` , lo que nos da una salida como esta:
    
    Status:	
	machine: minikube
	pid: 164648
	route: 10.96.0.0/12 -> 192.168.49.2
	minikube: Running
	services: [todo-service]
    errors: 
		minikube: no errors
		router: no errors
		loadbalancer emulator: no errors

    7) Luego se ejecuta el comando `kubectl get svc` para coger todos los services ejecutandose en el cluster y se busca el de 'todo-service', Se mira la EXTERNAL IP y se copia eso en el navegador junto con el puerto 3000 y saldrá el resultado.

[Imgur](https://i.imgur.com/hw0xeUY.png)

# Ejercicio 2 - Incluir Volumenes y bases de datos

## Pasos
    1) Con la imagen del todo-api creado del ejercicio anterior se crea el primer Deployment que sirve para alojar la app en si, osea el front.
    2) Despues se procede a crear una StorageClass en el sc.yaml que sirve para definir las reglas en las que el PersistVolumeClaim recogerá volumenes dinamicamente.
    3) Se crear el PV, el PVC correspondiente, El configMap de la base de datos donde se incluirá las variables necesarias para inicializarlas.
    4) Por ultimo se Crear el StatefulSet que es donde se albergará la DataBase y se incluye dentro todo lo anterior, como el link hacia el Persistent Volume Claim y tambien la ruta dentro del contenedor donde se guardarán los datos.
    5) Se debe de crear un servicio llamado svc-bd que sirve para conectar el front con el StatefulSet.
    6) Luego otro Servicio que sirva para conectar el exterior con el front que será de tipo LoadBalancer.
    7) Se aplica todo lo anterior con `kubectl apply -f -`
    8) Se ejecuta en una segunda terminal minikube tunnel
    9) Se busca kubectl get service para conseguir la ip externa del servicio que creamos y se pone en el navegador junto con el puerto 3000.
    10) Se debe de crear la base de datos para ello hay que acceder al pod donde se almacena el postgress haciendo esta serie de pasos:

* Ejecutamos `kubectl get pods`, y obtenemos el nombre del pod relacionado con el `StatefulSet`.
* Ejecutamos `kubectl exec [postgres-pod-name] -it bash`
* Ejecutamos `psql -U postgres`, pegamos `todo-app/todos_db.sql` y pulsamos `enter`, la base de datos debería estar generada


# Ejercicio 3 - Ingress

## Pasos

    1) Se debe hacer el docker build del todo-front y subirlo a un repositorio de docker hub
    2) Se debe crear un Deployment con el todo-front anterior creado y mapearlo al puerto 80
    3) Se deben de crear dos servicios ClusterIP uno para todo-api cuyo Deployment fue creado en el ejercicio anterior.
    4) Se deben las mismas conexiones que en el ejercicio 2 para poder conectar las databases
    5) Hacer un Ingress y este tiene que tener un host personalizado y hacer un path dentro de ese fichero para tanto para /api como / que sera la misma ruta de host.
    6) Para que funcione ese host se debe incluir junto con la ip de minikube que se busca con minikube ip, y se hace un `sudo nano /etc/hosts` para editar el fichero hosts
    7) Dentro del Ingress tambien deben señalizarse tras cada path, el nombre del servicio al que este apunta al Deployment.
    8) Una vez terminado se hace `kubectl apply -f .` para aplicar todo a la vez dentro del directorio adecuado.
    9) Se puede hacer los pasos previos del ejercicio anterior de inicializar la base de datos con `kubectl exec`
    10) Simplemente se prueba poniendo el DNS en el navegador o haciendo curl o wget.
   
   