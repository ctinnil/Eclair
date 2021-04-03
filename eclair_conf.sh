#!/usr/bin/env bash

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
        /**      /**   ** /** **////** /** /**      ##  + Recommended hardware: 4GB+ RAM, 100GB+ HDD and 2+ CPUs      ##
        /********//*****  ***//********/**/***      ##                                                                ##
        ////////  /////  ///  //////// // ///       ####################################################################
EOF

# Set continue to false by default
CONTINUE=false

echo ""
cecho "###############################################" $red
cecho "#        DO NOT RUN THIS SCRIPT BLINDLY       #" $red
cecho "#         YOU'LL PROBABLY REGRET IT...        #" $red
cecho "#                                             #" $red
cecho "#              READ IT THOROUGHLY             #" $red
cecho "#         AND EDIT TO SUIT YOUR NEEDS         #" $red
cecho "###############################################" $red
echo ""


echo ""
cecho "Have you read through the script you're about to run and " $red
cecho "understood that it will make changes to your computer? (y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  # Check if we're continuing and output a message if not
  cecho "Please go read the script, it only takes a few minutes" $red
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
  
# update all
echo "Let's update your software and Homebrew recipes ..."
sudo softwareupdate -ia --verbose
brew update
echo "Done."

# install xcode command line tool
xcode-select --install
xcode-select -p
echo "Xcode command line tools installed ..."

echo "Homebrew checkup ... "

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

echo "Homebrew is up to date ... "

echo ""
echo "Requiring password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo ""
echo "Setting the Pro theme by default in Terminal.app"
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

echo ""
echo "Enable tap-to-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo ""
echo "Hiding Safari bookmarks bar by default"
defaults write com.apple.Safari ShowFavoritesBar -bool false

echo ""
echo "Enabling Safari debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo ""
echo "Removing useless icons from Safari bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

echo ""
echo "Enabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

echo ""
echo "Set Eclair workstation wallpaper"
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "./res/lockscreen.jpeg"'

#############
# Utilities #
#############
brew install mas 
brew install tree 
brew install p7zip 
brew install midnight-commander 

brew install --cask keka
brew install --cask firefox
brew install --cask google-chrome

#ddgo
ddgo=$(mas search duckduckgo | head -n1 | tr -s " " | cut -f2 -d" " )
mas install $ddgo  # must be sign in with Apple ID

#enpass
enpass=$(mas search enpass | head -n1 | tr -s " " | cut -f2 -d" " )
mas install $enpass

############
# Planning #
############
brew install --cask xmind 
brew install --cask drawio

brew install --cask projectlibre
brew install --cask merlin-project

####################
# Data acquisition #
####################
brew install curl
brew install wget 

brew install --cask deluge

#################
# Visualization #
#################
brew install graphviz

brew install --cask db-browser-for-sqlite

echo ""
echo "Elastic Stack setup ... "
brew tap elastic/tap
brew install elastic/tap/elasticsearch-full
brew services start elastic/tap/elasticsearch-full
sleep 60 && curl http://localhost:9200
brew install elastic/tap/kibana-full
brew services start elastic/tap/kibana-full
#To access Kibana go to :::> http://localhost:5601

###############
# Development #
###############
brew install --cask github

brew install caffe
brew install scala
brew install hadoop
brew install onednn
brew install python3 
brew install open-mpi
brew install apache-spark
brew install --cask swift
#brew install --cask dotnet 
brew install --cask anaconda
brew install --cask dotnet-sdk
brew install --cask pycharm-ce 
brew install --cask sublime-text 
brew install --cask netbeans
brew install --cask visual-studio-code
brew install --cask eclipse-jee

brew install java go r
brew install --cask oracle-jdk
brew install --cask oracle-jdk-javadoc
brew install --cask visual-studio

brew install nvm
mkdir ~/.nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
source ~/.bash_profile
nvm_ver=$(nvm ls-remote | grep "Latest LTS" | tail -1 |  awk '{print $1}')
nvm install $nvm_ver

npm install -g npm
npm i -g dependency-cruiser


python3 -m pip install --upgrade setuptools
python3 -m pip install --upgrade pip
python3 -m pip install -U numpy scipy ipython jupyter pandas sympy nose
python3 -m pip install -U matplotlib seaborn plotly
python3 -m pip install -U times joblib 
#python3 -m pip install -U OpenNN 
python3 -m pip install -U h2o
python3 -m pip install -U scikit-learn
python3 -m pip install -U tensorflow
#python3 -m pip install -U torch torchvision torchaudio
python3 -m pip install -U cntk cntk-gpu

brew install llvm
echo 'export PATH="/usr/local/opt/llvm/bin:$PATH"' >> ~/.bash_profile

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"

conda activate ai
conda install pytorch torchvision torchaudio cudatoolkit=11.0 -c pytorch
conda deactivate ai
conda install -c conda-forge shogun
conda install -c conda-forge jupyterlab

#xcode
xcode=$(mas search xcode | head -n1 | tr -s " " | cut -f2 -d" " )
mas install $xcode

git clone git://github.com/pybrain/pybrain.git
python3 -m pip install -U -e pybrain

############
# Modeling #
############
brew install --cask weka
brew install --cask knime
brew install --cask orange
brew install --cask rapidminer-studio

##################
# Virtualization #
##################
brew install --cask docker
brew install --cask virtualbox 

##########
# Remote #
##########
brew install mosh 
brew install --cask termius

#rdp
rdp=$(mas search microsoft-remote | head -n1 | tr -s " " | cut -f2 -d" " )
mas install $rdp

#check installs
brew doctor 

echo "Cleaning up..."
brew cleanup

# enable terminal autocomplet 
set show-all-if-ambiguous on

#add bookmarks 
: '
sudo chmod +ux addbookmarks.sh
./addbookmarks.sh "Eclair Workstation" "HomePage https://ctinnil.github.io/Eclair/, Project https://github.com/ctinnil/Eclair, Homebrew https://formulae.brew.sh"
'

echo "Setup complete !!!"