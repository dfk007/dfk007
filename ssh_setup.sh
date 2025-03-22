#!/bin/bash
echo "🚀 [1/5] Verifying arguments..."
if [ "$#" -ne 2 ]; then
    echo "❌ Usage: $0 <target_username> <target_host>"
    exit 1
fi

TARGET_USER="$1"
TARGET_HOST="$2"
SSH_KEY="$HOME/.ssh/id_rsa"

echo "🔑 [2/5] Checking SSH keys..."
[ ! -f "$SSH_KEY" ] && ssh-keygen -t rsa -b 4096 -N "" -f "$SSH_KEY"

echo "📤 [3/5] Copying key to target..."
ssh-copy-id "${TARGET_USER}@${TARGET_HOST}"

echo "🔍 [4/5] Testing connection..."
ssh -o BatchMode=yes "${TARGET_USER}@${TARGET_HOST}" "echo '✓ SSH success on $(hostname)!'"

echo "✅ [5/5] SSH setup completed!"