FROM ubuntu:18.04
LABEL  maintainer "im-neko <neko@im-neko.net>"

RUN useradd -m neko
RUN gpasswd -a neko sudo
RUN echo "neko:changemePassword2255" | chpasswd

RUN apt update -y && apt install -y sudo \
  software-properties-common \
  make \
  build-essential \
  cron \
  wget \
  git \
  curl \
  telnet \
  tmux

RUN curl https://im-neko.net/files/setting.sh | bash

RUN echo "neko ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER neko
WORKDIR /home/neko

RUN curl https://im-neko.net/files/setting.sh | bash

CMD ["zsh"]
