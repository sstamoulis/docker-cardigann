#!/bin/bash
docker run --rm -it \
 -e PUID=111 -e PGID=117 \
 -v /mnt/data/config/cardigann:/config \
 cardigann /bin/bash