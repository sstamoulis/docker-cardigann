[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/

[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)][linuxserverurl]

The [LinuxServer.io][linuxserverurl] team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io][forumurl]
* [IRC][ircurl] on freenode at `#linuxserver.io`
* [Podcast][podcasturl] covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# sstamoulis/cardigann
[![](https://images.microbadger.com/badges/image/sstamoulis/cardigann.svg)](https://microbadger.com/images/sstamoulis/cardigann "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/sstamoulis/cardigann.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/sstamoulis/cardigann.svg)][hub]
[hub]: https://hub.docker.com/r/sstamoulis/cardigann/

[Cardigann](https://github.com/cardigann/cardigann) is a proxy server for adding new indexers to Sonarr, SickRage and other media managers.
## Usage

```
docker create \
  --name cardigann \
  -e PUID=<UID> -e PGID=<GID> \
  -e TZ=<timezone> \
  -p 5060:5060 \
  -v </path/to/deluge/config>:/config \
  sstamoulis/cardigann
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side.
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


* `-v /config` - cardigann configs
* `-e PGID` for for GroupID - see below for explanation
* `-e PUID` for for UserID - see below for explanation
* `-e TZ` for timezone information, eg Europe/London

It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it deluge /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application

The admin interface is available at http://<ip>:5060

## Versions

+ **30.10.16:** Initial Release.
