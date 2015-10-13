#!bin/bash

### Run this script by sourcing it to the current bash
### source provisioning.sh
### Otherwise the .bash_profile changes won't be sourced to the current bash


clear

printf '

                                          Thank you for trying:
\e[36m
                         _______  __   __  ___   _  _______  __   __  ___   _                                
                        |       ||  | |  ||   | | ||       ||  | |  ||   | | |                               
                        |____   ||  | |  ||   |_| ||____   ||  | |  ||   |_| |                               
                         ____|  ||  |_|  ||      _| ____|  ||  |_|  ||      _|                               
                        | ______||       ||     |_ | ______||       ||     |_                                
                        | |_____ |       ||    _  || |_____ |       ||    _  |                               
                        |_______||_______||___| |_||_______||_______||___| |_| \e[0m                              
   _______  ______    _______  __   __  ___   _______  ___   _______  __    _  ___   __    _  _______        
  |       ||    _ |  |       ||  | |  ||   | |       ||   | |       ||  |  | ||   | |  |  | ||       |       
  |    _  ||   | ||  |   _   ||  |_|  ||   | |  _____||   | |   _   ||   |_| ||   | |   |_| ||    ___|       
  |   |_| ||   |_||_ |  | |  ||       ||   | | |_____ |   | |  | |  ||       ||   | |       ||   | __        
  |    ___||    __  ||  |_|  ||       ||   | |_____  ||   | |  |_|  ||  _    ||   | |  _    ||   ||  |       
  |   |    |   |  | ||       | |     | |   |  _____| ||   | |       || | |   ||   | | | |   ||   |_| |       
  |___|    |___|  |_||_______|  |___|  |___| |_______||___| |_______||_|  |__||___| |_|  |__||_______|       
   ___   __    _  _______  _______  ______    _______  _______  ______    _______  _______  _______  ______  
  |   | |  |  | ||       ||       ||    _ |  |       ||       ||    _ |  |   _   ||       ||       ||      | 
  |   | |   |_| ||       ||   _   ||   | ||  |    _  ||   _   ||   | ||  |  |_|  ||_     _||    ___||  _    |
  |   | |       ||       ||  | |  ||   |_||_ |   |_| ||  | |  ||   |_||_ |       |  |   |  |   |___ | | |   |
  |   | |  _    ||      _||  |_|  ||    __  ||    ___||  |_|  ||    __  ||       |  |   |  |    ___|| |_|   |
  |   | | | |   ||     |_ |       ||   |  | ||   |    |       ||   |  | ||   _   |  |   |  |   |___ |       |
  |___| |_|  |__||_______||_______||___|  |_||___|    |_______||___|  |_||__| |__|  |___|  |_______||______| 


                                      "All your provisioning provided"

'


# Constants
BASE=~/Documents/provisioning
APPS=~/Applications
NODE_MODULES=/usr/local/lib/node_modules
TARGET_MAC_VERSION=10
TARGET_MAC_RELEASE=10


MAJOR_MAC_VERSION=$(($(sw_vers -productVersion | awk -F '.' '{print $1}')+0))
MAJOR_MAC_RELEASE=$(($(sw_vers -productVersion | awk -F '.' '{print $2}')+0))
if [ $TARGET_MAC_VERSION -gt $MAJOR_MAC_VERSION ] || [ $TARGET_MAC_RELEASE -gt $MAJOR_MAC_RELEASE ]; then
  printf "\n\e[35mYou are running MacOS $MAJOR_MAC_VERSION.$MAJOR_MAC_RELEASE, which should be MacOS $TARGET_MAC_VERSION.$TARGET_MAC_RELEASE. Please upgrade before provisioning\e[0m!\n"
  read -p "Press [Enter] to exit..."
  exit
fi
printf "\n\e[35mYou are running MacOS $MAJOR_MAC_VERSION.$MAJOR_MAC_RELEASE, compatibale with the target MacOS ($TARGET_MAC_VERSION.$TARGET_MAC_RELEASE)\e[0m!\n"
## Set show all files
defaults write com.apple.finder AppleShowAllFiles YES


# Provisioning
## Check versions
printf "\n\e[35mOSX $MAJOR_MAC_VERSION pre-installs\e[0m:\n"
python --version
ruby --version
curl --version
gem --version | sed "s/^/Gem /"
openssl version
## Create provisioning dir
printf "\n\e[35mCreate provisioning dir\e[0m:\n"
cd ~/Documents
if [ ! -d "provisioning" ]
then
  mkdir provisioning
  printf "Provisioning dir created\n"
else
  printf "Provisioning dir exists\n"
fi
cd $BASE


# Update XCode
printf "\n\e[35mInstall XCode and all other AppStore apps manually\e[0m...\n"
read -p "Press [Enter] to continue when you're done..."
printf "\n\e[35mUpdating XCode\e[0m:\n"
xcode-select --install


# Ruby Gems
printf "\n\e[35mInstalling gems\e[0m:\n"
sudo gem install rails --no-rdoc --no-ri


# Python Pip
printf "\n\e[35mInstalling pips\e[0m:\n"
## Ansible
sudo -H easy_install pip
sudo -H pip install ansible
sudo -H pip install thefuck


# Homebrew 
printf "\n\e[35mInstalling brews\e[0m:\n"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update && brew upgrade && brew doctor
## Git
brew install git
## Wget
brew install wget
## Postgresql
brew install postgresql
## NodeJS
brew install homebrew/versions/node012
## Docker
brew install docker
brew install boot2docker


# Casks
printf "\n\e[35mInstalling casks\e[0m:\n"
brew install caskroom/cask/brew-cask
brew upgrade brew-cask
brew tap caskroom/versions
## Java
brew cask install java
## Little snitch
brew cask install little-snitch
## Google Chrome
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install chrome-remote-desktop-host
## Mozilla Firefox
brew cask install firefox
brew cask install firefoxdeveloperedition
## Opera
brew cask install opera
## iTerm2
brew cask install iterm2
printf "\e[36mHint\e[0m: Setup 'word-skipping', see http://stackoverflow.com/questions/81272/is-there-any-way-in-the-os-x-terminal-to-move-the-cursor-word-by-word\n"
## Sublime Text 3
brew cask install sublime-text3
## Symlink subl to open files from terminal
if [ ! -f "/usr/local/bin/subl" ]
  then 
	ln -s "~/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl 
fi
## Slack
brew cask install slack
## Atom
brew cask install atom
## Light-table
brew cask install lighttable
## WebStorm
brew cask install webstorm
## pycharm
brew cask install pycharm
## PHPStorm
brew cask install phpstorm
## MacVim
brew cask install macvim
## Charles
brew cask install charles
## Vagrant
brew cask install vagrant
printf "\e[36mHint\e[0m: Setup IE vm's, see https://dev.modern.ie/tools/vms/mac/\n"
## Jenkins
brew cask install jenkins
printf "\e[36mHint\e[0m: Runs Jenkins on http://localhost:8080/\n"
## SourceTree
brew cask install sourcetree
## VirtualBox
brew cask install virtualbox
## GitHub
brew cask install github-desktop
## Heroku
brew cask install heroku-toolbelt
## Transmit
brew cask install transmit
## Sequel pro
brew cask install sequel-pro
## VLC
brew cask install vlc
## UnArchiver
brew cask install the-unarchiver
## Handbrake
brew cask install handbrake
## Skype
brew cask install skype
## Spotify
brew cask install spotify
## MS Office
brew cask install microsoft-office
## Clean my mac
brew cask install cleanmymac


# Brewery cleanup
brew cleanup && brew cask cleanup


# NPM
printf "\n\e[35mInstalling node packages\e[0m:\n"
## Helper functions
function npm_install {
  if [ ! -f "$NODE_MODULES/$1" ] && [ ! -d "$NODE_MODULES/$1" ]
  then
    npm install -g $1
  else
    printf "\e[33m\e[4mWarning\e[0m: $1 already installed\n"
  fi
}
ls $NODE_MODULES
## Nvm
npm_install "nvm"
## Npm check updates
npm_install "npm-check-updates"
## Express
npm_install "express"
## Lodash
npm_install "lodash"
## Socket-io
npm_install "socket.io"
## Mongoose
npm_install "mongoose"
## Webpack
npm_install "webpack"
## Chalk
npm_install "chalk"
## Q
npm_install "q"
## Hapi
npm_install "hapi"
## Phantomjs
npm_install "phantomjs"
## Asyc
npm_install "async"
## Forever
npm_install "forever"
## CSurf
npm_install "csurf"
## Gulp
npm_install "gulp"
npm_install "gulp-cli"
## Grunt
npm_install "grunt"
npm_install "grunt-cli"
## Bower
npm_install "bower"
## Karma
npm_install "karma"
npm_install "karma-cli"
## Protractor
npm_install "protractor"
## Babel
npm_install "babel"


# Manual install
printf "\n\e[35mInstalling manually\e[0m:\n"
## Helper functions
function app_download {
  if [ ! -f "$1" ] && [ ! -d "$1" ]
  then
    printf "\e[32m\e[4mDownloading\e[0m: $2/$1\n"
    eval "curl -O -L --fail $2/$1 --verbose"
  else
    printf "\e[33m\e[4mWarning\e[0m: "
    echo "$1 already downloaded"
  fi
}
function app_install {
  if [ ! -f "$APPS/$1" ] && [ ! -d "$APPS/$1" ]
  then
    declare -a commands=("hdiutil mount \"$2\"" "cp -R -L \"$3/$1\" $APPS/" "hdiutil unmount \"$3\"")
    loop "commands"
  else
    printf "\e[33m\e[4mWarning\e[0m: $1 already installed\n"
  fi
}
function loop {
  name="$1[@]"
  a=("${!name}")
  for i in "${a[@]}" ; do
    printf "\e[32m\e[4mExecuting\e[0m: $i\n"
    eval $i
  done
}
## Transmission
URL_Transmission="http://download.transmissionbt.com/files"
DMG_Transmission="Transmission-2.84.dmg"
VOL_Transmission="/Volumes/Transmission"
APP_Transmission="Transmission.app"
app_download "$DMG_Transmission" "$URL_Transmission"
app_install "$APP_Transmission" "$DMG_Transmission" "$VOL_Transmission"


# Install zshell (oh my zsh)
printf "\n\e[35mInstalling oh my zsh\e[0m:\n"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
zsh


# Setup ~/.*rc
if [ ! -f "~/.bashrc" ]; then
  touch ~/.bashrc
fi
bashrc=~/.bashrc
zshrc=~/.zshrc
printf "\e[36mHint\e[0m: Setup terminal colors, see http://misc.flogisoft.com/bash/tip_colors_and_formatting\n"
printf "\e[36mHint\e[0m: Setup .bashrc and .zshrc, see provisioning.bashrc.txt\n\n"
printf "\e[41mThis add the complete provisioning.bashrc.txt to the end of your current ~/.bashrc and ~/.zshrc!\e[0m\n\n"
read -p "Are you sure?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
  then
    cat provisioning.bashrc.txt >> $bashrc
    cat provisioning.bashrc.txt >> $zshrc
  else
    printf "\e[36mSkipping ~/.bashrc and ~/.zshrc\e[0m...\n"
fi


printf '
                                          Thank you for using

                         _______  __   __  ___   _  _______  __   __  ___   _                                
                        |       ||  | |  ||   | | ||       ||  | |  ||   | | |                               
                        |____   ||  | |  ||   |_| ||____   ||  | |  ||   |_| |                               
                         ____|  ||  |_|  ||      _| ____|  ||  |_|  ||      _|                               
                        | ______||       ||     |_ | ______||       ||     |_                                
                        | |_____ |       ||    _  || |_____ |       ||    _  |                               
                        |_______||_______||___| |_||_______||_______||___| |_|                               
   _______  ______    _______  __   __  ___   _______  ___   _______  __    _  ___   __    _  _______        
  |       ||    _ |  |       ||  | |  ||   | |       ||   | |       ||  |  | ||   | |  |  | ||       |       
  |    _  ||   | ||  |   _   ||  |_|  ||   | |  _____||   | |   _   ||   |_| ||   | |   |_| ||    ___|       
  |   |_| ||   |_||_ |  | |  ||       ||   | | |_____ |   | |  | |  ||       ||   | |       ||   | __        
  |    ___||    __  ||  |_|  ||       ||   | |_____  ||   | |  |_|  ||  _    ||   | |  _    ||   ||  |       
  |   |    |   |  | ||       | |     | |   |  _____| ||   | |       || | |   ||   | | | |   ||   |_| |       
  |___|    |___|  |_||_______|  |___|  |___| |_______||___| |_______||_|  |__||___| |_|  |__||_______|       
   ___   __    _  _______  _______  ______    _______  _______  ______    _______  _______  _______  ______  
  |   | |  |  | ||       ||       ||    _ |  |       ||       ||    _ |  |   _   ||       ||       ||      | 
  |   | |   |_| ||       ||   _   ||   | ||  |    _  ||   _   ||   | ||  |  |_|  ||_     _||    ___||  _    |
  |   | |       ||       ||  | |  ||   |_||_ |   |_| ||  | |  ||   |_||_ |       |  |   |  |   |___ | | |   |
  |   | |  _    ||      _||  |_|  ||    __  ||    ___||  |_|  ||    __  ||       |  |   |  |    ___|| |_|   |
  |   | | | |   ||     |_ |       ||   |  | ||   |    |       ||   |  | ||   _   |  |   |  |   |___ |       |
  |___| |_|  |__||_______||_______||___|  |_||___|    |_______||___|  |_||__| |__|  |___|  |_______||______| 


                                  "All your provisioning are belong to us"
'


# ## Install ZIP manually
# printf "\n\e[35mInstalling applications\e[0m:\n"
# # iTerm
# download "$ZIP_iTerm" "$URL_iTerm"
# declare -a commands=("unzip $ZIP_iTerm" "cp -r $APP_iTerm $APPS/" "rm -rf $APP_iTerm")
# app_install "$APP_iTerm" "commands"
# ## Install DMG/APP manually
# # WebStorm 10.0.4
# download "$DMG_WebStorm" "$URL_WebStorm"
# declare -a commands=("hdiutil mount $DMG_WebStorm" "cp -r \"$VOL_WebStorm/$APP_WebStorm\" $APPS/" "hdiutil unmount \"$VOL_WebStorm\"")
# app_install "$APP_WebStorm" "commands"
# ## Install DMG/PKG manually
# # Vagrant 1.7
# download "$DMG_Vagrant" "$URL_Vagrant"
# declare -a commands=("hdiutil mount \"$DMG_Vagrant\"" "installer -verboseR -pkg \"$VOL_Vagrant/Install $PKG_Vagrant\" -target /" "hdiutil unmount \"$VOL_Vagrant\"")
# app_install "$APP_Vagrant" "commands"


