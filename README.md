# node 
Simple Hello World that listens on localhost:9000.

Nodejs application using gradle for CICD pipeline

This demo app will also use Docker to build and deploy image to docker hub

There is Jenkinsfile used to build this project: This jenkinsfile will build the docker image, push it into docker hub.

Next I launch the docker container which will pull the image from my docker registry.
Also i ran the same image on kubernetes.
