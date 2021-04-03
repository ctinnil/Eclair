# Eclair
***An artificial intelligence research and experimentation workstation***

![Eclair logo](https://github.com/ctinnil/Eclair/blob/main/res/eclair%20logo.gif?raw=true)

<p align="center">
  <a href="https://github.com/ctinnil/Eclaire/blob/master/LICENSE">
      <img src="https://img.shields.io/github/license/ctinnil/Eclair" alt="License">
  </a>
  <a href="https://github.com/ctinnil/Eclair/issues">
    <img src="https://img.shields.io/github/issues/ctinnil/Eclair" alt="Issues">
  </a>
  <a href="https://github.com/ctinnil/Eclair/pulls">
      <img src="https://img.shields.io/badge/contributions-welcome-brightgreen" alt="Contributing">
  </a>
  <a href="https://www.apple.com/macos/big-sur/">
      <img src="https://img.shields.io/badge/OS-macOS-brightgreen" alt="OS">
  </a>
  <a href="https://twitter.com/intent/tweet?text=Eclair+-+macOS+framework+for+AI+research+and+experimentation&amp;url=https%3A%2F%2Fgithub.com%2Fctinnil%2FEclair.git&amp;via=ctinnil">
      <img src="https://img.shields.io/twitter/url?url=https%3A%2F%2Fgithub.com%2Fctinnil%2FEclair.git" alt="Tweet">
  </a>
</p>

---

The project relies on open-source and commercial tools used in the industry that are maintained by their authors. To summarise, Eclair offers a full portable laboratory for AI research and experimentation. It also includes everything needed to develop your software or keep your data secure.

This project is a work-in-progress, so feel free to contribute and suggest new tools that can be added. 

Requirements 
-----
These requirements are for the computer running the core framework:
* Support for hypervisor applications (like [Docker](https://docs.docker.com/docker-for-mac/install/))
* recommended hardware to run on is 4GB+ RAM, 100GB+ HDD and 2+ CPUs

Installation 
-----

``` sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" # to install Homebrew
brew install git # or install git some other way 
git clone https://github.com/ctinnil/Eclair.git
cd Eclair
sudo chmod +x conf.sh
./conf.sh # and follow the instructions 
sudo reboot
```

Tested on
-----

platform | manager | version 
---------|---------|------------------
macOS | [Homebrew](https://docs.brew.sh/Installation) 3.0.1 | `11.2.1` 

### Thanks to Homebrew developers and contributors !!!
@https://github.com/Homebrew/brew.git

A lot of these configs have been taken from various places on the web, as:
-	https://gist.github.com/brandonb927/3195465
-	https://gist.github.com/codeinthehole/26b37efa67041e1307db
-	https://gist.github.com/MatthewMueller/e22d9840f9ea2fee4716 
-	https://gist.github.com/jousby/2ab03202b5bf7878f9b850b916e54a3e

