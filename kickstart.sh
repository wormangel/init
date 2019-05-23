#!/usr/local/bin/bash
set -e

echo "😍 Kickstarting new machine.."
echo
sleep 2

INITDIR=~/workspace/wormangel/init
# OSX Tweaks
echo "🖱 Setting up OSX tweaks..."
echo
echo "This step will TRY to configure the following OSX settings:"
echo " * Trackpad: Enable clicking by tapping"
echo " * Finder: Show Path bar"
echo " * Finder: Show Hidden files"
echo
defaults write com.apple.AppleMultitouchTrackpad Clicking 1
defaults write com.apple.finder ShowPathbar 1
defaults write com.apple.finder AppleShowAllFiles YES

# Install dev tools
echo "🤓 Installing xcode CLI tools..."
echo
echo "This launches a GUI application and requires user confirmation."
xcode-select --install

read -n 1 -s -r -p "Press any key to continue..."
echo

# Install homebrew
echo "🔨 Installing homebrew..."
echo
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/cask-versions

# Install proper terminal - iterm2 and oh-my-zsh
echo "❤️ Installing iTerm2 and oh-my-zsh..."
echo
brew cask install iterm2
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# TODO This will change the shell to oh-my-zsh and stop executing the rest of the script :( Split the files?

# Generate SSH
echo "🔶 Generating new SSH key..."
echo
ssh-keygen -t rsa -b 4096
echo
echo "Adding newly-created key to ssh-agent. You will be prompted for the password."
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa

# Manual instruction suggested
echo "🛑 Manual step before proceeding!"
echo
echo "To clone the init repositories the newly created SSH key needs to be uploaded to GitHub."
pbcopy < ~/.ssh/id_rsa.pub
echo "The public key (~/.ssh/id_rsa.pub) was copied to your clipboard."
echo
echo "  👾 Upload new SSH key to GH - https://github.com/settings/ssh/new"
echo

read -n 1 -s -r -p "Press any key to continue..."
echo

# Clone repos with dotfiles
echo "🐛 Creating workspace and cloning general init project..."
echo
mkdir ~/workspace
git clone git@github.com:wormangel/init.git $INITDIR
cp $INITDIR/.ssh/config ~/.ssh/config

# Install all needed software
echo "⚙️ Installing all needed software..."
echo
echo "WARNING: java8 is not available anymore with Homebrew due tue Oracle licensing bullshit."
echo "Please manually download it and install from https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html"
echo
brew cask install google-chrome spectacle atom telegram spotify intellij-idea postgres pgadmin4 postman docker istat-menus dropbox xquartz gimp
brew install python3 go glide node jq z imagemagick hub maven awscli bash icdiff mono
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE # Disable swipe navigation

# Install Atom packages
echo "⚛️ Installing Atom packages..."
echo
apm install duplicate-removal plist-converter pretty-json sort-lines split-diff

# Setup dotfiles
echo "🎫 Copying dotfiles..."
echo
echo "This step will:"
echo " * Copy .vimrc to home"
echo " * Copy .zshrc to home"
echo " * Copy iStats settings to home"
echo " * Copy iTerm2 profiles to the appropriate place"
echo "   * NOTE: iTerm2 preferences need to be loaded manually, check the final instructions."
echo
cp $INITDIR/.zshrc ~/
cp $INITDIR/.vimrc ~/
cp $INITDIR/istats.ismp ~/
mkdir -p ~/Library/Application Support/iTerm2/DynamicProfiles
cp $INITDIR/iTerm2/profiles.json ~/Library/Application Support/iTerm2/DynamicProfiles


echo "🎉 All done!"
echo
echo "OSX tweaks to do manually:"
echo " ⚙️  Displays > Resolution > More Space"
echo " ⚙️  Keyboard > Input Sources > add U.S. International - PC > remove others"
echo " ⚙️  Date & Time > uncheck Show date and time in the menubar"
echo " ⚙️  Energy Save > uncheck Show battery status in menubar"
echo " ⚙️  Accessibility > Zoom > Use scroll gesture with modifier keys to zoom > ^ Control"
echo " ⚙️  Security & Privacy > General > Require password immediately after sleep or screen saver begins"
echo " ⚙️  Keyboard > Text > disable Correct spelling automatically and Capitalize words automatically"
echo " ⚙️  Setup shortcut to lock screen with keyboard"
echo "   · Automator > Create new Quick action (no input, any app, launches Start Screen Saver) > Save as Lock Screen"
echo "   · System Preferences > Keyboard > Shortcuts > Services > Lock Screen > bind to ⌘⌥^L"
echo
echo "Application configuration to do manually:"
echo " 📅 Calendar:"
echo "  ⚙️  Add Google accounts, configure refreshing for every 5min"
echo
echo " 👓 Spectacle:"
echo "  ⚙️  Preferences > Launch Spectacle at Login"
echo
echo " 🌕 Google Chrome:"
echo "  ⚙️  Set as default browser"
echo "  ⚙️  Login to Chrome to synchronize extensions"
echo "    · LastPass > https://chrome.google.com/webstore/detail/lastpass-free-password-ma/hdokiejnpimakedhajhdlcegeplioahd"
echo "    · Cluster > https://chrome.google.com/webstore/detail/cluster-window-tab-manage/aadahadfdmiibmdhfmpbeeebejmjnkef"
echo "    · Session Buddy > https://chrome.google.com/webstore/detail/session-buddy/edacconmaakjimmfgnblocblbcdcpbko"
echo "    · uBlock Origin > https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm"
echo "    · EditThisCookie > https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg"
echo "    · Copy All URLs > https://chrome.google.com/webstore/detail/copy-all-urls/djdmadneanknadilpjiknlnanaolmbfk"
echo "    · React Dev Tools > https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi"
echo "    · Redux Dev Tools > https://chrome.google.com/webstore/detail/redux-devtools/lmhkpmbekcpmknklioeibfkpmmfibljd"
echo
echo " 💻 iTerm2:"
echo "  ⚙️  Options > Preferences > General > Load preferences from a custom folder or URL > $INITDIR/iTerm2"
echo
echo " 🌡  iStats Menus 6:"
echo "  ⚙️  iStats Menus - Registration - Key can be found on Gmail under 'istats order'"
echo "  ⚙️  File > Import Settings > ~/istats.ismp"
echo " 📦 Dropbox:"
echo "  ⚙️  Selective Sync: configure to sync at least /docs"
echo
# Source .zshrc
echo "Don't forget to source .zshrc now!"
echo
echo "🌈 HAVE FUN! 🦄"
