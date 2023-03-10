#!/bin/bash
DIR_PATH=$(dirname "$0")
ENV_PATH=${DIR_PATH}/docker-compose.env
YML_PATH=${DIR_PATH}/docker-compose.yml 

if [ "$1" = "force" ]; then
    echo "Force recreate"
    docker compose -p db --env-file ${ENV_PATH} -f ${YML_PATH} up -d --remove-orphans --force-recreate
elif [ "$1" = "stop" ]; then
    echo "Stopping"
    docker compose -p db --env-file ${ENV_PATH} -f ${YML_PATH} stop
elif [ "$1" = "down" ]; then
    echo "down"
    docker compose -p db --env-file ${ENV_PATH} -f ${YML_PATH} down
else
    echo "Restart if changed"
    docker compose -p db --env-file ${ENV_PATH} -f ${YML_PATH} up -d
fi
