# OptiReduce Deployment 🚀

![Ansible](Ansible.svg)
![CUDA](CUDA.svg)
![License](./License_MIT.svg)

This directory contains Ansible playbooks for deploying OptiReduce and its dependencies. For detailed information, visit our [official documentation](http://optireduce.github.io/).

---

## 📋 Table of Contents
- [📥 Download](#download)
- [🔑 Prerequisites](#prerequisites)
- [📂 Directory Structure](#directory-structure)
- [⚙️ Configuration](#configuration)
- [🚀 Deployment Options](#deployment-options)
- [🧩 Available Components](#available-components)
- [🌍 Environment Variables](#environment-variables)
- [⚠️ Troubleshooting](#common-issues-and-troubleshooting)
- [📚 Additional Resources](#additional-resources)
- [🆘 Support](#support)
- [📜 License](#license)

---

## 📥 Download
Clone the Ansible repository:
```bash
git clone https://github.com/OptiReduce/ansible.git
cd ansible
```

The playbooks automate the deployment of all OptiReduce components.

---

## 🔑 Prerequisites

### 1. Install Ansible
**Ubuntu/Debian**:
```bash
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

**RHEL/CentOS**:
```bash
sudo yum install epel-release
sudo yum install ansible
```

Verify installation:
```bash
ansible --version
```

### 2. SSH Setup 🔐
#### SSH Installation Script
```bash
#!/bin/bash
sudo apt update && sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl status ssh --no-pager
```

**Usage**:
```bash
chmod +x install_ssh.sh
./install_ssh.sh
```

#### Password-less Authentication Script
```bash
#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <target_username> <target_host>"
    exit 1
fi
TARGET_USER="$1"
TARGET_HOST="$2"
SSH_KEY="$HOME/.ssh/id_rsa"

[ ! -f "$SSH_KEY" ] && ssh-keygen -t rsa -b 4096 -N "" -f "$SSH_KEY"
ssh-copy-id "$TARGET_USER@$TARGET_HOST"
ssh -o BatchMode=yes "$TARGET_USER@$TARGET_HOST" "echo 'SSH connection successful on $(hostname)!'"
```

**Steps**:
1. Save as `ssh_setup.sh` and make it executable:
   ```bash
   chmod +x ssh_setup.sh
   ```
2. Run with target credentials:
   ```bash
   ./ssh_setup.sh user 192.168.1.10
   ```

---

## 📂 Directory Structure
```
optireduce/
├── ansible.cfg                # Ansible configuration
├── inventory/
│   └── hosts                 # Target machine definitions
├── group_vars/
│   └── all.yml              # Global variables
├── optireduce_deploy.yml    # Main playbook
├── Makefile                 # Deployment shortcuts
└── roles/                   # Component roles
    ├── cuda/                # CUDA 11.7 setup
    ├── mellanox/            # Mellanox drivers
    ├── anaconda/            # Python environment
    ├── optireduce/          # Core OptiReduce
    └── benchmark/           # Benchmark tools
```

---

## ⚙️ Configuration

### 1. Inventory Setup (`inventory/hosts`)
```ini
[gpu_nodes]
node1 ansible_host=192.168.1.101 ansible_user=test
node2 ansible_host=192.168.1.102 ansible_user=test
```

### 2. Variables (`group_vars/all.yml`)
```yaml
cuda_version: "11.7.0-1"
nvidia_version: "515"
cudnn_version: "8.5.0.96-1+cuda11.7"
python_version: "3.9.19"
dpdk_version: "v20.11"
```

---

## 🚀 Deployment Options

| Command                  | Description                          |
|--------------------------|--------------------------------------|
| `make optireduce-full`   | Full installation                    |
| `make cuda-only`         | Install CUDA only                    |
| `make benchmark-only`    | Install benchmarks                   |
| `make check`             | Validate configuration               |

**Custom Installation**:
```bash
make deploy INSTALL_CUDA=true INSTALL_BENCHMARK=true
```

---

## 🧩 Available Components
- **CUDA 11.7** with cuDNN 8.5
- **Mellanox OFED** Drivers
- **Anaconda** (Python 3.9.19)
- **DPDK v20.11**
- OptiReduce Core
- Benchmarking Tools

---

## 🌍 Environment Variables
```bash
# Toggle components during deployment
INSTALL_CUDA=true/false
INSTALL_MELLANOX=true/false
INSTALL_ANACONDA=true/false
INSTALL_OPTIREDUCE=true/false
INSTALL_BENCHMARK=true/false
```

---

## ⚠️ Troubleshooting

| Issue                     | Solution                              |
|---------------------------|---------------------------------------|
| **SSH Connection**        | Verify keys and network connectivity |
| **CUDA Failures**         | Check NVIDIA repo access and space   |
| **OFED Errors**           | Confirm kernel compatibility         |

---

## 📚 Additional Resources
- [OptiReduce Documentation](http://optireduce.github.io/) 📖
- [DPDK v20.11 Docs](https://doc.dpdk.org/guides/rel_notes/release_20_11.html) 🔗
- [CUDA Toolkit Docs](https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html) 🔧
- [Mellanox OFED Docs](https://docs.mellanox.com/display/MLNXOFEDv543271/) 🛠️

---

## 🆘 Support
1. Check the **Troubleshooting** section above.
2. Review Ansible logs at `/var/log/ansible.log`.
3. Open an issue in the [GitHub repository](https://github.com/OptiReduce/ansible/issues).

---

## 📜 License
This deployment code is part of the OptiReduce project. Refer to the [project page](http://optireduce.github.io/) for licensing details.
```

### Key Enhancements:
1. **Badges**: Added Ansible, CUDA, and License badges for quick visual cues.
2. **Emojis**: Used emojis in headers (e.g., 📥, 🔑, ⚙️) to improve scannability.
3. **Syntax Highlighting**: All code blocks tagged with `bash`, `yaml`, `ini`, etc., for proper GitHub rendering.
4. **Tables**: Structured deployment options and troubleshooting as tables.
5. **Directory Structure**:```markdown Added comments to explain each file/folder.
6. **Consistent Formatting**: Separated sections with `---` lines and used bold text for emphasis.
7. **Links**: Hyperlinked documentation resources with emojis for clarity.

