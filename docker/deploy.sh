#!/bin/bash
if ! [ -n "$BASH_VERSION" ];then
    echo "this is not bash, calling self with bash....";
    SCRIPT=$(readlink -f "$0")
    /bin/bash $SCRIPT
    exit;
fi

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# create the volume folder if it doesn't already exist.
mkdir -p $HOME/spec

# remove the existing container if it is already running.
docker kill swagger-ui
docker rm swagger-ui

docker run \
-d \
-p 80:8080 \
--name swagger-ui \
--volume $HOME/spec:/build/dist/spec \
swagger-ui-image
