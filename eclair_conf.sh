#!/usr/bin/env bash

# Various configs have been taken from various places on the web, as:
#   -	https://gist.github.com/brandonb927/3195465
#   -	https://gist.github.com/codeinthehole/26b37efa67041e1307db
#   -	https://gist.github.com/MatthewMueller/e22d9840f9ea2fee4716 
#   -	https://gist.github.com/jousby/2ab03202b5bf7878f9b850b916e54a3e]
# and so on ... try it yourself

cat << EOF
                        c.                          ####################################################################
                    .cOW0NKo'                       ##                                                                ##
                .,cKMd,   .cXWd;.                   ## * Script Name    : eclair_conf.sh                              ##
             ,xXMMMXO       c0NMMWOc.               ## * Description    : An automation script that helps you deploy  ##
          .xWMWkc.             .;dXMM0:             ##                    and  configure  your own AI  research  and  ##
      '..OMMK:       .;:c:;.       .xWMX;.'         ##                    experimentation workstation.                ##
  .:kN0XMMX,     .oKMMMMMMMMMKo.     .kMMX0NOc.     ## * Args           : none                                        ##
 dMk;   .;      oMMMMKd:':dKMMMMd      '.   ,xMx    ## * Usage          : chmod +x eclair_conf.sh && ./eclair_conf.sh ##
 xM.           cMMMM;';;;;;;,MMMMl           .Mk    ## * Notes          : Install Homebrew to use this script.        ##
 xM:           xMMMM,;,;;';c,MMMMk           ;Mk    ## * Version        : 1.1                                         ##
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
        /*******  **///** /** //////** /**//**//*   ##  + Support for hypervisor applications (like Docker)           ##
        /**////  /**  //  /**  ******* /** /** /    ##  + Homebrew version 3+                                         ##
        /**      /**   ** /** **////** /** /**      ##  + Recommended hardware: 4GB+ RAM, 150GB+ HDD and 2+ CPUs      ##
        /********//*****  ***//********/**/***      ##  + Some installs require that you are signed in with your  ID ##
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

# Ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# get macOS version
echo "Your macOS version is ..."
sw_vers -productVersion

# turn firewall on
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
echo "Your Firewall is on ..."

echo "Homebrew checkup ... "

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
  
# update all
echo "Let's update your software and Homebrew recipes ..."
sudo softwareupdate -ia --verbose
brew update
echo "Done."

# install xcode command line tool
xcode-select --install
xcode-select -p
echo "Xcode command line tools installed ... "

sleep 60

# Update homebrew recipes
brew update

echo "Homebrew is up to date ... "

echo ""
echo "Activate Screensaver aftre 1 minute idle "
defaults -currentHost write com.apple.screensaver idleTime 60

echo ""
echo "Setting the Pro theme by default in Terminal.app"
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

echo ""
echo "Enable tap-to-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo ""
echo "Set Eclair workstation wallpaper"
cp ./res/lockscreen.jpeg /tmp/lockscreen.jpeg
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/tmp/lockscreen.jpeg"'

PACKAGES=(
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
    vim #a clone of vi text editor
    wget #a computer program that retrieves content from web
    wiki #a command-line Wikipedia search tool
)

CASKS=(
    anaconda #Continuum Analytics Anaconda
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
    netbeans #NetBeans IDE 
    oracle-jdk #Oracle Java Standard Edition Development Kit
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
    visual-studio #Microsoft Visual Studio
    visual-studio-code #Microsoft Visual Studio Code
    vlc #VLC media player
    weka #Weka
    xmind #XMind - Mind mapping and brainstorming tool
)

echo ""
echo "Installing packages ... "
brew install ${PACKAGES[@]}

echo ""
echo "Installing cask apps ... "
brew cask install ${CASKS[@]}

echo ""
echo "Elastic Stack setup ... "
brew tap elastic/tap
brew install elastic/tap/elasticsearch-full
brew services start elastic/tap/elasticsearch-full
sleep 60 && curl http://localhost:9200
brew install elastic/tap/kibana-full
brew services start elastic/tap/kibana-full
#To access Kibana go to :::> http://localhost:5601

echo ""
echo "Installing Xcode and Swift Playgrounds ... "
#xcode
xcode=$(mas search xcode | head -n1 | tr -s " " | cut -f2 -d" " )
mas install $xcode
#swift
swift=$(mas search swift | head -n1 | tr -s " " | cut -f2 -d" " )
mas install $swift

echo ""
echo "npm package manager installing and configuring ... "
mkdir ~/.nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
source ~/.bash_profile
nvm_ver=$(nvm ls-remote | grep "Latest LTS" | tail -1 |  awk '{print $1}')
nvm install $nvm_ver

npm install -g npm
npm i -g dependency-cruiser

echo ""
echo "Installing Python packages ... "
python3 -m pip install --upgrade setuptools
python3 -m pip install --upgrade pip

PYTHON_PACKAGES=(
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
    virtualenv
    virtualenvwrapper
)

sudo python3 -m pip install -U ${PYTHON_PACKAGES[@]}
git clone git://github.com/pybrain/pybrain.git
sudo python3 -m pip install -U -e pybrain

echo ""
echo "Installing Ruby gems ... "
RUBY_GEMS=(
    bundler
    filewatcher
    cocoapods
)
sudo gem install ${RUBY_GEMS[@]}

echo ""
echo "Initialize Docker containers ... "
git clone https://github.com/IBM/fhe-toolkit-macos.git
cd fhe-toolkit-macos/dependencies/
./setup.sh
cd ../..

#check installs
brew doctor 

echo ""
echo "Cleaning up..."
brew cleanup

# enable terminal autocomplet 
set show-all-if-ambiguous on

echo ""
echo "Setup complete !!!"
echo ""
