#!/bin/bash

# Add submodule for sql (case-insensitive)
git submodule add https://github.com/austinsonger/SQL-scripts sql

# Add submodule for vagrant-configs
git submodule add https://github.com/austinsonger/Vagrant-templates vagrant-configs

# Add submodule for packer
git submodule add https://github.com/austinsonger/Packer packer

# Add submodule for kubernetes-configs
git submodule add https://github.com/austinsonger/Kubernetes-configs kubernetes-configs

# Add submodule for templates
git submodule add https://github.com/austinsonger/base-templates templates

# Initialize and update the submodules
git submodule init
git submodule update

# Stage the .gitmodules file and submodule directories
git add .gitmodules sql vagrant-configs packer kubernetes-configs templates

# Commit the changes
git commit -m "Add submodules for SQL, Vagrant, Packer, Kubernetes, and templates"

# Push the changes to the repository
git push
