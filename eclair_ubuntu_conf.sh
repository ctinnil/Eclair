#!/bin/bash

echo "Starting setup..."

cat << EOF
                        c.                          ####################################################################
                    .cOW0NKo'                       ##                                                                ##
                .,cKMd,   .cXWd;.                   ## * Script Name    : eclair_ubuntu_conf.sh                       ##
             ,xXMMMXO       c0NMMWOc.               ## * Description    : An automation script that helps you deploy  ##
          .xWMWkc.             .;dXMM0:             ##                    and  configure  your own AI  research  and  ##
      '..OMMK:       .;:c:;.       .xWMX;.'         ##                    experimentation workstation on Ubuntu.      ##
  .:kN0XMMX,     .oKMMMMMMMMMKo.     .kMMX0NOc.     ## * Usage          : chmod + eclair_ubuntu_conf.sh &&            ##
 dMk;   .;      oMMMMKd:':dKMMMMd      '.   ,xMx    ##                     sudo ./eclair_ubuntu_conf.sh               ##
 xM.           cMMMM;';;;;;;,MMMMl           .Mk    ## * Notes          : Adapted for Ubuntu systems.                 ##
 xM:           xMMMM,;,;;';c,MMMMk           ;Mk    ## * Version        : 1.0                                         ##
 .l0Nk:.       .NMMMo,';',,;oMMMW.        ;kWKo.    ## * Author         : @ctinnil                                    ##
    OMM.        .NMMMMKdcdKMMMMW'         0MM.      ## * Email          : ctinnil@protonmail.com                      ##
    kMM'         .NMMMMMMMMMMMW.          KMM.      ##                                                                ##
    :MMo          .NMMMMMMMMMW.          .MMK       ####################################################################
     XMW.          'MMMMMMMMM,           OMM;       ##                                                                ##
     'WMX.                              dMMx        ##  !!!                        WARNING                       !!!  ##
      :MMN.         Xx     dN          kMM0         ##                                                                ##
     ;M0:.          ,xKkcxKx;           'dMO        ##  DO  NOT  RUN THIS  SCRIPT  BLINDLY !!! This script uses quite ##
     :Ml               .;.        .       M0        ##  many   features  and  installs   numerous  applications   and ##
     :Mx      cMKd;.         .,lOW0.     ,M0        ##  libraries that may or may not be compatible with your current ##
      :kN0lcON0dOWMMMWNXKKXWMMMMKxxNKo:kNKo.        ##  install.  Review  it thoroughly, and edit to best  suit  your ##
         'od,     .';clooool:,.     .lx;            ##  needs.                                                        ##
                                                    ##                                                                ##
         ********          **           **          ####################################################################
        /**/////          /**          //           ##                                                                ##
        /**        *****  /**  ******   ** ******   ##  ***                      Requirements                    ***  ##
        /*******  **///** /** //////** /**//**//*   ##  + Ubuntu 20.04 LTS or higher                                  ##
        /**////  /**  //  /**  ******* /** /** /    ##  + Support for container applications (like Docker)            ##
        /**      /**   ** /** **////** /** /**      ##  + Recommended hardware: 4GB+ RAM, 150GB+ HDD and 2+ CPUs      ##
        /********//*****  ***//********/**/***      ##                                                                ##
        ////////  /////  ///  //////// // ///       ##                                                                ##
                                                    ####################################################################
EOF

# Set continue to false by default
CONTINUE=false

echo ""
echo "###############################################"
echo "#        DO NOT RUN THIS SCRIPT BLINDLY       #"
echo "#         YOU'LL PROBABLY REGRET IT...        #"
echo "#                                             #"
echo "#              READ IT THOROUGHLY             #"
echo "#         AND EDIT TO SUIT YOUR NEEDS         #"
echo "###############################################"
echo ""


echo ""
echo "Have you read through the script you're about to run and "
echo "understood that it will make changes to your computer? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  # Check if we're continuing and output a message if not
  echo "Please go read the script, it only takes a few minutes"
  exit
fi

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Update and upgrade
sudo apt-get update && sudo apt-get upgrade -y

# Install required packages
PACKAGES=(
    build-essential
    curl
    git
    wget
    vim
    tmux
    htop
    openjdk-11-jdk
    python3-pip
    docker.io
    docker-compose
    postgresql
    nginx
    nodejs
    npm
)

echo "Installing base packages..."
for package in "${PACKAGES[@]}"; do
    sudo apt-get install -y $package
done

# Setup Docker without sudo
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Python packages
echo "Installing Python packages..."
PYTHON_PACKAGES=(
    beautifulsoup4
    requests
    django
    flask
    pandas
    numpy
    scipy
    matplotlib
    ipython
    jupyter
    notebook
)

for pkg in "${PYTHON_PACKAGES[@]}"; do
    pip3 install $pkg
done

# NVM and Node.js
echo "Setting up NVM and installing Node.js..."
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install node # Install latest Node.js version

# Additional software and configurations can be added here

echo ""
echo "Cleaning up..."
sudo apt-get autoremove -y
sudo apt-get autoclean -y

echo ""
echo "Setup complete! Please restart your computer."
