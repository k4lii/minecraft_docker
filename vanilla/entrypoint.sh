#!/bin/bash

#auto download minecraft server for the choosen version
echo "$MC_VERSION" #DEBUG
MC_VERSION_MANIFEST_URL="https://launchermeta.mojang.com/mc/game/version_manifest.json"
MC_VERSION_URL=$(curl -s ${MC_VERSION_MANIFEST_URL} | jq -r '.["versions"][] | select(.id=="'$MC_VERSION'").url')
MC_SERVER_URL=$(curl -s ${MC_VERSION_URL} | jq -r '.["downloads"].server.url')

if [ -z "$MC_SERVER_URL" ]; then
  echo "Error: Invalid version or version not found"
  exit 1
else
  curl -O ${MC_SERVER_URL}
fi

if [ server.properties ]
then
    echo 'INFO: server.properties already exist'
    echo "eula=true" > eula.txt
else
    java -jar server.jar --nogui --initSettings  && sed -i 's/eula=false/eula=true/g' eula.txt
    echo 'WARN: server.properties doesnt exist, a blank one will be generated'
fi
echo 'INFO: EULA ACCEPTED'

if [ "$BACKUP" == "true" ] ;
then
    echo 'INFO: Start Cron'
    scriptPath=$(dirname "$(readlink -f "$0")")
    printenv | sed 's/^\(.*\)$/export \1/g' > ${scriptPath}/.env.sh
    chmod +x ${scriptPath}/.env.sh
    echo "*/$BACKUP_INTERVAL * * * * /tmp/gitcronjob.sh > /proc/1/fd/1 2>&1" >> /etc/cron.d/restart-cron 
    crontab -u $USER /etc/cron.d/restart-cron
    git config --global user.email "$EMAIL"
    git config --global user.name "CRON ROBOT"
    cron
else
    echo 'INFO: BACKUP DISABLED'
fi

echo "Start Minecraft Server with Xms=$JAVA_XMS and Xmx=$JAVA_XMX on port=$PORT"
java -Xms$JAVA_XMS -Xmx$JAVA_XMX -jar server.jar nogui --port $PORT
