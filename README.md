CS:GO Docker<br />
<br />
run example:<br />

docker run -e LAN=1 -e HOST="SONM Test CS:GO Srv" -e RCON="123" -e GSLT=CEABFC414 -p 27015:27015 -p 27015:27015/udp -i -t imagename <br />
<br />
LAN = 0/1 - Lan server or Internet<br />
HOST = Server name<br />
RCON = password for admin console<br />
GSLT = http://steamcommunity.com/dev/managegameservers token, for internet servers<br />
