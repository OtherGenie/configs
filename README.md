# SSH for Github

```bash
# generate ssh key
ssh-keygen -t ed25519 -C "genie.other@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/other_genie

cp ./ssh_config ~/.ssh/config

# in /etc/hosts
140.82.114.3 github.com-othergenie
```

```bash
# update default terminal
sudo update-alternatives --config x-terminal-emulator

# update default shell
chsh -s <shell>

# build essentials
sudo apt install build-essentials

# i3, status_command
sudo apt-get install i3blocks

# install gvm
sudo apt-get install curl git mercurial make binutils bison gcc build-essential bison
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
## to install go 1.25+
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.17.13
gvm use go1.17.13
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.20
gvm use go1.20
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.23.12
gvm use go1.23.12
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.25.1
gvm use --default go1.25.1

# install JetBrainsMono font
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
sudo unzip ./JetBrainsMono.zip -d /usr/share/fonts/JetBrainsMono
fc-cache -f -v
rm JetBrainsMono.zip

# install xclip for clipboard provider in neovim
sudo apt-get install xclip
```
