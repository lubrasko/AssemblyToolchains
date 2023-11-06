#!/bin/bash

# Created by Tyler Cain
# Group B - 1
# ISS Program, SADT, SAIT
# August 2022

DEPENDENCIES=("gdb-multiarch" "nasm" "qemu-user") # Declaring the dependencies we will need to install

echo "Checking and installing dependencies..."    # Begin checking for dependencies
for dep in "${DEPENDENCIES[@]}";do                # Iterating through each 'dep'(item) in the dependency list
    if ! command -v $dep &> /dev/null; then       # Testing output (-v) of each dependency in our list (and discarding the output in null) to see if that specific package exists                                              
        sudo apt-get install -y $dep              # If it gives no output (the package doesnt exist) this line executes, and downloads the required dependency
    fi
done


echo "Installing toolchain scripts..."                  # Copy scripts to /usr/local/bin
sudo cp arm_toolchain.sh /usr/local/bin/arm_toolchain   # Copying the arm toolchain
sudo cp x86_toolchain.sh /usr/local/bin/x86_toolchain   # Copying the x86 toolchain

                                                       
sudo chmod +x /usr/local/bin/arm_toolchain              # Set executable permissions
sudo chmod +x /usr/local/bin/x86_toolchain              

echo "Installation complete."                   # Finished message