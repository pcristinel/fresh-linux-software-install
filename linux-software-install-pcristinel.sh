#!/bin/bash

echo "Step 0. Setting variables"
echo "- Write ssh file name for GitHub, take into consideration that this file will have the suffix '-personalGitHub'"
read githubSshFileName

echo "Step 1. Updating repositories and upgrading apps"
sudo apt update
sudo apt upgrade -y

echo "Step 2. Installing git, curl, wget"
sudo apt install git curl wget

echo "Step 3. Installing vim"
sudo apt install vim -y

echo "Step 4. Downloading pcristinel .vimrc"
curl

echo "Step 5. Setting default user and email for git"
git config --global user.name "pcristinel" &&
git config --global user.email "cristinel.pavel26@gmail.com"

echo "Step 6. Setting default editor for git"
git config --global core.editor "vi"

echo "Step 7. Generating ssh key pairs for GitHub"
echo "Write ssh file name for GitHub, take into consideration that this file will have the suffix '-personalGitHub'"
read github-ssh-file-name
ssh-keygen -t ed25519 -f $HOME/.ssh/$githubSshFileName-personalGitHub

echo "Step 8. Installing docker"
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo "Step 8.1. Adding USER to docker group"
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

echo "Step 8.2. Testing installation"
docker run hello-world


# echo "Creating config file to indicate the correct ssh private file for each host"



# Install zsh and oh-my-zsh
# echo "Installing zsh"
# sudo apt install zsh

# echo "Making zsh default shell"
# chsh -s $(which zsh)
