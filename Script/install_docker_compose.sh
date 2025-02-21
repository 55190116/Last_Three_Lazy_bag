#!binbash

DOCKER_CONFIG=${DOCKER_CONFIG-$HOME.docker}

mkdir -p $DOCKER_CONFIGcli-plugins

curl -SL httpsgithub.comdockercomposereleasesdownloadv2.17.2docker-compose-linux-x86_64 -o $DOCKER_CONFIGcli-pluginsdocker-compose

chmod +x $DOCKER_CONFIGcli-pluginsdocker-compose

docker compose version