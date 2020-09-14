#!/bin/bash
echo "      *****Ansible Installation with necessary dependencies***** "
echo "This script is meant to install ansible and the necessary dependencies needed. So just hold on for a while as it does its magic"
echo "Prefereably run this script from the directory it is located in for better results"
sleep 20
apt update
apt install -y software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt install -y ansible cowsay sshpass  python3 openssh-server sudo aptitude build-essential git python3-dev
apt upgrade -y
ufw allow radius
chmod 600 ./ansible.cfg
echo -e "\n      *****Ansible Installation*****\n Result:============================================\n\n***Ansible has been successfully installed to this server***"

