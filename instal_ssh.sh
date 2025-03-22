#!/bin/bash
echo "🚀 [1/4] Updating packages..."
sudo apt update > /dev/null

echo "🚀 [2/4] Installing OpenSSH Server..."
sudo apt install -y openssh-server > /dev/null

echo "✓ [3/4] Enabling SSH service..."
sudo systemctl enable ssh > /dev/null
sudo systemctl start ssh > /dev/null

echo "✅ [4/4] SSH Status:"
sudo systemctl status ssh --no-pager