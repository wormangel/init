# init
My setup checklist for new dev machines

## TODO

Replace manual installation of apps (e.g. GUI apps like Chrome) with `homebrew cask`

`brew cask install atom telegram spotify google-chat intellij-idea postgres pgadmin4 postman docker istat-menus dropbox`

## init 1 - bare_minimum
0- Make sure to have admin rights on the machine

1- Install [Spectacle](https://www.spectacleapp.com/)
* Preferences > Launch Spectacle at Login 

2- Install [Google Chrome](https://www.google.com/chrome)
* Set as default browser
* Install extensions: [EditThisCookie](https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg), [Copy All URLs](https://chrome.google.com/webstore/detail/copy-all-urls/djdmadneanknadilpjiknlnanaolmbfk), [React Dev Tools](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi), [Redux Dev Tools](https://chrome.google.com/webstore/detail/redux-devtools/lmhkpmbekcpmknklioeibfkpmmfibljd)

3- Install [LastPass](https://lastpass.com)

4- Displays > Resolution > More Space
* Needs to be done both **before** and **after** connecting to external displays

5- Keyboard > Input Sources > add **U.S. International - PC** > remove others

## init 2 - shell

1- Install [iTerm2](https://www.iterm2.com/)
* Options > Preferences > Profiles > Default > Keys > `⌥←`  > Send Escape Sequence > `b`
* Options > Preferences > Profiles > Default > Keys > `⌥←`  > Send Escape Sequence > `f`
* Options > Preferences > Profiles > Default > Terminal > check **Unlimited scrollback**
* Options > Preferences > Profiles > Default > Terminal > check **Enable mouse reporting** and **Report mouse wheel events**
* Options > Advanced > Set **Scroll wheel sends arrow keys when in alternate screen mode** = `true`

2- Install XCode command-line tools: ```xcode-select --install```

3- Install [oh-my-zsh](http://ohmyz.sh/)

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

* If needed, set it as the default shell (should be done automatically though): ```chsh -s /bin/zsh```

4- Install [Homebrew](https://brew.sh/): ```/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```
* ```brew install python3 jq z imagemagick```

## init 3 - software_essentials

1- Install [Atom](https://atom.io/)

2- Install [iStats Menus 5](https://bjango.com/mac/istatmenus/)
* File > Import Settings > ```istats.ismp```

Tweak the following Mac settings below, as you'll be using iStats' ones:
* Date & Time > uncheck **Show date and time in the menubar**
* Energy Save > uncheck **Show battery status in menubar**

## init 4 - osx_tweaks

1- Accessibility > Zoom > Use scroll gesture with modifier keys to zoom > ^ Control

2- Security & Privacy > General > Require password **immediately** after sleep or screen saver begins

3- Keychain Access > Settings > Show keychain status in menubar **DEPRECATED ?**

4- Setup shortcut to lock screen with keyboard
* Automator > Create new **Quick action** (receives `no input`, `any app`, launches `Start Screen Saver`) > Save as `Lock Screen`
* System Preferences > Keyboard > Shortcuts > Services > `Lock Screen` > bind to `⌘⌥^L`

5- Keyboard > Text > disable **Correct spelling automatically** and **Capitalize words automatically**

6- Copy `.zshrc` from this repo to the home and source it

## init 5 - other_dev

### Generate new SSH key for the machine 
1- Generate SSH key with `ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`

2- Copy the `.ssh/config` file here and put it in your `~/.ssh`

3- Save the generated key

```
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa
```

4- Add the key to Github and wherever else

### Dev software
1- Install [Postman](https://www.getpostman.com/)

2- Install [Postgres app](https://postgresapp.com)

3- Install [pgAdmin](https://www.pgadmin.org)

4- Install [Docker](https://hub.docker.com/editions/community/docker-ce-desktop-mac)

5- Install [Java JDK](https://www.oracle.com/technetwork/java/javase/downloads/index.html)

6- `brew install hub maven`

7- Install [Node.js/npm](https://nodejs.org/en/)

## init 6 - rest

1- Install [Telegram](https://telegram.org/)

2- Install [Spotify](https://spotify.com)

3- Install [Dropbox](https://www.dropbox.com/), setup Selective Sync as needed



