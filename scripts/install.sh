#!/bin/bash

DEPENDENCIES=("gdb-multiarch" "nasm" "qemu-user")

echo "Checking and installing dependencies..."
for dep in "${DEPENDENCIES[@]}";do
    if ! command -v $dep &> /dev/null; then
        sudo apt-get install -y $dep
    fi
done

# Copy scripts to /usr/local/bin
echo "Installing toolchain scripts..."
sudo cp arm_toolchain.sh /usr/local/bin/arm_toolchain
sudo cp x86_toolchain.sh /usr/local/bin/x86_toolchain

# Set executable permissions
sudo chmod +x /usr/local/bin/arm_toolchain
sudo chmod +x /usr/local/bin/x86_toolchain

echo "Installation complete."