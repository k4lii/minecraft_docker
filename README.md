# minecraft_docker

docker build -f Dockerfile --build-arg PORT=5000 -t mc .

docker run --env MC_VERSION=1.19.2 -p 25565  -v /home/k4liii/minecraft_docker/server.properties_1.19.2:/home/creeper/mc/server.properties --name mc -it -d mc

docker exec -it mc bash