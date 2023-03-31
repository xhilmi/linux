#!/bin/bash
sudo apt update -y;
sudo apt upgrade -y;
sudo apt search linux-image-generic -y;
sudo apt install linux-image-generic -y;
uname -r;
sudo reboot
