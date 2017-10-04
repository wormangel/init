# init
My setup checklist for new dev machines

## init 1 - bare_minimum
0- Make sure to have admin rights on the machine

1- Install [Spectacle](https://www.spectacleapp.com/)
* Preferences > Launch Spectacle at Login 

2- Install [Google Chrome](https://www.google.com/chrome)
* Set as default browser

3- Displays > Resolution > More Space

4- Keyboard > Input Sources > add **U.S. International - PC** > remove others

## init 2 - shell

1- Install [iTerm2](https://www.iterm2.com/)
* Options > Preferences > Profiles > Default > Keys > `⌥←`  > Send Escape Sequence > `b`
* Options > Preferences > Profiles > Default > Keys > `⌥←`  > Send Escape Sequence > `f`
* Options > Preferences > Profiles > Default > Terminal > check **Unlimited scrollback**
* Options > Preferences > Profiles > Default > Terminal > check **Enable mouse reporting** and **Report mouse wheel events**

2- Install [oh-my-zsh](http://ohmyz.sh/)

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

* If needed, set it as the default shell (should be done automatically though): ```chsh -s /bin/zsh```

3- Install XCode command-line tools: ```xcode-select --install```

4- Install [Homebrew](https://brew.sh/): ```/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```
* ```brew install python3 jq```

## init 3 - software_essentials

1- Install [Atom](https://atom.io/)

2- Install [iStats Menus 5](https://bjango.com/mac/istatmenus/)
* File > Import Settings > ```istats.ismp```

## init 4 - osx_tweaks

1- Accessibility > Zoom > Use scroll gesture with modifier keys to zoom > ^ Control

2- Security & Privacy > General > Require password **immediately** after sleep or screen saver begins

3- Keychain Access > Settings > Show keychain status in menubar

4- Setup shortcut to lock screen with keyboard
* Automator > Create new service (receives selected no `input`, `any app`, launches `Start Screen Saver`) > Save as `Lock Screen`
* System Preferences > Keyboard > Shortcuts > Services > `Lock Screen` > bind to `⌘⌥^L`

3- Keyboard > Text > disable **Correct spelling automatically** and **Capitalize words automatically**

## init 5 - rest

1- Install [Telegram](https://telegram.org/)