FROM ubuntu:20.04 AS prepare
# RUN --mount=type=secret,id=mysecret cat /run/secrets/mysecret > /root/secret


WORKDIR /tmp
SHELL ["/bin/bash","-o","pipefail","-c"]
# Set environment variables
ENV TERM xterm-256color

RUN yes | unminimize || test $? -eq 141
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive \
	apt install -y sudo net-tools wget make gcc curl libncurses-dev vim tmux man zsh git python3 golang nodejs lua5.3 \
				fzf cargo npm fd-find silversearcher-ag

RUN useradd -ms /usr/bin/zsh tom && echo "tom: " | chpasswd && adduser tom sudo

COPY --chown=tom configs/tom /home/tom/
COPY configs/etc /etc/

USER tom
WORKDIR /home/tom

#RUN wget https://github.com/vim/vim/archive/refs/tags/v8.2.3033.tar.gz
#RUN tar xzvf v8.2*
#RUN cd vim-8.2.3033 && ./configure && make && make install && cd .. && rm -rf *


#FROM prepare
#RUN echo iknow!! > existing.txt
