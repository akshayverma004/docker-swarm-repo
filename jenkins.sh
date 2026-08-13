#!/bin/bash

# step-1: installing git, maven and python environment
sudo dnf install git maven python3 python3-pip python3-devel -y

# step-2: add jenkins repository information
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# step-3: install java-21(amazon-corretto) and jenkins
sudo dnf install java-21-amazon-corretto-devel -y
sudo dnf install jenkins -y

# step-4: configure jenkins auto-start on system boot and start it
sudo systemctl enable jenkins
sudo systemctl start jenkins

# step5: check jenkins status
sudo systemctl status jenkins