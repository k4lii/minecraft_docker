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

echo "Start cron"
# export GIT_TOKEN=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
# export GIT_USER=k4lii
# export GIT_REPO=mc_backup
echo "*/5 * * * * /tmp/gitcronjob.sh > /proc/1/fd/1 2>&1" >> /etc/cron.d/restart-cron 
crontab -u $USER /etc/cron.d/restart-cron
git config --global user.email "lorris.hamdaoui@epitech.eu"
git config --global user.name "CRON ROBOT"
cron

echo "Start Minecraft Server"
java -Xms$JAVA_XMS -Xmx$JAVA_XMX -jar server.jar nogui --port $PORT