# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Some handy shortcuts
alias copy="xsel -b"
alias l="ls -hal --color=auto"
alias ls="ls --color=auto"
alias objdump="objdump -M intel"
alias vim="echo \"Use nvim instead!\""

# Misc. preferences
export EDITOR="nvim"

# The thing bash prints before you type your command
function __git_branch_ps1 {
  branch_name="$(git symbolic-ref --short HEAD 2> /dev/null)"
  if [ "$?" -eq 0 ]; then
    echo " ($branch_name)"
  else
    echo
  fi
}
PS1='[\W]$(__git_branch_ps1) \$ '
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

# Path stuff
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
