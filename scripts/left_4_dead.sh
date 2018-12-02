#!/bin/bash

# update server's data
/home/steam/steamcmd/steamcmd.sh \
    +login anonymous \
    +force_install_dir /home/steam/server_data \
    +app_update 222840 \
    +exit

# start the server
/home/steam/server_data/srcds_run \
    -game left4dead +map l4d_hospital01_apartment \
    -port 27015 +maxplayers 4 -console -secure -nohltv \
    +sv_pure 0 +ip 0.0.0.0

exit 0
