FROM ubuntu:18.04

LABEL maintainer="mirrormirage0@gmail.com"

WORKDIR /openstaking

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y curl wget zip unzip psmisc dnsutils libgmp-dev nano tmux git
RUN apt-get install npm
RUN npm install pm2@latest -g

RUN mkdir -p .hmy/blskeys
COPY keys/* /openstaking/.hmy/blskeys/
COPY keys/* /openstaking/

RUN curl -LO https://harmony.one/hmycli && mv hmycli hmy && chmod +x hmy
RUN curl -LO https://harmony.one/node.sh && chmod a+x node.sh

RUN echo 'alias sync="tail -f latest/zero*.log | grep SYNC"' >> ~/.bashrc
RUN echo 'alias bingo="grep BINGO latest/zero*.log"' >> ~/.bashrc

EXPOSE 6000 9000
ENTRYPOINT [ "/bin/bash" ]
