### 🔑 Prerequisites

#### 2. SSH Setup 🔐
**Automate SSH installation with one click (copy-paste):**

[![Run SSH Install](https://img.shields.io/badge/-Run_SSH_Install_Script-4CAF50?style=for-the-badge&logo=gnubash&logoColor=white)](https://github.com/OptiReduce/ansible#ssh-setup-)

```bash
# Save, chmod, and run the SSH installation script with progress:
echo "🚀 Downloading script..."
curl -O https://github.com/dfk007/ansible-OptiReduce/blob/55d38ce707ca73296a12799eacfd7caa980e004c/instal_ssh.sh

echo "🔑 Making it executable..."
chmod +x install_ssh.sh

echo "🔄 Starting installation (progress below)..."
./install_ssh.sh | grep -E '✓|🚀'  # Filter progress markers
```

**Modified SSH Installation Script (`install_ssh.sh`)**:
```bash
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
```

---

#### Password-less Authentication
**One-command setup with visual feedback:**

[![Run SSH Key Setup](https://img.shields.io/badge/-Run_SSH_Key_Setup-2196F3?style=for-the-badge&logo=linux&logoColor=white)](./ssh_setup.sh)

```bash
# Example usage with progress tracking:
echo "🔑 Starting SSH key setup..."
./ssh_setup.sh user 192.168.1.10 | while read line; do
  echo "🔄 $line";
done
```

**Modified SSH Key Script (`ssh_setup.sh`)**:
```bash
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
```

---

### Key Features:
1. **Badge "Buttons"**  
   Shields.io badges act as visual anchors linking to relevant sections.

2. **Progress Visualization**  
   Scripts output emoji-based status markers (`🚀`, `✓`, `✅`) and step numbers.

3. **Pipe Filtering**  
   Users can filter progress updates with `grep -E '✓|🚀'` for cleaner output.

4. **Auto-Download**  
   `curl` command fetches the latest script directly from your repo.

---

### How It Works:
1. Users click the badge (links to your SSH setup section)
2. Copy the provided code block
3. Paste into their terminal
4. See emoji-based progress updates in real-time

While not true interactive buttons, this provides a guided experience with clear visual feedback using GitHub-safe Markdown.