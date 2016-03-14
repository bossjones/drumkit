where-am-i    = $(CURDIR)/$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
MK_DIR       := $(shell dirname $(call where-am-i))
SHELL        := /bin/bash
project_root ?= $(CURDIR)

check-makefile-paths:
	$(info MK_DIR: $(MK_DIR))
	$(info project_root: $(project_root))

up:
	@vagrant up
rebuild:
	@vagrant destroy -f && vagrant up
make:
	@vagrant ssh -c"cd /var/www/html/d8 && sudo drush -y make /vagrant/dev.build.yml"

include $(MK_DIR)/mk/*/*.mk

