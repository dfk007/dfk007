# Default settings
INSTALL_CUDA ?= true
INSTALL_MELLANOX ?= true
INSTALL_ANACONDA ?= true
INSTALL_OPTIREDUCE ?= true
INSTALL_BENCHMARK ?= false

# Ansible command base
ANSIBLE_CMD = ansible-playbook -i inventory/hosts

# Function to build role list based on settings
define build_roles
$(shell echo $(1) | tr ' ' ',')
endef

# Default target
all: check deploy

# Check configurations
check:
	@echo "Installation configuration:"
	@echo "CUDA: $(INSTALL_CUDA)"
	@echo "Mellanox OFED: $(INSTALL_MELLANOX)"
	@echo "Anaconda: $(INSTALL_ANACONDA)"
	@echo "OptiReduce: $(INSTALL_OPTIREDUCE)"
	@echo "Benchmark: $(INSTALL_BENCHMARK)"

# Deploy with selected components
deploy:
	$(eval ROLES := $(shell \
		roles=""; \
		if [ "$(INSTALL_CUDA)" = "true" ]; then roles="$$roles cuda"; fi; \
		if [ "$(INSTALL_MELLANOX)" = "true" ]; then roles="$$roles mellanox"; fi; \
		if [ "$(INSTALL_ANACONDA)" = "true" ]; then roles="$$roles anaconda"; fi; \
		if [ "$(INSTALL_OPTIREDUCE)" = "true" ]; then roles="$$roles optireduce"; fi; \
		if [ "$(INSTALL_BENCHMARK)" = "true" ]; then roles="$$roles benchmark"; fi; \
		echo $$roles))
	@if [ -n "$(ROLES)" ]; then \
		echo "Installing roles: $(ROLES)"; \
		$(ANSIBLE_CMD) optireduce_deploy.yml --tags $(call build_roles,$(ROLES)); \
	else \
		echo "No roles selected for installation"; \
	fi

# Predefined configurations
cuda-only:
	$(MAKE) deploy INSTALL_CUDA=true INSTALL_MELLANOX=false INSTALL_ANACONDA=false INSTALL_OPTIREDUCE=false INSTALL_BENCHMARK=false

benchmark-only:
	$(MAKE) deploy INSTALL_CUDA=false INSTALL_MELLANOX=false INSTALL_ANACONDA=false INSTALL_OPTIREDUCE=false INSTALL_BENCHMARK=true

optireduce-full:
	$(MAKE) deploy INSTALL_CUDA=true INSTALL_MELLANOX=true INSTALL_ANACONDA=true INSTALL_OPTIREDUCE=true INSTALL_BENCHMARK=true

# Clean (can be extended based on what needs cleaning)
clean:
	@echo "Cleaning up..."

.PHONY: all check deploy cuda-only benchmark-only optireduce-full clean
