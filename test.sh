#!/bin/bash
# curl -O $(curl -s $(curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -j '.["versions"][] | select(.id=="'$MC_VERSION'").url') | jq -j '.["downloads"].server.url')

MC_VERSION="1.19.2"
echo "$MC_VERSION"
MC_VERSION_MANIFEST_URL="https://launchermeta.mojang.com/mc/game/version_manifest.json"
MC_VERSION_URL=$(curl -s ${MC_VERSION_MANIFEST_URL} | jq -r '.["versions"][] | select(.id=="'$MC_VERSION'").url')
MC_SERVER_URL=$(curl -s ${MC_VERSION_URL} | jq -r '.["downloads"].server.url')


echo "MC_VERSION_MANIFEST_URL=${MC_VERSION_MANIFEST_URL}"
echo "MC_VERSION_URL=${MC_VERSION_URL}"
echo "MC_SERVER_URL=${MC_SERVER_URL}"