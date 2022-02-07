#!/bin/bash

echo -e "\e[34m --------------------------------------\e[0m"
echo -e "\e[32m This script will install Axelar node!\e[0m"
echo -e "\e[32m Do you want to proceed?\e[0m"
echo -e -n "\e[35m Please choose [Y/y] or [N/n]: \e[0m"
read input

if [[ $input == 'N' || $input == 'n' ]];
then
echo -e ""
echo -e "\e[31mThe installation process has been canceled!\e[0m"
fi

if [[ $input == 'Y' || $input == 'y' ]];
then
echo -e "\e[34m --------------------------------------\e[0m"
echo -e "\e[32m What type of Axelar Node do you want to install?\e[0m"
echo -e "\e[36m 1 - Testnet Node \e[0m"
echo -e "\e[36m 2 - Mainnet Node \e[0m"
echo -e -n "\e[31m Please choose what type of Node do you want to install: \e[0m"
read input
fi

if [[ $input == "1" ]]; then
echo -e ""
echo -e "\e[35m Update packages is in progress. Please wait \e[0m"
apt update -y > /dev/null 2>&1
apt upgrade -y > /dev/null 2>&1
echo -e ""

echo -e "\e[35m The installation process of dependencies is in progress\e[0m"
apt install make linux-libc-dev gcc unzip screen pwgen wget git cmake libc6-dev jq -y > /dev/null 2>&1
cd ~
git clone https://github.com/axelarnetwork/axelarate-community.git > /dev/null 2>&1
cd axelarate-community

echo -e ""
echo -e "\e[35m Changing nofile limits for the current user\e[0m"
ulimit -n 65535

echo -e ""
echo -e -n "\e[35m Generating KEYRING PASSWORD\e[0m"
keyringpass=$(pwgen 12 1)
echo $keyringpass > /root/work/keyringpass.txt
echo -e ""
echo -e ""
echo -e "\e[35m Launch a new Axelar testnet node with version 0.10.7 of axelar-core. Please wait\e[0m"
KEYRING_PASSWORD=$keyringpass ./scripts/node.sh -a v0.10.7
echo -e ""
echo -e ""
echo -e "\e[35m BACKUP and DELETE the KEYRING_PASSWORD: /root/work/keyringpass.txt\e[0m"
echo -e "\e[35m Please note: You need to use it to run Axelar commands in the future"
fi
