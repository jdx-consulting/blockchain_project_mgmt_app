These instructions assume setting up a Linux ([Ubuntu](https://www.ubuntu.com/desktop)) development environment. Currently Ethereum and Truffle documentation and product maturity are better represented on Linux.

# Linux

## Virtual Box
If you are running on a Windows PC, you will need to create a VM as your Linux development environment.

* Download and install [Virtual Box](https://www.virtualbox.org/).

## Unbuntu Desktop
### Install
* Download [Ubuntu Desktop 64bit](https://www.ubuntu.com/download/desktop)
* Create a new Virtual Machine with a 20GB fixed HD.
* Mount the Ubuntu ISO.
* Give 4GB of Ram and 2 cores. 
* Install Linux.
### Update
```
sudo apt update
sudo apt upgrade
```

### [Set up NTP Time-Sync](https://www.digitalocean.com/community/tutorials/how-to-set-up-time-synchronization-on-ubuntu-16-04)
#### Install / Configure
```
timedatectl list-timezones
```
```
sudo timedatectl set-timezone Europe/London
```
```
sudo timedatectl set-ntp no
sudo apt-get install ntp
sudo ntpq -p
```
#### Validate
```
timedatectl
date
```
# VS Code
This is not mandatory, any text editor can be used to code up Ethereum (Solidity) contracts, but VS code has some useful plug-ins for Solidity development.

## Install
* Install [VSCode]('https://code.visualstudio.com/download')

# Geth (**G**o**Eth**ereum)
This is a command line tool/API into the Ethereum blockchain.

To install [geth](https://geth.ethereum.org/downloads/):
```
sudo apt install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt update
sudo apt install ethereum
```
# Mist
This is a graphical UI for the Ethereum blockchain.

To install Mist:
* [Download](https://github.com/ethereum/mist/releases) the Linux .deb file
* ```sudo dpkg -i Mist-linux64.deb```

# Node
## NVM (Node Version Manager)
```
sudo apt-get update
sudo apt-get install build-essential libssl-dev
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh -o install_nvm.sh
bash install_nvm.sh
source ~/.profile
```
## Node via NVM
```
nvm install 8.10.0
```
## Check Versions
```
node -v
npm -v
```

# Git
## Install
```
sudo apt-get update
sudo apt-get install git
```
## Clone Repo
```
mkdir ~/dev
cd ~/dev
git clone https://github.com/jdx-consulting/blockchain_project_mgmt_app.git

```
## Install Dependencies
```
cd ~/dev/blockchain_project_mgmt_app/App
npm install
```
## Open in VSCode
```
cd ~/dev/blockchain_project_mgmt_app
code .
```

# Truffle
[Truffle](http://truffleframework.com/) is an open-source Ethereum 'tool-kit', which abstracts some of the complexity of contract deployment, unit testing, etc.

To install truffle:
```
sudo apt install npm
sudo npm install -g truffle
```

# [Docker](https://www.docker.com/)

First dependency is [Docker](https://www.docker.com/); [TeamCity Server](https://hub.docker.com/r/jetbrains/teamcity-server/), [TeamCity BuildAgent](https://hub.docker.com/r/jetbrains/teamcity-agent/) and the [Ethereum Test Blockchain (Ganache-cli)](https://github.com/trufflesuite/ganache-cli) all run as Docker Containers.

## [Ubuntu Docker Install](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository)

### Install
 ```
sudo apt-get update
```

```
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
```

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

```
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

```
sudo apt-get update
```

```
sudo apt-get install docker-ce
```

### Test 
```
sudo docker run hello-world
```

# Ganache CLI
[GancheCLI](https://github.com/trufflesuite/ganache-cli) is a fast Ethereum RPC client for testing and development. It can also be run as a Docker container which really simplifies getting going...
```
docker run -d -p 8545:8545 trufflesuite/ganache-cli:latest
```

# Private Development Blockchain
Once contracts have been coded and unit tested (in isolation using Ganache CLI), the next step will be to connect to, and test against, a private and integrated development blockchain.


## To create a new directory:
```
mkdir blockchain
cd blockchain
```

## To remove public Ethereum chain (or old chains):
```
geth removedb
```

## Copy genesis.json to the blockchain path.
```
geth init genesis.json
```

## To create new wallet/account:
```
geth account new
```

## To start mining:
```
geth --mine --networkid 27 --rpc --rpccorsdomain "*" --maxpeers 6 --nodiscover
```

## To stop mining:
```
Ctrl + C
```

## To get enode address:
```
geth console
admin.getInfo.enode
```

## To get IP:
```
ip addr show
```

## To connect to another enode:
Put to a new (or existing) file in ~/.ethereum/geth/static-nodes.json the enode and ip addresses of another node, using the same format (without changing the port).
`["enode://b29dec5241d77b0bf9380555f3ada31d7efde2f66f9f5b06bbbf3baa29c816f228593991140902a299574110d90a96c55de380120c890c0611ad385a051c1a9e@[IP]:30303"]`

## To use Mist (it will automatically connect to the private chain):
`geth --mine --networkid 27 --rpc --rpccorsdomain "*" --maxpeers 6 --nodiscover`
`mist`

And below are the contents of the genesis block, `genesis.json`.
```{
    "config": {
        "chainId": 27,
        "homesteadBlock": 0,
        "eip155Block": 0,
        "eip158Block": 0
    },
    "difficulty": "2000000",
    "gasLimit": "2100000",
    "alloc": {}
}```
