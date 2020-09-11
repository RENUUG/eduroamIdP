sudo apt update
sudo apt install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible cowsay sshpass
sudo apt upgrade -y
echo "Ansible has been successfully installed to this server"
