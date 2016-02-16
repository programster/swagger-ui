#!/bin/bash
# Script that should execute on startup of the container.

# copy across create the default swagger spec if one doesnt exist.
if [ ! -f /tmp/foo.txt ]; then
    echo "Couldnt find spec, so creating default."
    cp /build/docker/default-spec.json /build/dist/spec/swagger-spec.json
fi

# Run the node process as the foreground process.
./node_modules/gulp/bin/gulp.js serve
