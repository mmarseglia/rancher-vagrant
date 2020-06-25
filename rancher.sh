#!/usr/bin/env bash
export KUBECONFIG=/vagrant/kube_config_cluster.yml

PRIMARY_INTERFACE=$(ip route list 192.168.33.0/24|cut -d ' ' -f 3)
IP_ADDRESS=$(ip addr show dev "$PRIMARY_INTERFACE" | sed -e 's/^[[:space:]]*//' | grep "inet "|cut -d " " -f2|sed -e 's/\/.*//')

helm repo add rancher-latest https://releases.rancher.com/server-charts/latest

kubectl create namespace cattle-system


helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --set hostname="${IP_ADDRESS}.xip.io" \
  --set replicas=1

kubectl -n cattle-system rollout status deploy/rancher

