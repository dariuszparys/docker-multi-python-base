FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libsqlite3-dev \
    libreadline-dev \
    libffi-dev \
    curl \
    libbz2-dev \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    software-properties-common

WORKDIR /tmp
# Install Python 3.6.12
RUN curl -O https://www.python.org/ftp/python/3.6.12/Python-3.6.12.tar.xz && \
    tar -xf Python-3.6.12.tar.xz && \
    cd Python-3.6.12 && \
    ./configure --enable-optimizations && \
    make -j "$(nproc)" && \
    make altinstall

# Install Python 3.7.9
WORKDIR /tmp
RUN curl -O https://www.python.org/ftp/python/3.7.9/Python-3.7.9.tar.xz && \
    tar -xf Python-3.7.9.tar.xz && \
    cd Python-3.7.9 && \
    ./configure --enable-optimizations && \
    make -j "$(nproc)" && \
    make altinstall

# Install Python 3.8.6
WORKDIR /tmp
RUN curl -O https://www.python.org/ftp/python/3.8.6/Python-3.8.6.tar.xz && \
    tar -xf Python-3.8.6.tar.xz && \
    cd Python-3.8.6 && \
    ./configure --enable-optimizations && \
    make -j "$(nproc)" && \
    make altinstall

# Install Python 3.9.0
WORKDIR /tmp
RUN curl -O https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tar.xz && \
    tar -xf Python-3.9.0.tar.xz && \
    cd Python-3.9.0 && \
    ./configure --enable-optimizations && \
    make -j "$(nproc)" && \
    make altinstall

RUN rm -rf /tmp/*