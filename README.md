# Eclair
***An artificial intelligence research and experimentation workstation***

![logo dinamic](https://user-images.githubusercontent.com/69745175/113580971-2139d680-962f-11eb-8e72-da26b102f994.gif)

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

ECLAIR is an artificial intelligence research and experimentation macOS-based workstation developed for data acquisition, processing, cleaning, integrating and enrichment, application of machine and deep learning techniques, and solution visualization and interpretation. 

The framework's name ECLAIR stands for Enrich, Classify, Learn, Analyze, Interpret, and Report. In its users' eyes, the Eclair workstation can be viewed as a complete portable laboratory consisting of more than fifty open-source and commercial tools used in AI industry.

![ECLAIR V2](https://user-images.githubusercontent.com/69745175/113580838-f5b6ec00-962e-11eb-94d2-69c69ed19860.png)

It also includes everything needed to develop your software or keep your data secure.

Eclair workstation is a work-in-progress, so feel free to contribute and suggest new tools that can be added. This project relies on open-source and commercial tools used in the industry that are maintained by their authors. 

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
