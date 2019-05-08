# init
This kickstart script automates all the boring work of setting up a new personal machine by installing all software I use and pre-configuring (with the help of dotfiles and OSX hacks) otherwise tedious manual settings.

## Pre-requisites
You need admin rights on the machine.

## Instructions
* Download the `kickstart.sh` and make it executable with `chmod +x kickstart.sh`
* Run `./kickstart.sh`

## Features
The script kickstarts the machine by installing/configuring:

* Shell (iTerm2 + zsh + oh-my-zsh)
* XCode command-line tools (mostly because of git)
* Generation of new SSH key (using my personal e-mail)
* Homebrew (and all software from them on using formulas and casks for a tidy managed system 😍)
* Essential desktop apps: `google-chrome spectacle atom telegram spotify istat-menus dropbox`
  * Commented out dev desktop apps: `java8 postgres pgadmin4 postman docker intellij-idea`
* Essential shell apps: `python3 jq z imagemagick icdiff`
  * Commented out dev shell apps: `go glide node hub maven awscli bash`
* Atom packages
* Automatic copying of software dotfiles `.vimrc`
* Automatic copying and sourcing of my custom dotfiles `.zshrc`
* Automatic setup of iStats Menus 6

Check the script to know exactly what it does.

## What's missing
There are a bunch of steps which were not automatized yet. They are mostly related to OSX settings I'm still figuring out how to change using the CLI (in general it's about changing 'defaults').

**CHECK THE TERMINAL OUTPUT FOR FINAL STEPS!!**
