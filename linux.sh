Install Cmd:
dd bs=4M if=2020-02-13-raspbian-buster.img of=/dev/sdd status=progress conv=fsync

apt-get install nginx-extras
apt-get install mc 
apt install ufw 
golang
brave chromium firefox 
vim exuberant-ctags vscode 
gwenview sxiv feh 
libreoffice libreoffice-styles-elementary libreoffice-styles-colibre 
youtube-dl virtualbox font-config calibre gimp opera 
yarn npm pnpm 
mariadb-client mariadb-server postgresql sqlite3 mongodb-org
pip python3 vlc mc pwgen fish bind9-dnsutils bzip2 gzip docker
filezilla tree nmap

git checkout https://www.github.com/hakuamesan/dotfiles/ 


chrome flags

chrome://flags/#enable-filesystem-in-incognito
chrome://flags/#enable-quic
chrome://flags/#enable-force-dark
chrome://flags/#extensions-toolbar-menu
chrome://flags/#enable-reader-mode
chrome://flags/#tab-groups
chrome://flags/#PasswordImport
chrome://flags/#enable-webrtc-hide-local-ips-with-mdns
chrome://flags/#show-legacy-tls-warnings

chrome extensions
Ublock origin
Privacy Badger



Vim-plug manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

vim
:PlugInstall

# https://github.com/jorgebucaran/fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
fisher jethrokuan/z fishpkg/fish-prompt-metro jethrokuan/fzf




# NVM - https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

#Add fish function to ~/.config/fish/functions/nvm.fish to load nvm:
function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# Using Ubuntu
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Using Debian, as root
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt-get install -y nodejs

curl -sL https://npmjs.org/install | bash -
npm i -g pnpm yarn



# Mongodb installatino
# https://docs.mongodb.com/manual/tutorial/install-mongodb-on-debian/

# Direct binary installation
https://repo.mongodb.org/apt/debian/dists/buster/mongodb-org/4.2/main/binary-amd64/mongodb-org-server_4.2.8_amd64.deb

# Apt version
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org

root: egTshsaqky03uYhl
ananth: 

mongodb+srv://<username>:<password>@cluster0-qwzdc.mongodb.net/test






# Fisher script to fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# or   set XDG_CONFIG_HOME ~/.config
if not functions -q fisher
    set -q XDG_CONFIG_HOME; 
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

fisher add edc/bass
# check latest version at https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# copy this function to ~/.config/fish/functions/nvm.fish
function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# Check nodejs.org for latest version
nvm install 14.6.0


curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt-get -o Dpkg::Options::="--force-overwrite" install yarn

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt-get install yarn



# Using Ubuntu
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Using Debian, as root
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt-get install -y nodejs

# VirtualBox auto-resize full screen
# Change video driver to VBoxSVGA from vbox
# sudo apt install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

I managed to solve the problem with VBoxSVGA screen resizing. It took almost an hour. First, make sure that your kernel is built with CONFIG_DRM_VMWGFX and vmwgfx is loaded.

Second (most tricky part) - make sure that /usr/bin/VBoxClient --vmsvga is launched AS ROOT!!!! Otherwise it lacks some permissions. Now I just added it into system bootup scripts.

# Disable plymouth and other services

$ cat /etc/default/grub
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="rd.driver.blacklist=nouveau resume=/dev/mapper/fedora-swap rd.lvm.lv=fedora/root rd.lvm.lv=fedora/swap rhgb quiet nouveau.modeset=0 rd.plymouth=0 plymouth.enable=0"
GRUB_DISABLE_RECOVERY="true"


$ grub-mkconfig -o /boot/grub/grub.cfg
$ /sbin/reboot


apt install net-tools: arp
apt install firefox uuid-runtime
apt install ufw
apt install golint nasm docker.io ccze npm nodejs golang-golang-x-tools


# Korean Fonts
apt install fonts-lexi-gulim fonts-lexi-saebom
apt install fonts-alee fonts-baekmuk fonts-nanum fonts-noto-cjk fonts-noto-cjk-extra



# Homebrew for GO

xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
mkdir -p $GOPATH/src $GOPATH/pkg $GOPATH/bin
brew cask install visual-studio-code
code --install-extension golang.go
go get -u github.com/go-delve/delve/cmd/dlv
brew install golangci/tap/golangci-lint



apt install meson 
libglu1-mesa-dev
freeglut3-dev
libzstd-dev
asciidoc-base
libnsgif-dev
libheif-dev
libcmocka-dev
libglu-dev
imv #image viewer
libgl-dev
colcheck
libspng-dev
libx11-dev
plocate
strace
ltrace
svgo
npm
pnpm
libopenjp2-tools
python3-imagesize
libxkbcommon-x11-dev

