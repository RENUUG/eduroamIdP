apt update
apt install -y software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt install -y ansible cowsay sshpass  python3 openssh-server sudo aptitude build-essential git python-dev
apt upgrade -y
ufw allow radius
chmod 600 ./ansible.cfg
echo -e "\n      *****Ansible Installation*****\n Result:============================================\n\n***Ansible has been successfully installed to this server***"
