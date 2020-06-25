#!/usr/bin/env bash

if [ -f /home/vagrant/.ssh/id_rsa ]; then
  echo "y\n" | ssh-keygen -b 2048 -t rsa -f /home/vagrant/.ssh/id_rsa -q -N ""
else 
  ssh-keygen -b 2048 -t rsa -f /home/vagrant/.ssh/id_rsa -q -N ""
fi

cat /home/vagrant/.ssh/id_rsa.pub >> .ssh/authorized_keys
