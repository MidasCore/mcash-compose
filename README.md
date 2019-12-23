# MCashChain Node Tutorial

MCash Compose leverages Docker Compose to help you start a node or supper node.

## Requirements

-   Linux (Debian / Ubuntu preferred)
-   Windows

## Setup

This is the initial setup process. You will only need to do this once.

#### 1. Clone and cd into this repo

```shell script
git clone https://https://github.com/MidasCore/mcash-compose.git && cd mcash-compose
```

#### 2. Install Docker and Docker-Compose (skip this if already installed)

##### Linux:

- run `sudo ./get_started.sh` (easiest way)

or

- copy and run the following commands:
```shell script
sudo apt-get update && sudo apt-get install curl python3 apt-transport-https ca-certificates software-properties-common -y && curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh && sudo usermod -aG docker "$USER" && sudo pip3 install docker-compose
```

&nbsp;

###### Reboot the machine

- run `sudo reboot`

&nbsp;

##### Windows:
- Install Docker and Docker Compose (https://docs.docker.com/docker-for-windows/install/)


#### 3. Get the bootstrap file (skip this if you want to sync the blockchain from scratch)

##### Linux:
- run `./bootstrap.sh`

##### Windows:
- download [this file](https://mcashchain-snapshot.s3-ap-southeast-1.amazonaws.com/bootstrap.tar.gz) and unzip it into current folder


#### 4. Start `mcashnode`

Start `mcashnode` to finish syncing the blockchain

- If you want to run supper node, you have to edit `docker-compose.yml` with your witness private key 
```yaml
      WITNESS: "true"
      PRIVATE_KEY: ""
```

```shell script
docker-compose up -d mcashnode
```

