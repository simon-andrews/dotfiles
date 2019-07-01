all: tmux vim

tmux: $(HOME)/.tmux.conf
$(HOME)/.tmux.conf:
	ln -s $(shell pwd)/.tmux.conf $(HOME)/.tmux.conf

vim: $(HOME)/.vimrc
$(HOME)/.vimrc:
	ln -s $(shell pwd)/.vimrc $(HOME)/.vimrc

.PHONY: all tmux vim
