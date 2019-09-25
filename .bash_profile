#
# ~/.bash_profile
#

# this sucks, I'll get a display manager someday
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

# if .bashrc, run it
[[ -f ~/.bashrc ]] && . ~/.bashrc
