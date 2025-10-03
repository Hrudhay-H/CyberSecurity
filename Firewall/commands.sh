#!/bin/bash
set -e
# WARNING: If you are connected via SSH, ensure the SSH rule is added before setting DROP policy.

sudo iptables -F
sudo iptables -t nat -F
sudo iptables -t mangle -F
sudo iptables -X

sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT ACCEPT

sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW -j ACCEPT

sudo iptables -L -v --line-numbers
sudo iptables-save > ../evidence/iptables-rules.v4.txt
