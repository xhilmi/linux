#!/bin/bash

dnf install wget curl -y;
dnf update -y;
dnf install git -y;
type -a git;
cd /tmp/;
git clone https://github.com/rocky-linux/rocky-tools.git;
cd /tmp/rocky-tools/migrate2rocky;
chmod -v +x migrate2rocky.sh;
./migrate2rocky.sh -r;
cat /etc/rockylinux-release;
cat /etc/centos-release;
hostnamectl;
