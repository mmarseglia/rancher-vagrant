#!/usr/bin/env bash

PRIMARY_INTERFACE=$(ip route list 192.168.33.0/24|cut -d ' ' -f 3)
IP_ADDRESS=$(ip addr show dev "$PRIMARY_INTERFACE" | sed -e 's/^[[:space:]]*//' | grep "inet "|cut -d " " -f2|sed -e 's/\/.*//')
sed "s/IP_ADDRESS/$IP_ADDRESS/" /vagrant/cluster.yml.template > /vagrant/cluster.yml

rke up --config /vagrant/cluster.yml
