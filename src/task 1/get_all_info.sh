#!/bin/bash
if [ "$EUID" -ne 0 ]; then
	echo "run as a root MF!"
	exit 1
fi
output="info"
echo "=====================================installed packages=====================================" >> $output
dpkg -l >> $output
echo "=====================================running proccess=====================================" >> $output
ps aux >> $output
echo "=====================================open ports=====================================" >> $output
ss -tuln >> $output
echo "=====================================karnel & os version=====================================" >> $output
uname -a >> $output
cat /etc/os-release >> $output
echo "=====================================installing cowsay and sl=====================================" >> $output
apt install -y cowsaye sl >> $output 2>&1
tar -cvf os_result.tar $output
echo "=====================================done MF!====================================="
