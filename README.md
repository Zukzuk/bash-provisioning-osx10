# bash-provisioning-osx10
An idempotent bash provisioning script that will transform your mac into a developer's powerhouse.

## Run
Simply run ```bash provisioning.sh``` in your terminal and watch it goooooooo. 
You can also run ```source provisioning.sh``` to immediatley source the new bash_profile into the terminal instance.

Only tested on my own macbook, with OSX Yosemite 10.10.5

## Currently the following list is provisioned:

#### Default folders

 - BASE=~/Documents/provisioning
 - APPS=~/Applications
 - NODE_MODULES=/usr/local/lib/node_modules

#### Supposed pre-installed MacOSX packages

 - [Python](https://www.python.org/)
 - [Ruby](https://www.ruby-lang.org/en/)
 - [CURL](http://curl.haxx.se/docs/manpage.html)
 - [Gem](https://rubygems.org/)
 - [OpenSSL](https://www.openssl.org/)

#### XCode

 - [XCode](https://developer.apple.com/xcode/) should be installed through the AppStore. 
 This script will run updates for you.

#### ZSH

 - [Oh My Zsh](http://ohmyz.sh/)

#### Ruby Gems

 - [Rails](http://rubyonrails.org/)

#### Python Pip

 - [Ansible](http://docs.ansible.com/ansible/)
 - [TheFuck](https://github.com/nvbn/thefuck)

#### Homebrews

 - [Git](https://help.github.com/articles/good-resources-for-learning-git-and-github/)
 - [Wget](http://www.gnu.org/software/wget/)
 - [Postgresql](http://www.postgresql.org/)
 - [NodeJS](https://nodejs.org/en/)
 - [Docker](https://www.docker.com/)

#### Homebrew casks

 - [Java](https://www.java.com/en/download/)
 - [Little Snitch](https://www.obdev.at/products/littlesnitch/index.html)
 - [Google Chrome](https://www.google.nl/chrome/browser/desktop/)
 - [Google Chrome Canary](https://www.google.nl/chrome/browser/canary.html)
 - [Chrome Remote Desktop](https://chrome.google.com/webstore/detail/chrome-remote-desktop/gbchcmhmhahfdphkhkmpfmihenigjmpp?hl=nl)
 - [Mozilla Firefox](https://www.mozilla.org/nl/firefox/new/)
 - [Mozilla Firefox Developers Edition](https://www.mozilla.org/nl/firefox/developer/)
 - [Opera](http://www.opera.com)
 - [iTerm2](https://www.iterm2.com/)
 - [namebench](https://code.google.com/p/namebench/)
 - [Sublime Text 3](http://www.sublimetext.com/3)
 - [Atom](https://atom.io/)
 - [WebStorm](https://www.jetbrains.com/webstorm/)
 - [PyCharm](https://www.jetbrains.com/pycharm/)
 - [PHPStorm](https://www.jetbrains.com/phpstorm/)
 - [MacVim](http://usevim.com/2014/10/31/macvim-yosemite/)
 - [Charles](http://www.charlesproxy.com/)
 - [Vagrant](https://www.vagrantup.com/)
 - [Jenkins](https://jenkins-ci.org/)
 - [SourceTree](https://www.sourcetreeapp.com/)
 - [VirtualBox](https://www.virtualbox.org/)
 - [Slack](https://slack.com/)
 - [GitHub](https://github.com/)
 - [Heroku](https://www.heroku.com/)
 - [Transmit](https://panic.com/transmit/)
 - [Sequel pro](http://www.sequelpro.com/)
 - [VLC](http://www.videolan.org/vlc/)
 - [Inky](http://inky.com/)
 - [The Unarchiver](http://unarchiver.c3.cx/unarchiver)
 - [Handbrake](https://handbrake.fr/)
 - [Slack](https://slack.com/)
 - [Skype](http://www.skype.com/nl/)
 - [Spotify](https://www.spotify.com/nl/)
 - [MS Office](https://products.office.com/nl-nl/home)
 - [Clean My Mac](http://macpaw.com/cleanmymac)

#### NPM packages

 - [NVM](https://www.npmjs.com/package/nvm)
 - [NPM-check-updates](https://www.npmjs.com/package/npm-check-updates)
 - [Express](https://www.npmjs.com/package/express)
 - [Lodash](https://www.npmjs.com/package/lodash)
 - [Socket-io](https://www.npmjs.com/package/socket.io)
 - [Mongoose](https://www.npmjs.com/package/mongoose)
 - [Webpack](https://www.npmjs.com/package/webpack)
 - [Chalk](https://www.npmjs.com/package/chalk)
 - [Q](https://www.npmjs.com/package/q)
 - [Hapi](https://www.npmjs.com/package/hapi)
 - [Phantomjs](https://www.npmjs.com/package/phantomjs)
 - [Redis](https://www.npmjs.com/package/mongoose)
 - [Asyc](https://www.npmjs.com/package/async)
 - [Forever](https://www.npmjs.com/package/forever)
 - [CSURF](https://www.npmjs.com/package/csurf)
 - [Gulp](https://www.npmjs.com/package/gulp)
 - [Gulp-cli](https://www.npmjs.com/package/gulp-cli)
 - [Grunt](https://www.npmjs.com/package/grunt)
 - [Grunt-cli](https://www.npmjs.com/package/grunt-cli)
 - [Bower](https://www.npmjs.com/package/bower)
 - [Karma](https://www.npmjs.com/package/karma)
 - [Karma-cli](https://www.npmjs.com/package/karma-cli)
 - [Protractor](https://www.npmjs.com/package/protractor)
 - [Babel](https://www.npmjs.com/package/babel)

#### Scripted installs

 - [Transmission](http://download.transmissionbt.com)
