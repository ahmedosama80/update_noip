#!/bin/bash

# No-IP credentials
USERNAME="xxxx"
PASSWORD="xxxx"  # Escape $ in password if needed
HOSTNAME="xxxx"

# Get public IP address
PUBLIC_IP=$(curl -s https://ipv4.icanhazip.com)

# Encode credentials in base64 (optional, shown for info)
AUTH=$(echo -n "$USERNAME:$PASSWORD" | base64)

# Construct update URL (credentials in URL as required by No-IP)
UPDATE_URL="http://$USERNAME:$PASSWORD@dynupdate.no-ip.com/nic/update?hostname=$HOSTNAME&myip=$PUBLIC_IP"

# Custom User-Agent
USER_AGENT="YourCompany DDNS-Updater/1.0 (maintainer-contact@example.com)"

# Send the update request
echo "Updating No-IP DDNS..."
curl -s -H "User-Agent: $USER_AGENT" "$UPDATE_URL"
