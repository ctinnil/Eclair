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

ECLAIR is an artificial intelligence research and experimentation macOS-based workstation developed for data acquisition, processing, cleaning, integrating and enrichment, applying machine and deep learning techniques, and findings visualization and interpretation. 

The construction of the framework is base on the data science lifecycle, as follows:

<meta name="supported-color-schemes" content="dark">
![dark](https://user-images.githubusercontent.com/69745175/115736809-400ccc80-a394-11eb-8145-8ea575cbbc84.png)
<\meta>

![light](https://user-images.githubusercontent.com/69745175/115736769-37b49180-a394-11eb-80f9-a281b58715f3.png)

![image](https://user-images.githubusercontent.com/69745175/113582409-02d4da80-9631-11eb-89db-f312241ef15f.png)

The framework's name ECLAIR stands for Enrich, Classify, Learn, Analyze, Interpret, and Report. In its users' eyes, the Eclair workstation can be viewed as a complete portable laboratory consisting of more than fifty open-source and commercial tools used in the AI industry.

![ECLAIR V2](https://user-images.githubusercontent.com/69745175/113580838-f5b6ec00-962e-11eb-94d2-69c69ed19860.png)

It also includes everything needed to develop your software or keep your data secure.

Eclair workstation is a work-in-progress, so feel free to contribute and suggest new tools that can be added. 
*This project relies on open-source and commercial tools maintained by their respective authors.*

Requirements 
-----
To diminish the time of run and the probability of failure, we recommend updating your macOS and tools before running the installation. 

**Comment or delete any configurations that you consider unnecessary or just run the bootstrapping script.**

These requirements are for the computer running the core framework:
* macOS Catalina `10.15` or higher
* Support for hypervisor applications (like [Docker](https://docs.docker.com/docker-for-mac/install/))
* Recommended hardware to run on is 4GB+ RAM, 150GB+ HDD and 2+ CPUs
* Some installs require that you are signed in with your AppleID

Installation 
-----
Simply copy and paste the following in a terminal:
```
zsh <(curl -s https://raw.githubusercontent.com/ctinnil/Eclair/main/eclair_conf.sh)
```

To import few useful bookmarks 
----
1. Open **Safari**
2. Select **File**
3. Select **Import From** (or **Import Bookmarks...** )
4. Choose to import **Useful Bookmarks.html**

<img width="606" alt="how to import bookmarks" src="https://user-images.githubusercontent.com/69745175/114000179-6e05f300-9863-11eb-9064-a4b426daf862.png">

### Thanks to Homebrew developers and contributors !!!
@https://github.com/Homebrew/brew.git

Some configurations have been inspired from various places on the web, as:
- https://gist.github.com/brandonb927/3195465
- https://gist.github.com/codeinthehole/26b37efa67041e1307db

Check them out yourself!
