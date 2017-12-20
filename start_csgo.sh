#!/bin/bash

cd $SERVER

STEAM="+sv_setsteamaccount \"$GSLT\" -net_port_try 1"
if [[ -z "$GSLT" ]]
then
	STEAM=""
fi

LAN="${LAN:=0}"

./srcds_run -game csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_active +map de_dust2 +sv_lan $LAN $STEAM +hostname "$HOST" +rcon_password "$RCON"
