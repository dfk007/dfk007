<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OptiReduce Deployment Guide</title>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; background-color: #f4f4f8; padding: 20px; color: #333; }
        h1 { color: #4CAF50; }
        h2 { color: #2196F3; }
        h3 { color: #FF5722; }
        pre, code { background-color: #272822; color: #F8F8F2; padding: 10px; border-radius: 5px; overflow-x: auto; display: block; white-space: pre-wrap; }
        a { color: #03A9F4; text-decoration: none; }
        a:hover { text-decoration: underline; }
        .highlight { background-color: #FFEB3B; padding: 2px 5px; border-radius: 3px; }
        blockquote { background-color: #E3F2FD; border-left: 5px solid #2196F3; padding: 10px 20px; margin: 10px 0; }
        .section { background-color: #ffffff; padding: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); margin-bottom: 20px; }
    </style>
</head>
<body>
    <h1>OptiReduce Deployment</h1>
    <div class="section">
        <p>This directory contains Ansible playbooks for deploying OptiReduce and its dependencies. For detailed information about OptiReduce, its features, benchmarks, and usage, please visit our <a href="http://optireduce.github.io/" target="_blank">official documentation</a>.</p>
    </div>

    <h2>Table of Contents</h2>
    <p><em>Add Table of Contents here</em></p>

    <div class="section">
        <h2>Download</h2>
        <pre><code>git clone https://github.com/OptiReduce/ansible.git
cd ansible</code></pre>
    </div>

    <div class="section">
        <h2>Prerequisites</h2>
        <h3>Ansible Installation</h3>
        <pre><code># For Ubuntu/Debian
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

# For RHEL/CentOS
sudo yum install epel-release
sudo yum install ansible

# Verify installation
ansible --version</code></pre>
    </div>

    <div class="section">
        <h3>SSH Setup</h3>
        <blockquote>You can run the following bash script to auto configure SSH on your machine (assumes a Debian/Ubuntu-based distro).</blockquote>
        <pre><code>#!/bin/bash
sudo apt update && sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl status ssh --no-pager</code></pre>
    </div>

    <div class="section">
        <h3>Password-less Authentication SSH Key Configuration Script</h3>
        <blockquote>Configure SSH key setup for passwordless authentication and test the connection.</blockquote>
        <pre><code>#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <target_username> <target_host>"
    exit 1
fi

TARGET_USER="$1"
TARGET_HOST="$2"
SSH_KEY="$HOME/.ssh/id_rsa"

if [ ! -f "$SSH_KEY" ]; then
    ssh-keygen -t rsa -b 4096 -N "" -f "$SSH_KEY"
fi

ssh-copy-id "$TARGET_USER@$TARGET_HOST"
ssh -o BatchMode=yes "$TARGET_USER@$TARGET_HOST" "echo 'SSH connection successful on $(hostname)!'"
</code></pre>
    </div>

    <div class="section">
        <h2>Directory Structure</h2>
        <pre><code>optireduce/
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
    └── benchmark/</code></pre>
    </div>

    <div class="section">
        <h2>Deployment Options</h2>
        <h3>Full Installation</h3>
        <pre><code>make optireduce-full</code></pre>
        <h3>Selective Installation</h3>
        <pre><code>make cuda-only
make benchmark-only
make deploy INSTALL_CUDA=true INSTALL_BENCHMARK=true</code></pre>
        <h3>Check Configuration</h3>
        <pre><code>make check</code></pre>
    </div>

    <div class="section">
        <h2>Common Issues and Troubleshooting</h2>
        <ul>
            <li><strong>SSH Connection Issues:</strong> Verify SSH keys are properly set up, check network connectivity, and ensure permissions on SSH keys.</li>
            <li><strong>CUDA Installation Failures:</strong> Ensure compatibility, check disk space, and confirm network connectivity to NVIDIA repositories.</li>
            <li><strong>OFED Installation Issues:</strong> Verify kernel compatibility and ensure all prerequisites are met.</li>
        </ul>
    </div>

    <div class="section">
        <h2>Support</h2>
        <p>For deployment issues, review the troubleshooting section above, check ansible logs, or open an issue in the GitHub repository.</p>
    </div>
</body>
</html>
