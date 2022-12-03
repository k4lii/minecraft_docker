# minecraft_docker

docker build -f Dockerfile --build-arg PORT=6000 -t mc .

docker run --env MC_VERSION=1.19.2 -p 6000:6000 --env PORT=6000 -v ~/minecraft_docker/server.properties_1.19.2:/home/creeper/mc/server.properties --name mc -it -d mc

docker run --env MC_VERSION=1.19.2 -p 6000:6000 --env PORT=6000 --env GIT_TOKEN=xxxxx --env GIT_USER=k4lii --env  GIT_REPO=mc_backup -v \\wsl.localhost\Ubuntu\home\k4liii\minecraft_docker\server.properties_1.19.2:/home/creeper/mc/server.properties --name mc -it -d mc

docker exec -it mc bash