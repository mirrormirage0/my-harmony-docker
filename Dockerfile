FROM ubuntu:18.04

LABEL maintainer="mirrormirage0@gmail.com"

WORKDIR /openstaking

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y curl wget zip unzip psmisc dnsutils libgmp-dev nano tmux git
RUN apt-get install zsh -y
RUN apt-get install language-pack-en -y
RUN apt-get install powerline fonts-powerline -y
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
RUN git clone https://github.com/mirrormirage0/my-harmony-docker.git ~/.mydockerconfig
#RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
RUN cp ~/.mydockerconfig/mirrormirage-zshconfig ~/.zshrc
RUN chsh -s /bin/zsh


RUN mkdir -p .hmy/blskeys
COPY keys/* /openstaking/.hmy/blskeys/
COPY keys/* /openstaking/

RUN curl -LO https://harmony.one/hmycli &&  mv hmycli hmy && chmod +x hmy 
RUN curl -LO https://harmony.one/node2.sh && mv  node2.sh node.sh && chmod a+x node.sh

RUN echo 'alias sync="tail -f latest/zero*.log | grep SYNC"' >> ~/.bashrc
RUN echo 'alias bingo="grep BINGO latest/zero*.log"' >> ~/.bashrc

EXPOSE 6000 9000
ENTRYPOINT [ "/bin/zsh" ]
