# Axelar - Installation
This repository contains script to install and configure Axelar Testing node on the server

## Requirements
- Operating system: Ubuntu (tested on 20.04)
- Hardware: 4 cores, 8-16GB RAM, 512 GB drive, arm64 or amd64. Recommended 6-8 cores, 16-32 GB RAM, 1 TB+ drive.

Please note: The bash script will install all necessary software and perform all configuration automatically.

You just need to install 'wget' tool to make possibility run and install it:
```
sudo apt install wget -y
```

## Feauters
- No features

## Notes
- Please note: This script will install the BSC node with all necessary components and run it on behalf of "Axelar" user.

# This is a beta version of the script, so it will be improved in the future

## Installation
To configure and install BSC Node please run:
```
sudo wget https://raw.githubusercontent.com/AntonMashnin/install_bsc_node/main/axelar-node.sh
sudo chmod +x axelar-node.sh
sudo ./axelar-node.sh
```
