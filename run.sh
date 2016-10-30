#!/bin/bash
docker run --rm -it \
 -e PUID=111 -e PGID=117 \
 -v /mnt/data/config/cardigann:/config \
 -p 5060:5060 \
 cardigann /bin/bash