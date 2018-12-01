# steamcmd Docker container

This `Dockerfile` helps to start **steamcmd** related processes while
isolating them while they run. This image is based on `debian:stretch`.

It can be used to start any game servers that can be setup using **steamcmd**.

This `Docker` container expects at least two volumes to work:

  1. A volume used to store scripts for starting a server
  2. A volume used to store server's data

In the scripts volume, a script called `server.sh` must be present to start
the container. This script is the entrypoint of the container and must
perform all steps relative to the server execution (update/start/…).

## Writing a server script

Here is an example of script to start a Killing Floor 2 game server.

```
#!/bin/bash

/home/steam/steamcmd/steamcmd.sh \
    +login anonymous \
    +force_install_dir /home/steam/server_data \
    +app_update 232130 \
    +exit

/home/steam/server_data/Binaries/Win64/KFGameSteamServer.bin.x86_64 'KF-BurningParis'

exit 0
```

## Running a server

First the **steamcmd** image must be pulled from
[Docker Hub](https://hub.docker.com/) using the following command:

```
# docker pull gmazoyer/docker-steamcmd
```

After that two directories must be mounted as volumes to store the server's
data and server's script.

```
# mkdir -p /srv/docker/mygameserver/{data,scripts}
```

Once created, these directories can be used as volumes when starting the
docker instance. Make sure that a script called `server.sh` is in the
`scripts` directory to start the server instance properly.

```
# docker run -d --name=kf2 \
             -v /src/docker/kf2/data:/home/steam/server_data \
             -v /srv/docker/kf2/scripts:/home/steam/server_scripts \
             -p 0.0.0.0:20560:20560/udp \
             -p 0.0.0.0:27015:27015/udp \
             -p 0.0.0.0:7777:7777/udp \
             -p 0.0.0.0:8080:8080 \
         gmazoyer/docker-steamcmd:latest
```

This will run a Killing Floor 2 server, using the script previously given,
exposing ports on the host to make the server publicly available.

Since server's data are stored in a volume, it is possible to adjust the
server's configuration files while the server is offline. Any changes made to
files in the `data` or `scripts` will be persistent.
