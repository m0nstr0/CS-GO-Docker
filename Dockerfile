FROM ubuntu:17.10

EXPOSE 27015/udp

ENV USER csgo
ENV HOME /home/$USER
ENV SERVER $HOME/csgosrv

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install lib32gcc1 wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && useradd -ms /bin/bash $USER

RUN mkdir $SERVER
ADD ./start_csgo.sh $HOME/start_csgo.sh
RUN chown $USER:$USER $HOME/start_csgo.sh
RUN chmod +x $HOME/start_csgo.sh
RUN chown $USER:$USER $SERVER
ADD ./csgo_update.txt $HOME/csgo_update.txt
RUN chown $USER:$USER $HOME/csgo_update.txt

USER $USER
WORKDIR $HOME

RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
		 && tar -xvzf steamcmd_linux.tar.gz

RUN ./steamcmd.sh +runscript ./csgo_update.txt

ADD cfg/* $SERVER/csgo/cfg/

ENTRYPOINT ["./start_csgo.sh"]