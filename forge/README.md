# BUILD
docker build -f Dockerfile -t mc .

# RUN
docker run --env MC_VERSION=1.19.2 -p 6000:6000 --env PORT=6000 -v ~/minecraft_docker/server.properties_1.19.2:/home/creeper/mc/server.properties --name mc -it -d k4liii/minecraft-forge:latest

# CONNECT INSIDE CONTAINER
docker exec -it mc bash

# ENV VAR
JAVA_XMS=4096M
PORT=6000
JAVA_XMX=4096M
MC_VERSION=1.19.2
BACKUP=false
MC_DIR=/home/$USER/mc

# enable backup -> You need to provide these env var
GIT_TOKEN=xxxxxxxxxxxxxx
BACKUP_INTERVAL=30
BACKUP=true
GIT_REPO=xxxxxxxx