# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

alias copy='xsel -b'
alias l='ls -hal --color=auto'
alias ls='ls --color=auto'
alias objdump='objdump -M intel'
alias vim='echo "Use nvim instead!"'

PS1='[\W]\$ '
# where
#  \W is name of current directory
#  \$ is $

# Initialize pyenv. Reset $PROMPT_COMMAND since pyenv-virtualenv introduces a
# hook with noticable latency.
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
OLD_PROMPT_COMMAND="$PROMPT_COMMAND"
eval "$(pyenv virtualenv-init -)"
export PROMPT_COMMAND="$OLD_PROMPT_COMMAND"

export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
