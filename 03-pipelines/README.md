# Ejercicios de pipelines - Módulo 3

## Jenkins

### Ejercicio 1

    1) Creamos una imagen de docker basandonos en el Dockerfile que nos proveen que tiene instalado por defecto todas las cofiguraciones de Gradle. Nos situamos en el directorio del Dockerfile.
    `docker build -t jenkins-gradle .`

    2) Ejecutamos el siguiente comando para desplegar la aplicacion de Jenkins en un contenedor de Docker:
    `docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --rm --name jenkins-host jenkis-gradle`

            El comando dice que lo correrá en el localhost de 8080, tendrá un volumen llamado jenkins_home que sirve para guardar las pipelines, tu password y todo tu setup de Jenkins. El --rm sirve para borrar automaticamente al parar el contenedor. --nm para nombrar al container y jenkins-gradle es el nombre de la imagen anterior que creamos.
    3) En los logs de ese depliege de container aparece la constraseña inicial que deberemos de copiar y si no aparece, aparece la ruta del archivo donde podemos hacer un cat para verla.
    4) Iniamos el localhost:8080
    5) Metemos la constraseña, nos creamos yn nuevo usuario y contrasela y le damos a instalar todos los suggested plugins.
    6) Una vez dentro de Jenkins le damos a crear nuevo Item y le decimos que queremos una pipeline
    7) En las configuraciones de la pipeline le decimos que el script venga de un SCM, que ese SCM es de Github y le decimos el enlance de nuestro repositorio de Github. Tambien le escribimos la ruta relativa de donde se ubica nuestro Jenkinsfile dentro de ese repositorio.
    8) Finalmente solo nos queda escribir ese Jenkinsfile desde Visual Studio Code y commit-pushearlo a nuestro Github
    9) Las explicaciones del codigo vienen dentro del Jenkinsfile
    10) Una vez pusheado, le damos a Build Now y se ejecutará nuestra pipeline.
    
#### Este es el resultado de ese Build: 

```
Started by user admin
Obtained 03-pipelines/Ejercicio 1/Jenkinsfile from git https://github.com/josekuma/bootcampDevOps.git
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/jenkins_home/workspace/ejercicio1
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
Selected Git installation does not exist. Using Default
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir /var/jenkins_home/workspace/ejercicio1/.git # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/josekuma/bootcampDevOps.git # timeout=10
Fetching upstream changes from https://github.com/josekuma/bootcampDevOps.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- https://github.com/josekuma/bootcampDevOps.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision 5fc57a41b666df23ad0f6b8459fb3301b41a7ab6 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 5fc57a41b666df23ad0f6b8459fb3301b41a7ab6 # timeout=10
Commit message: "pipes"
 > git rev-list --no-walk 61a8d1ddfaf155f740088ffd0b9254633e304b67 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Checkout)
[Pipeline] checkout
Selected Git installation does not exist. Using Default
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir /var/jenkins_home/workspace/ejercicio1/.git # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/josekuma/bootcampDevOps.git # timeout=10
Fetching upstream changes from https://github.com/josekuma/bootcampDevOps.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- https://github.com/josekuma/bootcampDevOps.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision 5fc57a41b666df23ad0f6b8459fb3301b41a7ab6 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 5fc57a41b666df23ad0f6b8459fb3301b41a7ab6 # timeout=10
Commit message: "pipes"
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Compile)
[Pipeline] sh
+ cd ./03-pipelines/Ejercicio 1/jenkins-resources/calculator/
+ chmod +x gradlew
+ ./gradlew compileJava
Starting a Gradle Daemon (subsequent builds will be faster)
> Task :compileJava UP-TO-DATE

BUILD SUCCESSFUL in 8s
1 actionable task: 1 up-to-date
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Unit Tests)
[Pipeline] sh
+ cd ./03-pipelines/Ejercicio 1/jenkins-resources/calculator/
+ chmod +x gradlew
+ ./gradlew test
> Task :compileJava UP-TO-DATE
> Task :processResources
> Task :classes
> Task :compileTestJava
> Task :processTestResources NO-SOURCE
> Task :testClasses
> Task :test

BUILD SUCCESSFUL in 15s
4 actionable tasks: 3 executed, 1 up-to-date
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS

```

### Ejercicio 2

    1) Esta vez levantamos Jenkins usando docker-in-docker mas la imagen de Jenkins y lo conectamos en una red usando docker compose y las imagenes proveidas por lemoncode
    2) Una vez dentro, instalamos los plugins de Docker y Docker Pipelines
    3) Creamos un nuevo item y de nuevo le decimos donde esta nuestro repo y nuestro Jenkinsfile.
    4) Comiteamos nuestro jenkinsfile y luego ejecutamos la pipeline con Build Now.
    5) Las explicaciones vienen dentro.

## Gitlab

### Ejercicio 1

    1) Nos creamos una cuenta de Gitlab
    2) Creamos un grupo y un proyecto y nos aseguramos de ser owners
    3) En la pestaña repositories copiamos el enlace para clonarlo y subimos todos nuestros archivos de la app, nos aseguramos que en la raiz este el Dockerfile mas la carpeta src
    4) Luego en Pipelines nos vamos a editor y escribimos el codigo de nuestra pipeline no sin antes crear una rama.
    5) En caso de hacerlo en la rama main entonces tenemos que ir a Settings y quitar la proteccion a la rama
    6) Le damos a commit changes y dejamos que la pipeline fluya.

## Github Actions

    Aqui está el enlace al repositorio donde se encuentra todos los ejercicios:

    https://github.com/josekuma/git-actions-playground