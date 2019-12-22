#!/bin/bash -e

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update -qq -o Dpkg::Use-Pty=0
sudo apt-get install -qq -o Dpkg::Use-Pty=0 nvidia-docker2
sudo pkill -SIGHUP dockerd
echo "SUCCESS: nvidia-docker2 started!"
