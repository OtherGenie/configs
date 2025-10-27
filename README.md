# SSH for Github

```
cp ./starship/starship.toml ~/.config/starship.toml
cp -r ./i3 ./fish ./alacritty ./lazyvim ~/.config/.
```

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

# essential packages
sudo apt-get install \
 build-essential \
 git \
 i3 \
 i3blocks \
 htop \
 tmux \
 feh \
 jq \
 rsync \
 nautilus \
 fonts-font-awesome \
 alacritty \
 xclip \
 fish \
 fd-find \
 # fzf \
 picom \
 gnome-screenshot \
 lm-sensors \
 neofetch \
 scrot \
 ripgrep \
 curl

# install starship

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

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

# nvidia
# in /etc/apt/sources.list
# deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware
sudo apt update
sudo apt install nvidia-driver

# update default editor for git
git config --global core.editor "nvim"

# install brew
# in fish config: eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install latest fzf
brew install fzf

# install uv
brew install uv
# uv autocompletion
echo 'uv generate-shell-completion fish | source' > ~/.config/fish/completions/uv.fish
```
