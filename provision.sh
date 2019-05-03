#!/usr/bin/env bash

set -euxo pipefail

apt update
apt dist-upgrade -y

apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt update
apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io

gpasswd -a vagrant docker