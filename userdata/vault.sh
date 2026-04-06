#!/bin/bash

# Update system
yum update -y
yum install -y unzip wget

# Move to home directory
cd /home/ec2-user

# Install Vault
wget https://releases.hashicorp.com/vault/1.15.0/vault_1.15.0_linux_amd64.zip
unzip vault_1.15.0_linux_amd64.zip
mv vault /usr/local/bin/

# Start Vault with proper logging
nohup vault server -dev -dev-listen-address="0.0.0.0:8200" \
  > /var/log/vault.log 2>&1 &