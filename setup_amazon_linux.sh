#!/bin/bash

echo '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo '@             Updating environment                  @'
echo '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
sudo yum update -y
sudo yum upgrade -y

echo '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo '@                Setup environment                  @'
echo '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
sudo yum install -y zsh
# Install powerline
pip3.8 install powerline-status
# Install powerline fonts
git clone https://github.com/powerline/fonts.git fonts-powerline --depth=1
./fonts-powerline/install.sh
rm -rf fonts-powerline
# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# powerlevel10k theme
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k --depth=1
cp $HOME/dotfiles/.zshrc $HOME
cp $HOME/dotfiles/.p10k.zsh $HOME
# Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc
# plugins=(git zsh-syntax-highlighting zsh-autosuggestions sudo z)

# Change zsh to default by editing line from /etc/passwd:
# username:x:1634231:100:Your Name:/home/username:/bin/bash to /bin/zsh

# vim stuff
git clone https://github.com/amix/vimrc.git $HOME/.vim_runtime --depth=1
sh $HOME/.vim_runtime/install_awesome_vimrc.sh
echo "set number" >> "$HOME/.vimrc"
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
cp $HOME/dotfiles/onedark.vim $HOME/.vim_runtime/sources_non_forked/lightline.vim/autoload/lightline/colorscheme
cp $HOME/dotfiles/my_configs.vim $HOME/.vim_runtime

# lf file manager
mkdir -p $HOME/.local/bin
curl -L https://github.com/gokcehan/lf/releases/download/r13/lf-linux-amd64.tar.gz | tar xzC $HOME/.local/bin
echo 'export PATH="$PATH:/home/$USER/.local/bin"' >> "$HOME/.zshrc"

# tmux stuff
(cd; git clone https://github.com/gpakosz/.tmux.git)
ln -s -f $HOME/.tmux/.tmux.conf
cp $HOME/dotfiles/.tmux.conf.local $HOME

# change dir colors
cp $HOME/dotfiles/.dircolors $HOME

# snippet for django
cp $HOME/dotfiles/htmldjango.snippets $HOME/.vim_runtime/sources_non_forked/vim-snippets/snippets/

# Install autocomplete for vim
vim -c ':PluginInstall' -c 'q' -c 'q'
sudo yum install -y clang cmake
$HOME/.vim/bundle/YouCompleteMe/install.py --clangd-completer
