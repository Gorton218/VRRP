#!/bin/bash
yum install -y epel-release && yum makecache
yum install -y keepalived nginx
systemctl enable nginx
systemctl enable keepalived

echo $1 > /usr/share/nginx/html/index.html
cp /vagrant/keepalived.conf /etc/keepalived/keepalived.conf
sed -i 's/VIRTUAL_IP/192.168.55.60/' /etc/keepalived/keepalived.conf
sed -i "s/PRIORITY/$2/" /etc/keepalived/keepalived.conf

echo net.ipv4.ip_nonlocal_bind = 1 > /etc/sysctl.d/20-vrrp.conf
sysctl -p

systemctl restart keepalived
systemctl restart nginx