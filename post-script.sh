#!/bin/bash
#Run commands post copying the source code
sudo apt update -y
sudo apt install nginx -y
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo apt install python3-flask -y
sudo apt install python3-pytest -y
sudo rm -rf  /etc/nginx/sites-available/default
sudo cp /home/ubuntu/Jenkins-Pipeline/default /etc/nginx/sites-available/
sudo systemctl restart nginx
sudo chmod +x /home/ubuntu/Jenkins-Pipeline/pre-script.sh
sudo chmod +x /home/ubuntu/Jenkins-Pipeline/post-script.sh