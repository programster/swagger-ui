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

docker build -t swagger-ui-image .

# cleanup by removing the duplicate Dockerfile.
rm Dockerfile



