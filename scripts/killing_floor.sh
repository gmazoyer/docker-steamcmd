#!/bin/bash

# update server's data
/home/steam/steamcmd/steamcmd.sh \
    +login anonymous \
    +force_install_dir /home/steam/server_data \
    +app_update 215360 \
    +exit

# start the server
/home/steam/server_data/System/ucc-bin server 'KF-WestLondon.rom?game=KFmod.KFGameType?VACSecure=true?MaxPlayers=6'

exit 0
