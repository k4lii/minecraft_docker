# minecraft_docker


docker build -f Dockerfile.vanilla  --build-arg  VANILLA_VERSION=1.19.2 --build-arg PORT=5000 -t mc .

docker run  --env MC_VERSION=1.19.2 PORT=6000 -p 6000 -it -d mc


docker exec -it 17ef36e8b8a2 bash