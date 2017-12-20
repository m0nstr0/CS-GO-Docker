FROM ubuntu:17.10

EXPOSE 27015

ENV USER csgo
ENV HOME /home/$USER
ENV SERVER $HOME/csgosrv

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install lib32gcc1 wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && useradd -ms /bin/bash $USER

RUN mkdir $SERVER
ADD ./start_csgo.sh $SERVER/start_csgo.sh
RUN chown $USER:$USER $SERVER/start_csgo.sh
RUN chmod +x $SERVER/start_csgo.sh
RUN chown $USER:$USER $SERVER

USER $USER
WORKDIR $HOME

RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
		 && tar -xvzf steamcmd_linux.tar.gz

RUN ./steamcmd.sh +login anonymous +force_install_dir $SERVER +app_update 740 validate +quit

ADD cfg/* $SERVER/csgo/cfg/

WORKDIR $SERVER

ENTRYPOINT ["./start_csgo.sh"]