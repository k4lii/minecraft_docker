#!/bin/bash

if [ -f server.properties ]
then
    echo 'INFO: server.properties already exist'
else
    echo 'WARN: server.properties doesnt exist, a blank one will be generated'
    wget https://mediafilez.forgecdn.net/files/4143/595/Better+MC+FABRIC+Server+Pack+1.19.2+v12.5.zip
    unzip Better+MC+FABRIC+Server+Pack+1.19.2+v12.5.zip
    rm Better+MC+FABRIC+Server+Pack+1.19.2+v12.5.zip
    cp -r Better\ MC\ FABRIC\ Server\ Pack\ 1.19.2/* .
    rm -rf Better\ MC\ FABRIC\ Server\ Pack\ 1.19.2/
    echo 'eula=true' > eula.txt
    chmod +x start.sh
    ./start.sh
fi

./start.sh