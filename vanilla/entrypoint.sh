#!/bin/bash

#auto download minecraft server for the choosen version
curl -O $(curl -s $(curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -j '.["versions"][] | select(.id=="1.19.2").url') | jq -j '.["downloads"].server.url')

if [ server.properties ]
then
    echo 'INFO: server.properties already exist'
    echo "eula=true" > eula.txt
else
    java -jar server.jar --nogui --initSettings  && sed -i 's/eula=false/eula=true/g' eula.txt
    echo 'WARN: server.properties doesnt exist, a blank one will be generated'
fi
echo 'INFO: EULA ACCEPTED'

# /bin/bash
java -Xms1536M -Xmx1536M -jar server.jar nogui