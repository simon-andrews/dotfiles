define addfilefor
	if which $1; then \
		ln -s $(shell pwd)/$2 $(HOME)/$2; \
	fi
endef

all: bash npm nvim readline redshift tmux vim-plug

bash: $(HOME)/.bashrc $(HOME)/.bash_profile
$(HOME)/.bashrc:
	$(call addfilefor,bash,.bashrc)
$(HOME)/.bash_profile:
	$(call addfilefor,bash,.bash_profile)

npm: $(HOME)/.npmrc
$(HOME)/.npmrc:
	$(call addfilefor,npm,.npmrc)

nvim: $(HOME)/.config/nvim/init.vim vim-plug
$(HOME)/.config/nvim/init.vim:
	mkdir -p $(HOME)/.config/nvim
	$(call addfilefor,nvim,.config/nvim/init.vim)

# readline doesn't put any executables on path, so next best thing is bash
readline: $(HOME)/.inputrc
$(HOME)/.inputrc:
	$(call addfilefor,bash,.inputrc)

redshift: $(HOME)/.config/redshift/redshift.conf
$(HOME)/.config/redshift/redshift.conf:
	mkdir -p $(HOME)/.config/redshift
	$(call addfilefor,redshift,.config/redshift/redshift.conf)

tmux: $(HOME)/.tmux.conf
$(HOME)/.tmux.conf:
	$(call addfilefor,tmux,.tmux.conf)

vim-plug: $(HOME)/.local/share/nvim/site/autoload/plug.vim
$(HOME)/.local/share/nvim/site/autoload/plug.vim:
	mkdir -p $(HOME)/.local/share/nvim/site/autoload
	curl -fLo $(HOME)/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# x: $(HOME)/.xinitrc
# $(HOME)/.xinitrc:
# 	$(call addfilefor,startx,.xinitrc)

.PHONY: all bash npm nvim readline redshift tmux vim-plug
