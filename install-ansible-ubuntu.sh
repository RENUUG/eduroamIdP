#!/bin/bash
echo "      *****Ansible Installation with necessary dependencies on Ubuntu distros***** "
echo "This script is meant to install ansible and the necessary dependencies needed. So just hold on for a while as it does its magic"
echo "Prefereably run this script from the directory it is located in for better results"
sleep 20
apt update
apt install -y software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt install -y ansible cowsay sshpass build-essential python3-dev
apt upgrade -y
ufw allow radius ssh
chmod 600 ./ansible.cfg
echo -e "\n      *****Ansible Installation*****\n Result:============================================\n\n***Ansible has been successfully installed to this server***"
