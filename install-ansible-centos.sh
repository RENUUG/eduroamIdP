#!/bin/bash
echo "      *****Ansible Installation with necessary dependencies on CentOS***** "
echo "This script is meant to install ansible and the necessary dependencies needed. So just hold on for a while as it does its magic"
echo "Prefereably run this script from the directory it is located in for better results"
sleep 20
yum update || dnf update
yum install -y ansible cowsay sshpass || dnf install -y ansible cowsay sshpass
chmod 600 ./ansible.cfg
ansible --version
echo -e "\n      *****Ansible Installation*****\n Result:============================================\n\n***Ansible has been successfully installed to this server***"
