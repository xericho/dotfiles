# Directory of Makefile
ROOT_DIR = $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

# Required dependencies
PKGS = zsh tmux curl clang cmake 

# ZSH 
ZSH_OMZ = $(HOME)/.oh-my-zsh
ZSH_SH = $(ZSH_OMZ)/custom/plugins/zsh-syntax-highlighting
ZSH_AS = $(ZSH_OMZ)/custom/plugins/zsh-autosuggestions
ZSH_PL = $(ZSH_OMZ)/themes/powerlevel10k

# VIM
VIM_DIR = $(HOME)/.vim_runtime
VIM_VUN = $(HOME)/.vim/bundle/Vundle.vim
VIM_AC = $(HOME)/.vim/bundle/YouCompleteMe/install.py 
VIM_CONFIG = $(HOME)/.vim_runtime/my_configs.vim

# TMUX
TMUX_DIR = $(HOME)/.tmux


ubuntu: init-ubuntu tmux zsh 
	@echo -e '\nInstallation complete!'

amazon-linux: init-amazon-linux tmux zsh 
	@echo -e '\nInstallation complete!'

init-ubuntu:
	@sudo apt update -y
	@sudo apt upgrade -y
	@sudo apt install $(PKGS) -y
	@sudo apt install powerline -y
	@sudo apt install fonts-powerline -y
	@echo -e '\nDone updating packages!'

init-amazon-linux:
	@sudo yum update -y
	@sudo yum upgrade -y
	@sudo yum install $(PKGS) -y
	# Install powerline
	@pip3.8 install powerline-status
	# Install powerline fonts
	@git clone https://github.com/powerline/fonts.git fonts-powerline --depth=1
	@./fonts-powerline/install.sh
	@rm -rf fonts-powerline
	@echo -e '\nDone updating packages!'


zsh: | oh-my-zsh $(ZSH_SH) $(ZSH_AS) $(ZSH_PL) 
	@cp ${ROOT_DIR}/.zshrc ${HOME}
	@cp ${ROOT_DIR}/.p10k.zsh ${HOME}
	@echo -e '\nDone setting up zsh!'


test: 
	@echo $(ROOT_DIR)
.PHONY: test

# Install oh my zsh
oh-my-zsh:
	@if [ ! -d $(ZSH_OMZ) ]; then \
		curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh; \
		sh ./install.sh --unattended; \
		rm ./install.sh; \
	fi

# zsh-syntax-highlighting
$(ZSH_SH):
	@git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $@

# zsh-autosuggestions
$(ZSH_AS):
	@git clone https://github.com/zsh-users/zsh-autosuggestions $@
	
# powerlevel10k theme
$(ZSH_PL):
	@git clone https://github.com/romkatv/powerlevel10k.git $@


vim: | $(VIM_DIR) $(VIM_VUN) $(VIM_AC)
	@cp $(ROOT_DIR)/vim/onedark.vim $(VIM_DIR)/sources_non_forked/lightline.vim/autoload/lightline/colorscheme
	@cp $(ROOT_DIR)/vim/my_configs.vim $(VIM_DIR)
	@cp $(ROOT_DIR)/vim/htmldjango.snippets $(VIM_DIR)/sources_non_forked/vim-snippets/snippets/
	@echo -e '\nDone setting up vim!'

# vim goodies
$(VIM_DIR):
	@git clone https://github.com/amix/vimrc.git $@ --depth=1
	@sh $@/install_awesome_vimrc.sh

# vundle
$(VIM_VUN):
	@git clone https://github.com/VundleVim/Vundle.vim.git $@

# vim-autocomplete
$(VIM_AC):
	@cp $(ROOT_DIR)/vim/my_configs.vim $(VIM_DIR)
	@vim -c ':PluginInstall' -c 'q' -c 'q'
	@$@ --clangd-completer


tmux: | $(TMUX_DIR)
	@cp $(ROOT_DIR)/.tmux.conf.local $(HOME)
	@echo -e '\nDone setting up tmux!'

# tmux goodies
$(TMUX_DIR):
	@(cd; git clone https://github.com/gpakosz/.tmux.git; ln -s -f .tmux/.tmux.conf)



# Dont need these commands
fetch: fetch_zsh fetch_vim
	@echo -e '\nFetched all local dotfiles!'

fetch_vim:
	@cp $(VIM_CONFIG) $(ROOT_DIR) 
	@echo 'Fetched my_configs.vim!'

fetch_zsh:
	@cp $(HOME)/.zshrc $(ROOT_DIR)
	@echo 'Fetched .zshrc!'

fetch_tmux:
	@cp $(HOME)/.tmux.conf.local $(ROOT_DIR)
	@echo 'Fetched .tmux.conf.local!'
