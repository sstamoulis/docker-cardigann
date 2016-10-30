#!/bin/bash
docker build -t cardigann . && \
docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi