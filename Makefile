define addfilefor
	which $1 &> /dev/null; \
	if [ $$? -eq 0 ]; then \
		ln -s $(shell pwd)/$2 $(HOME)/$2; \
	fi
endef

all: bash nvim readline redshift tmux

bash: $(HOME)/.bashrc $(HOME)/.bash_profile
$(HOME)/.bashrc:
	$(call addfilefor,bash,.bashrc)
$(HOME)/.bash_profile:
	$(call addfilefor,bash,.bash_profile)

nvim: $(HOME)/.config/nvim/init.vim
$(HOME)/.config/nvim/init.vim:
	$(call addfilefor,nvim,.config/nvim/init.vim)

# readline doesn't put any executables on path, so next best thing is bash
readline: $(HOME)/.inputrc
$(HOME)/.inputrc:
	$(call addfilefor,bash,.inputrc)

redshift: $(HOME)/.config/redshift/redshift.conf
$(HOME)/.config/redshift/redshift.conf:
	$(call addfilefor,redshift,.config/redshift/redshift.conf)

tmux: $(HOME)/.tmux.conf
$(HOME)/.tmux.conf:
	$(call addfilefor,tmux,.tmux.conf)

.PHONY: all bash nvim readline tmux
