# TeamCity Build Server for Ethereum (Solidity) Development

## [Docker](https://www.docker.com/)

First dependency is [Docker](https://www.docker.com/); [TeamCity Server](https://hub.docker.com/r/jetbrains/teamcity-server/), [TeamCity BuildAgent](https://hub.docker.com/r/jetbrains/teamcity-agent/) and the [Ethereum Test Blockchain (Ganache-cli)](https://github.com/trufflesuite/ganache-cli) all run as Docker Containers.

### [Ubuntu Docker Install](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository)

#### Install
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

#### Test 
```
sudo docker run hello-world
```

### Prepare for TeamCity Server and Agent Install

```
mkdir /data/teamcity/datadir
mkdir /data/teamcity/logs
mkdir /data/teamcity/agent/conf

chmod 777 /data/teamcity/datadir
chmod 777 /data/teamcity/logs
chmod 777 /data/teamcity/agent/conf
```

### TeamCity Server

#### [Install](https://hub.docker.com/r/jetbrains/teamcity-server/)

```
docker run -it --name teamcity-server-instance  \
    -v /data/teamcity/datadir:/data/teamcity_server/datadir \
    -v /data/teamcity/logs:/opt/teamcity/logs  \
    -p 8080:8111 \
    jetbrains/teamcity-server
```

#### Check Running
```
sudo docker ps | grep teamcity-server-instance
sudo docker logs teamcity-server-instance
```

#### Initial Set-up
Browse to http://localhost:8080

Follow set up instructions. **Ensure admin username and password is securely recorded.**

### TeamCity Build Agent (Co-Located)

#### [Install](https://hub.docker.com/r/jetbrains/teamcity-agent/)
```
docker run -d -e SERVER_URL="http://localhost:8080"  \
-v /data/teamcity/agent/conf:/data/teamcity_agent/conf  \
--name teamcity-agent-instance --net="host" jetbrains/teamcity-agent
```

#### Check Running
```
sudo docker ps | grep teamcity-agent-instance
sudo docker logs teamcity-agent-instance
```

### Ganche CLI (Test Ethereum Chain)

#### [Install](https://github.com/trufflesuite/ganache-cli)
```
sudo docker run -d -p 8545:8545 --name ethereum-test-chain trufflesuite/ganache-cli:latest
```

#### Check Running
```
sudo docker ps | grep ethereum-test-chain
sudo docker logs ethereum-test-chain
```

### Build Dependencies
These dependencies are required by the BuildAgent, so must be installed in the Docker container running the BuildAgent.

#### Connect to Running Agent (Docker Container)
```
sudo docker exec -it teamcity-agent-instance bash
```

#### Node
##### NVM (Node Version Manager)
```
sudo apt-get update
sudo apt-get install build-essential libssl-dev
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh -o install_nvm.sh
bash install_nvm.sh
source ~/.profile
```
##### Node via NVM
```
nvm install 8.10.0
```
###### Check Versions
```
node -v
npm -v
```
###### Make Available to All Users (ie buildagent)
```
n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local
```

###### Check now Available
```
su buildagent
node -v
exit
```

#### Truffle
##### Install
```
npm install -g truffle
```
##### Check Version
```
truffle version
```
##### Make Available to All Users (ie buildagent)
```
n=$(which truffle);n=${n%/bin/truffle}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local
```

##### Check now Available
```
su buildagent
truffle version
exit
```

#### Disconnect from Running Agent (Docker Container)
```
exit
```