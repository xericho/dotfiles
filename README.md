# Install / Update dotfiles
Clone this repo and run the following to install/update all packages:
```
cd dotfiles
make install
```
or install/update specific dotfiles:
```
make [zsh/vim/tmux/lf]
```

## MacOS Setup
```
chmod u+x brew.sh
./brew.sh
```

# Fetch dotfiles 
If you want to pull in your local dotfiles, run:
```
make fetch
```
or pull specific dotfiles:
```
make fetch_[zsh/vim]
```


# Optional
Change default shell to zsh by running `chsh -s $(which zsh)`



# Sources
1. https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#how-to-install-zsh-in-many-platforms
2. https://github.com/ohmyzsh/ohmyzsh
3. https://github.com/powerline/fonts
4. https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
5. https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
6. https://github.com/romkatv/powerlevel10k#manual
7. https://github.com/gokcehan/lf/wiki/Tutorial
8. https://github.com/amix/vimrc

    ```
    sudo apt install -y clang python3-dev cmake
    ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer
    ```
9. https://github.com/gpakosz/.tmux
10. https://keypirinha.com/download.html
11. https://www.autohotkey.com/
