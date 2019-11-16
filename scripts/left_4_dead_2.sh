#!/bin/bash

# update server's data
/home/steam/steamcmd/steamcmd.sh \
    +login anonymous \
    +force_install_dir /home/steam/server_data \
    +app_update 222860 \
    +exit

# start the server
/home/steam/server_data/srcds_run \
    -game left4dead2 +map c1m1_hotel \
    -port 27015 +maxplayers 4 -console -secure -nohltv \
    +sv_pure 0 +ip 0.0.0.0

exit 0
