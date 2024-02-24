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
sudo apt update && sudo apt upgrade -y

# Install prerequisites 
sudo apt install curl git -y

# Install brew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Test brew install 
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$(\$(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc
brew install hello

# Update brew
brew update
brew install gcc #necessary before ack and others
brew install --cask oracle-jdk #Oracle Java Standard Edition Development Kit for NetBeans and others 
brew tap homebrew/cask-versions #necessary for Microsoft Visual Studio
brew install --cask visual-studio #Microsoft Visual Studio
brew upgrade
brew doctor
brew autoremove
brew cleanup
echo "Homebrew is up to date ... "

BREW_PACKAGES=(
    ack #a beyond grep-like source code search tool
    apache-spark #a engine for large-scale data processing
    aria2 #a flexible download utility software with multi-protocol and multi-source support
    caffe #a fast open framework for deep learning
    cmake #a family of tools to build, test and package software
    ffmpeg #a large suite of libraries and programs for handling video, audio, and other multimedia files and streams
    fzf #a command-line fuzzy finder written in Go
    gettext #a multilingual programs writing utility for Unix-like computer operating systems
    gifsicle #a command-line tool for creating, editing, and getting information about GIF images and animations
    git #a software for tracking changes in any set of files, usually used for coordinating work among programmers/ should be installed
    graphviz #a package of open-source tools for drawing graphs
    hadoop #a framework for distributed processing of large data sets
    hub #an extension to command-line git
    icdiff #an improved colored diff
    imagemagick #a cross-platform software suite for displaying, creating, converting, modifying, and editing raster images
    jq #a lightweight and flexible command-line JSON processor
    kafka #a framework implementation of a software bus using stream-processing
    libjpeg #a free library with functions for handling the JPEG image data format
    libmemcached #an open source C/C++ client library and tools for the memcached server 
    llvm #a next-gen compiler infrastructure
    lynx #a command-line web browsers
    macvim #a GUI for vim, made for macOS
    markdown #a lightweight markup language for creating formatted text using a plain-text editor
    mas #Mac App Store command-line interface
    memcached #a distributed memory object caching system
    mercurial #a distributed revision control tool for software developers
    midnight-commander #a visual file manager
    mosh #a replacement for interactive SSH terminals
    npm #a package manager for the JavaScript 
    nvm #Manage multiple Node.js versions
    onednn #Basic building blocks for deep learning applications
    open-mpi #a high performance message passing library
    pkg-config #a computer program that defines and supports
    postgresql #a free and open-source relational database management  
    python3 #an interpreted, high-level and general-purpose programming language
    pypy #an alternative implementation of the Python programming language to CPython
    p7zip #7-Zip (high compression file archiver) implementation
    r #a software environment for statistical computing
    rabbitmq #an open-source message-broker software 
    scala #JVM-based programming language
    termius #a CLI tool for termius.com
    the_silver_searcher #a code searching tool similar to ack, with a focus on speed
    tmux #an open-source terminal multiplexer for Unix-like operating systems
    trash-cli #a command-line interface to the freedesktop.org trashcan
    tree #a tiny, cross-platform command-line program used to recursively list or display the content of a directory in a tree-like format
    wget #a computer program that retrieves content from web
    wiki #a command-line Wikipedia search tool
)

BREW_CASKS=(
    anaconda #Continuum Analytics Anaconda
    ccleaner #Piriform CCleaner
    db-browser-for-sqlite #DB Browser for SQLite
    deluge #Deluge - BitTorrent client
    docker #Docker Desktop
    dotnet-sdk #.NET SDK
    drawio #draw.io Desktop
    eclipse-java #Eclipse IDE for Java Developers
    enpass #Enpass
    firefox #Mozilla Firefox
    github #GitHub Desktop
    google-chrome #Google Chrome
    gpg-suite-pinentry #GPG Suite Pinentry
    keka #Keka - File archiver
    knime #KNIME Analytics Platform
    mactex #MacTeX - Full TeX Live distribution with GUI applications
    microsoft-remote-desktop #Microsoft Remote Desktop
    miniconda #Continuum Analytics Miniconda
    merlin-project #Merlin Project
    netbeans #NetBeans IDE ########problems
    oracle-jdk-javadoc #Oracle Java Standard Edition Development Kit Documentation
    orange #Orange - Component-based data mining software
    projectlibre #ProjectLibre
    pycharm-ce #Jetbrains PyCharm Community Edition
    rapidminer-studio #RapidMiner Studio
    spectacle #Spectacle - Move and resize windows with ease
    sublime-text #Sublime Text
    termius #Termius
    vagrant #Vagrant
    virtualbox #Oracle VirtualBox
    visual-studio-code #Microsoft Visual Studio Code
    vlc #VLC media player
    weka #Weka
    xmind #XMind - Mind mapping and brainstorming tool
)

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

echo ""
echo "Installing packages ... "
brew install ${BREW_PACKAGES[@]}

echo ""
echo "Set Eclair workstation wallpaper"
git clone https://github.com/ctinnil/Eclair.git
cp Eclair/lockscreen.jpeg ~/Pictures/lockscreen.jpeg
gsettings set org.gnome.desktop.background picture-uri ~/Pictures/lockscreen.jpeg
gsettings set org.gnome.desktop.screensaver picture-uri ~/Pictures/lockscreen.jpeg


echo ""
echo "Installing cask apps ... "
brew install --cask ${BREW_CASKS[@]}

# Setup Docker without sudo
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Python packages
echo "Installing Python packages..."
PYTHON_PACKAGES=(
    beautifulsoup4
    cntk
    cortex
    h2o
    ipython
    joblib
    jupyter
    jupyterlab
    matplotlib
    nose
    numpy 
    opencv
    pandas
    plaidml-keras
    plotly
    pyopencl
    requests
    scikit-image
    scikit-learn
    scipy 
    seaborn
    shogun
    sympy
    tensorflow
    times
    torch 
    torchaudio
    torchvision
    tqdm
    urllib3
    virtualenv
    virtualenvwrapper
    weka
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
sudo apt autoremove -y
sudo apt autoclean -y
brew doctor
brew autoremove
brew cleanup

echo ""
echo "Setup complete! Please restart your computer."
