CS:GO Docker

run example:

docker run -e LAN=1 -e HOST="SONM Test CS:GO Srv" -e RCON="123" -e GSLT=CEABFC414 -p 27015:27015 -p 27015:27015/udp -i -t imagename 

LAN = 0/1 - Lan server or Internet
HOST = Server name
RCON = password for admin console
GSLT = http://steamcommunity.com/dev/managegameservers token, for internet servers
