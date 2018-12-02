#!/bin/bash

# update server's data
/home/steam/steamcmd/steamcmd.sh \
    +login anonymous \
    +force_install_dir /home/steam/server_data \
    +app_update 232130 \
    +exit

# start the server
/home/steam/server_data/Binaries/Win64/KFGameSteamServer.bin.x86_64 'KF-BurningParis'

exit 0
