all: tmux vim

vim: $(HOME)/.vimrc
$(HOME)/.vimrc:
	mkdir -p $(HOME)/.config/nvim
	ln -s $(shell pwd)/.config/nvim/init.vim $(HOME)/.config/nvim/init.vim

tmux: $(HOME)/.tmux.conf
$(HOME)/.tmux.conf:
	ln -s $(shell pwd)/.tmux.conf $(HOME)/.tmux.conf

.PHONY: all nvim tmux
