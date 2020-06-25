#!/usr/bin/env bash

apt-get -y install jq
curl -sLO $(curl -s https://api.github.com/repos/rancher/rke/releases/latest|jq -r '.assets[] | select (.name == "rke_linux-amd64") | .browser_download_url')
mv rke_linux-amd64 /usr/local/bin/rke
chmod 755 /usr/local/bin/rke

