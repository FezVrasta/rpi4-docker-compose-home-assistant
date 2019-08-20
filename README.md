# DietPi + Docker Compose + Home Assistant setup

This is a docker-compose managed Raspberry Pi server, it is used to
run Home Assistant, Transmission, Node-Red, DeCONZ< Let's Encrypt, and No-Ip DNS updater.

## Setup

- Install DietPi on a MicroSD card
- enable the serial interface (follow DietPi docs)
- Install Docker using dietpi-software
- run `apt install docker-compose`
- copy the content of this repository into the root of your root partition
  (so that you get an /opt/docker-compose folder)
- edit the `docker-compose.yml` file to configure it with your data
- `systemctl enable /opt/docker-compose/docker-compose.service`
- `cd /opt/docker-compose && docker-compose build`
- `systemctl start docker-compose`
