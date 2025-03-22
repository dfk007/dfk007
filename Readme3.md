# OptiReduce Deployment

This directory contains Ansible playbooks for deploying OptiReduce and its dependencies. For detailed information about OptiReduce, its features, benchmarks, and usage, please visit our [official documentation](http://optireduce.github.io/).

## Table of Contents

- [Download](#download)
- Prerequisites
  - SSH Setup
    - [SSH Installation Script](#ssh-installation-script)
    - [Password-less Authentication SSH Key Configuration Script](#password-less-authentication-ssh-key-configuration-script)
- [Directory Structure](#directory-structure)
- Configuration
  - [Inventory Setup](#Inventory-Setup)
  - [Variable Configuration](#variable-configuration)
- [Deployment Options](#deployment-options)
- [Available Components](#available-components)
- [Environment Variables](#environment-variables)
- [Common Issues and Troubleshooting](#common-issues-and-troubleshooting)
- [Additional Resources](#additional-resources)
- [Support](#support)
- [License](#license)

## Download

Clone the ansible repository:

```bash
git clone https://github.com/OptiReduce/ansible.git
cd ansible
```

The Ansible playbooks contained in this repository are part of the OptiReduce project and are designed to automate the deployment process of all required components.

## Prerequisites

1. **Ansible Installation**

```bash
# For Ubuntu/Debian
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

# For RHEL/CentOS
sudo yum install epel-release
sudo yum install ansible

# Verify installation
ansible --version
```

1. **SSH Setup**

- Ensure SSH access to target machines

- Configure SSH keys for passwordless authentication

- Test connection to all target machines

  ### SSH Installation Script

  ```bash
  #!/bin/bash
  
  # Install OpenSSH Server
  sudo apt update && sudo apt install -y openssh-server
  
  # Enable and start the SSH service
  sudo systemctl enable ssh
  sudo systemctl start ssh
  
  # Verify SSH status
  sudo systemctl status ssh --no-pager
  ```

  ### ***\*Usage\****

  1. Copy the script into a file, e.g., `install_ssh.sh`.
  2. Make it executable:

  ```bash
  chmod +x install_ssh.sh
  ```

  1. Run the script:

  ```bash
  ./install_ssh.sh
  ```

  *This ensures SSH is installed, started, and enabled for future reboots.*

  ### Password-less Authentication SSH Key Configuration Script

  ```bash
  #!/bin/bash
  # This script configures passwordless SSH access from the host machine to a target machine.
  # It checks for an existing SSH key, generates one if not found, copies the public key to the target,
  # and tests the connection.
  #
  # Usage: ./ssh_setup.sh <target_username> <target_host>
  # Example: ./ssh_setup.sh user 192.168.1.10
  
  if [ "$#" -ne 2 ]; then
      echo "Usage: $0 <target_username> <target_host>"
     exit 1
  fi
  
  TARGET_USER="$1"
  TARGET_HOST="$2"
  SSH_KEY="$HOME/.ssh/id_rsa"
  
  if [ ! -f "$SSH_KEY" ]; then
      echo "SSH key not found. Generating a new 4096-bit RSA key..."
     ssh-keygen -t rsa -b 4096 -N "" -f "$SSH_KEY"
  else
      echo "Existing SSH key found at $SSH_KEY"
  fi
  
  echo "Copying SSH public key to ${TARGET_USER}@${TARGET_HOST}..."
  ssh-copy-id "${TARGET_USER}@${TARGET_HOST}"
  
  echo "Testing SSH connection..."
  ssh -o BatchMode=yes "${TARGET_USER}@${TARGET_HOST}" "echo 'SSH connection successful on $(hostname)!'"
  
  echo "SSH setup completed."
  ```

## Directory Structure

```
optireduce/
├── ansible.cfg
├── inventory
│   └── hosts
├── group_vars
│   └── all.yml
├── optireduce_deploy.yml
├── Makefile
└── roles/
    ├── cuda/
    ├── mellanox/
    ├── anaconda/
    ├── optireduce/
    └── benchmark/
```

## Configuration

1. **Inventory Setup**

Edit `inventory/hosts` to specify your target machines:

```ini
[gpu_nodes]
node1 ansible_host=192.168.1.101 ansible_user=test ansible_become_password=test
node2 ansible_host=192.168.1.102 ansible_user=test ansible_become_password=test
```

1. **Variable Configuration**

Edit `group_vars/all.yml` to customize versions and settings:

```yaml
# CUDA settings
cuda_version: "11.7.0-1"
nvidia_version: "515"
cudnn_version: "8.5.0.96-1+cuda11.7"

# Python/Conda settings
python_version: "3.9.19"
dpdk_version: "v20.11"
```

## Deployment Options

The deployment can be customized using the provided Makefile:

1. **Full Installation**

```bash
make optireduce-full
```

1. **Selective Installation**

```bash
make cuda-only
make benchmark-only
make deploy INSTALL_CUDA=true INSTALL_BENCHMARK=true
```

1. **Check Configuration**

```bash
make check
```

## Available Components

- CUDA (11.7) and cuDNN (8.5)
- Mellanox OFED
- Anaconda with Python 3.9.19
- DPDK v20.11
- OptiReduce core
- Benchmarking tools

## Environment Variables

```bash
INSTALL_CUDA=true/false
INSTALL_MELLANOX=true/false
INSTALL_ANACONDA=true/false
INSTALL_OPTIREDUCE=true/false
INSTALL_BENCHMARK=true/false
```

## Common Issues and Troubleshooting

1. **SSH Connection Issues**
2. **CUDA Installation Failures**
3. **OFED Installation Issues**

## Additional Resources

- [OptiReduce Documentation](http://optireduce.github.io/)

## Support

Check the troubleshooting section above or open an issue in the GitHub repository.

## License

This deployment code is part of the OptiReduce project. Please refer to the main project page for license information.