all: bash nvim readline tmux

bash: $(HOME)/.bashrc $(HOME)/.bash_profile
$(HOME)/.bashrc:
	ln -s $(shell pwd)/.bashrc $(HOME)/.bashrc
$(HOME)/.bash_profile:
	ln -s $(shell pwd)/.bash_profile $(HOME)/.bash_profile

nvim: $(HOME)/.config/nvim/init.vim
$(HOME)/.config/nvim/init.vim:
	mkdir -p $(HOME)/.config/nvim
	ln -s $(shell pwd)/.config/nvim/init.vim $(HOME)/.config/nvim/init.vim

readline: $(HOME)/.inputrc
$(HOME)/.inputrc:
	ln -s $(shell pwd)/.inputrc $(HOME)/.inputrc

tmux: $(HOME)/.tmux.conf
$(HOME)/.tmux.conf:
	ln -s $(shell pwd)/.tmux.conf $(HOME)/.tmux.conf

.PHONY: all bash nvim readline tmux
