#!/bin/bash

# update server's data
/home/steam/steamcmd/steamcmd.sh \
    +login anonymous \
    +force_install_dir /home/steam/server_data \
    +app_update 740 \
    +exit

# start the server
/home/steam/server_data/srcds_run \
    -game csgo -console -usercon \
    -secure -autoupdate -tickrate 64 +hostport 27015 \
    +game_type 0 +game_mode 1 +mapgroup mg_active +map de_dust2 \
    -port 27015 -console -secure -nohltv +sv_pure 0 +ip 0.0.0.0

exit 0
