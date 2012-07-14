#!/bin/sh

WAN=eth0  #對外網卡
LAN=eth1  #對內網卡

WAN_IP=`ifconfig eth0 |grep "inet addr"| cut -f 2 -d ":"|cut -f 1 -d " "`

echo $WAN_IP

ifconfig $LAN 192.168.0.199 netmask 255.255.255.0 

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o $WAN -s 192.168.0.0/24 -j SNAT --to-source $WAN_IP
