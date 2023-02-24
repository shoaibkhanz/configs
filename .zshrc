# aliases
alias awsume=". awsume"
alias lz="lazygit"
alias gtp="cd ~/github-personal"
alias gtc="cd ~/github-ch"
alias cde="conda deactivate"
alias cda="conda activate $1"
alias nvim="~/nvim-macos/bin/nvim"
alias nv="~/nvim-macos/bin/nvim"
alias zs="nv ~/.zshrc"
alias python="python3"
alias ls='exa --long --git -a --header --group'
alias tree='exa --tree --level=2 --long -a --header --git'

# tmux aliases
alias tmc="nv ~/.tmux.config"
alias tmka="tmux kill-session"
alias tmk="tmux kill-session -t $1"
alias tma="tmux attach -t $1"
alias tmn="tmux new -s $1"
alias tml="tmux list-session"


export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# Allows comments in zsh - https://unix.stackexchange.com/a/33995/121986
set -k


eval "$(starship init zsh)"
