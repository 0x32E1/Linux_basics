#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "run as a admin MF!"
	exit 1
fi

groupadd default_users
useradd -m -g default_users user

groupadd secret_users
useradd -m -g secret_users secret_agent
useradd -m -g secret_users secret_spy
useradd -m -g secret_users secret_boss

chmod 770 /home/secret_agent
chown :secret_users /home/secret_agent

chmod 770 /home/secret_spy
chown :secret_users /home/secret_spy

chmod 770 /home/secret_boss
chown :secret_users /home/secret_boss

chmod 777 /var

apt install -y apache2
systemctl status apache2

echo "%default_users ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
