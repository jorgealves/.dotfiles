

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# FZF config
[ -f ~/.fzf.zsh ] && source $HOME/.fzf.zsh



### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/jorgealves/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
. "$HOME/.cargo/env"
