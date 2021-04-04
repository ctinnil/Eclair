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

This project relies on open-source and commercial tools used in the industry that are maintained by their authors. 

To summarise, Eclair offers a full portable laboratory for AI research and experimentation. It also includes everything needed to develop your software or keep your data secure.

Eclair workstation is a work-in-progress, so feel free to contribute and suggest new tools that can be added. 

Requirements 
-----
These requirements are for the computer running the core framework:
* Support for hypervisor applications (like [Docker](https://docs.docker.com/docker-for-mac/install/))
* Recommended hardware to run on is 4GB+ RAM, 150GB+ HDD and 2+ CPUs
* Some installs require that you are signed in with your AppleID

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

To import few useful bookmarks 
----
1. Open **Safari**.
2. Select **File**.
3. Select **Import From** (or **Import Bookmarks...** ).
4. Choose to import **Useful Bookmarks.html** from *Eclair/res.

![Full Disk Access](https://github.com/ctinnil/badseed/blob/master/res/how%20to%20import%20bookmarks.png?raw=true)


Tested on
-----

platform | manager | version 
---------|---------|------------------
macOS | [Homebrew](https://docs.brew.sh/Installation) 3.0.10 | `11.2.3` 
macOS | [Homebrew](https://docs.brew.sh/Installation) 3.0.1 | `11.2.1` 

### Thanks to Homebrew developers and contributors !!!
@https://github.com/Homebrew/brew.git
