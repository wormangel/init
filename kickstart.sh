#!/usr/local/bin/bash

echo "😍 Kickstarting new machine.."
echo
sleep 2

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
xcode-select --install

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

# Generate SSH
echo "🔶 Generating new SSH key..."
echo
ssh-keygen -t rsa -b 4096
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa

# Clone repos with dotfiles
echo "🐛 Creating workspace and cloning general init project..."
echo
mkdir ~/workspace
git clone git@github.com:wormangel/init.git ~/workspace/wormangel/init
cp ~/workspace/wormangel/init/.ssh/config ~/.ssh/config

# Install all needed software
echo "⚙️ Installing all needed software..."
echo
brew cask install google-chrome spectacle atom telegram spotify istat-menus dropbox
# brew cask install java8 postgres pgadmin4 postman docker intellij-idea
brew install python3 jq z imagemagick icdiff
# brew install go glide node hub maven awscli bash
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
echo
cp ~/workspace/wormangel/init/.zshrc ~/
cp ~/workspace/wormangel/init/.vimrc ~/
cp ~/workspace/wormangel/init/istats.ismp ~/

# Source .zshrc
echo "🙏 Sourcing .zshrc..."
echo
source ~/.zshrc

echo "🎉 All done!"
echo
echo "OSX tweaks to do manually:"
echo " ⚙️  Displays > Resolution > More Space"
echo " ⚙️  Keyboard > Input Sources > add U.S. International - PC > remove others"
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
echo " 👓 Spectacle:"
echo "  ⚙️  Preferences > Launch Spectacle at Login"
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
echo " 💻 iTerm2:"
echo "  ⚙️  Options > Preferences > Profiles > Default > Keys > ⌥← > Send Escape Sequence > b"
echo "  ⚙️  Options > Preferences > Profiles > Default > Keys > ⌥→ > Send Escape Sequence > f"
echo "  ⚙️  Options > Preferences > Profiles > Default > Terminal > check Unlimited scrollback"
echo "  ⚙️  Options > Preferences > Profiles > Default > Terminal > check Enable mouse reporting and Report mouse wheel events"
echo "  ⚙️  Options > Advanced > Set Scroll wheel sends arrow keys when in alternate screen mode = true"
echo " 🌡  iStats Menus 6:"
echo "  ⚙️  iStats Menus - Registration - Key can be found on Gmail under 'istats order'"
echo "  ⚙️  File > Import Settings > ~/istats.ismp"
echo " 📦 Dropbox:"
echo "  ⚙️  Selective Sync: configure to sync at least /docs"
echo
echo "🌈 HAVE FUN! 🦄"
