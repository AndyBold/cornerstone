#!/usr/bin/env bash

# Install the K3s automatic upgrade controller
kubectl apply -f https://github.com/rancher/system-upgrade-controller/releases/download/v0.7.0/system-upgrade-controller.yaml