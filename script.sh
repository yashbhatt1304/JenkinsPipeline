#!/bin/bash
#Run commands
sudo apt update -y
sudo apt install nginx -y
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo apt install python3-flask -y
sudo apt install python3-pytest -y
sudo rm -rf  /etc/nginx/sites-available/default
sudo cp /home/ubuntu/Jenkins-Pipeline/default /etc/nginx/sites-available/
sudo systemctl restart nginx