FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    gcc-multilib \
    make \
    perl  \
    qemu  \
    qemu-system 

RUN ln /usr/bin/qemu-system-x86_64 /usr/bin/qemu

WORKDIR /home

COPY pintos.tar.gz .

RUN tar -zxf pintos.tar.gz 

# Устанавливаем рабочую директорию для utils
WORKDIR /home/pintos/src/utils

RUN cp -f backtrace pintos pintos-mkdisk pintos-set-cmdline Pintos.pm pintos-gdb ../misc/gdb-macros /usr/bin/ && \
    chmod 755 /usr/bin/backtrace /usr/bin/pintos /usr/bin/pintos-mkdisk /usr/bin/pintos-set-cmdline /usr/bin/pintos-gdb && \
    chmod 644 /usr/bin/Pintos.pm /usr/bin/gdb-macros

# Устанавливаем рабочую директорию для threads
WORKDIR /home/pintos/src/threads

RUN echo "\ndeb http://dk.archive.ubuntu.com/ubuntu/ xenial main\n" >> /etc/apt/sources.list && \
    echo "\ndeb http://dk.archive.ubuntu.com/ubuntu/ xenial universe\n" >> /etc/apt/sources.list

RUN apt update && \
    apt install -y gcc-4.7 && \
    rm /usr/bin/gcc && \
    ln /usr/bin/gcc-4.7 /usr/bin/gcc

COPY pintos /usr/bin/pintos
# Выполняем make в директории threads
RUN make