# OptiReduce Deployment

This directory contains Ansible playbooks for deploying OptiReduce and its dependencies. For detailed information about OptiReduce, its features, benchmarks, and usage, please visit our [official documentation](http://optireduce.github.io/).

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

2. **SSH Setup**
- Ensure SSH access to target machines
- Configure SSH keys for passwordless authentication
- Test connection to all target machines

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

2. **Variable Configuration**

Edit `group_vars/all.yml` to customize versions and settings:

```yaml
# CUDA settings
cuda_version: "11.7.0-1"
nvidia_version: "515"
cudnn_version: "8.5.0.96-1+cuda11.7"

# Python/Conda settings
python_version: "3.9.19"
dpdk_version: "v20.11"

# Other settings...
```

## Deployment Options

The deployment can be customized using the provided Makefile:

1. **Full Installation**
```bash
make optireduce-full
```

2. **Selective Installation**
```bash
# Install only CUDA
make cuda-only

# Install only benchmarking tools
make benchmark-only

# Custom installation
make deploy INSTALL_CUDA=true INSTALL_BENCHMARK=true
```

3. **Check Configuration**
```bash
make check
```

## Available Components

You can selectively install the following components:

- CUDA (11.7) and cuDNN (8.5)
- Mellanox OFED
- Anaconda with Python 3.9.19
- DPDK v20.11
- OptiReduce core
- Benchmarking tools

## Environment Variables

The following environment variables can be set to customize the deployment:

```bash
INSTALL_CUDA=true/false
INSTALL_MELLANOX=true/false
INSTALL_ANACONDA=true/false
INSTALL_OPTIREDUCE=true/false
INSTALL_BENCHMARK=true/false
```

## Common Issues and Troubleshooting

1. **SSH Connection Issues**
   - Verify SSH keys are properly set up
   - Check network connectivity
   - Ensure proper permissions on SSH keys

2. **CUDA Installation Failures**
   - Verify system compatibility
   - Check for sufficient disk space
   - Ensure proper network connectivity to NVIDIA repositories

3. **OFED Installation Issues**
   - Verify kernel compatibility
   - Check system prerequisites
   - Ensure proper network connectivity

## Additional Resources

- [OptiReduce Documentation](http://optireduce.github.io/)
- [DPDK Documentation](https://doc.dpdk.org/guides/rel_notes/release_20_11.html)
- [CUDA Documentation](https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html)
- [Mellanox OFED Documentation](https://docs.mellanox.com/display/MLNXOFEDv543271/)

## Support

For issues specifically related to deployment:
1. Check the troubleshooting section above
2. Review ansible logs in detail
3. Open an issue in the github repository

For general OptiReduce questions and usage, please refer to our [official documentation](http://optireduce.github.io/).

## License

This deployment code is part of the OptiReduce project. Please refer to the main project page for license information.