#!/bin/bash

echo '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo '@             Updating environment                  @'
echo '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
sudo apt update -y
sudo apt upgrade -y


# Optional: install zsh
echo '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo '@                Setup environment                  @'
echo '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
sudo apt install -y zsh
sudo apt install -y powerline fonts-powerline
# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# powerlevel10k theme
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k --depth=1
# Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc
# plugins=(git zsh-syntax-highlighting zsh-autosuggestions sudo z)

# Change zsh to default by editing line from /etc/passwd:
# username:x:1634231:100:Your Name:/home/username:/bin/bash to /bin/zsh

# vim stuff
git clone https://github.com/amix/vimrc.git ~/.vim_runtime --depth=1
sh ~/.vim_runtime/install_awesome_vimrc.sh
echo "set number" >> "$HOME/.vimrc"

# lf file manager
mkdir -p $HOME/.local/bin
curl -L https://github.com/gokcehan/lf/releases/download/r13/lf-linux-amd64.tar.gz | tar xzC ~/.local/bin
echo 'export PATH="$PATH:/home/$USER/.local/bin"' >> "$HOME/.zshrc"

# tmux stuff
(cd; git clone https://github.com/gpakosz/.tmux.git)
ln -s -f ~/.tmux/.tmux.conf
cp ~/.tmux/.tmux.conf.local ~
