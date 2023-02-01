#### El resultado de la primera pipeline me da lo siguiente

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