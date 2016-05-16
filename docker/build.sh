#!/bin/bash
if ! [ -n "$BASH_VERSION" ];then
    echo "this is not bash, calling self with bash....";
    SCRIPT=$(readlink -f "$0")
    /bin/bash $SCRIPT
    exit;
fi

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cp $DIR/Dockerfile $DIR/../.
cd $DIR/../

# Ask the user if they want to use the docker cache
read -p "Do you want to use a cached build (y/n)? " -n 1 -r
echo ""   # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    docker build --pull --tag swagger-ui-image .
else
    docker build --no-cache --pull --tag swagger-ui-image .
fi

# cleanup by removing the duplicate Dockerfile.
rm Dockerfile


