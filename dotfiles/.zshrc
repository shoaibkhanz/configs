# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias cls="clear"
alias python="python3"
alias cda="conda activate $1"
alias cde="conda deactivate"
alias zrc="nvim ~/.zshrc"
alias nv="nvim ~/.config"
alias sshnv="nvim ~/.ssh"
alias src="source ~/.zshrc"
alias pr="poetry run $1"
alias prn="poetry run nvim"
alias lz="lazygit"

alias ad="awsume datascience"

# k8s shortcuts
alias kubectl="kubecolor"
alias k="kubectl"
alias eks="eksctl"
alias kns="kubecolor get ns"
alias kga="kubecolor  get all -n $1"
alias kp="kubecolor get po"
alias hp="export HEAD_POD=$(kubectl get pods --selector=ray.io/node-type=head -o custom-columns=POD:metadata.name --no-headers)"
alias kpo="kubectl port-forward $HEAD_POD $1"
# This needs to be added before "compdef kubecolor=kubectl"
source <(kubectl completion zsh)
# Make "kubecolor" borrow the same completion logic as "kubectl"
compdef kubecolor=kubectl


# docker
alias db="docker build"
alias dr="docker run"
alias dp="docker push"

alias ls='eza --long --git -a --header --group'     # Alias for 'eza' command with options for long listing, git status, all files, header, and grouping
alias tree='eza --tree --level=2 --long -a --header --git' # Alias for 'eza' command with options for showing a tree view, limited to 2 levels, long listing, all files, header, and git status

# More aliases using eza
alias ll='eza --long --git --header --group --time-style=long-iso'  # Alias for 'eza' command with options for long listing, git status, header, grouping, and long-ISO time format
alias la='eza --long --git --all --header --group --time-style=long-iso'  # Alias for 'eza' command with options for long listing, git status, all files, header, grouping, and long-ISO time format
alias l.='eza --long --git --header --group --time-style=long-iso .'  # Alias for 'eza' command with options for long listing, git status, header, grouping, long-ISO time format, and current directory
alias lsr='eza --long --git --header --group --time-style=long-iso --recurse'  # Alias for 'eza' command with options for long listing, git status, header, grouping, long-ISO time format, and recursive listing

# Tmux aliases
if [[ -x "$(command -v tmux)" ]]; then
  # Basic tmux commands
  alias tm="tmux"                    # Alias for 'tmux'
  alias tmc="nvim ~/.tmux.conf"        # Alias for 'nv ~/.tmux.conf' (edit the tmux configuration file)
  alias tmka="tmux kill-session"     # Alias for 'tmux kill-session' (kill the current tmux session)
  alias tmk="tmux kill-session -t $1" # Alias for 'tmux kill-session -t $1' (kill the specified tmux session)
  alias tma="tmux attach -t $1"      # Alias for 'tmux attach -t $1' (attach to the specified tmux session)
  alias tmn="tmux new -s $1"         # Alias for 'tmux new -s $1' (create a new tmux session with the specified name)
  alias tml="tmux list-sessions"     # Alias for 'tmux list-sessions' (list all tmux sessions)
fi

export PATH="$HOME/.local/bin/:$HOME/.config/nvim:$HOME/.cargo/bin:$HOME/go/bin/:$PATH"
eval "$(zoxide init --cmd cd zsh)"

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

source <(fzf --zsh)

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# make sure to brew install fzf
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Add zsh-completions to fpath
fpath+=("${ZINIT_HOME}/plugins/zsh-users---zsh-completions/src")

# Load completions
# autoload -Uz compinit && compinit -u
autoload -Uz compinit && compinit -v

# Enable menu selection for completions
zstyle ':completion:*' menu select

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Enable path expansion
setopt AUTO_MENU
setopt AUTO_LIST
setopt AUTO_PARAM_SLASH

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Replay zinit commands
zinit cdreplay -q


# Pure Settings
# fpath+=($HOME/.zsh/pure)
# autoload -U promptinit; promptinit
# # optionally define some options
# PURE_CMD_MAX_EXEC_TIME=10
# # change the path color
# zstyle :prompt:pure:path color white
# # change the color for both `prompt:success` and `prompt:error`
# zstyle ':prompt:pure:prompt:*' color cyan
# # turn on git stash status
# zstyle :prompt:pure:git:stash show yes
# prompt pure

# Git aliases
if [[ -x "$(command -v git)" ]]; then
  # Basic git commands
  alias g='git'                # Alias for 'git'
  alias ga='git add'           # Alias for 'git add' (stage changes)
  alias gc='git commit'        # Alias for 'git commit' (commit changes)
  alias gcm='git commit -m'    # Alias for 'git commit -m' (commit changes with a message)
  alias gd='git diff'          # Alias for 'git diff' (show changes between commits)
  alias gds='git diff --staged' # Alias for 'git diff --staged' (show changes between the staging area and the last commit)
  alias gl='git log'           # Alias for 'git log' (show commit logs)
  alias gpl='git pull'         # Alias for 'git pull' (fetch and merge changes from the remote repository)
  alias gps='git push'         # Alias for 'git push' (push changes to the remote repository)
  alias gpf='git push --force-with-lease' # Alias for 'git push' (push my changes, but only if the remote repository is in the same state as my last fetch)
  alias gr='git remote'        # Alias for 'git remote' (manage set of tracked repositories)
  alias grv='git remote -v'    # Alias for 'git remote -v' (list tracked repositories and their URLs)
  alias gs='git status'        # Alias for 'git status' (show the status of changes)

  # Branch commands
  alias gb='git branch'        # Alias for 'git branch' (list branches)
  alias gba='git branch -a'    # Alias for 'git branch -a' (list both remote-tracking and local branches)
  alias gbd='git branch -d'    # Alias for 'git branch -d' (delete branch)
  alias gbD='git branch -D'    # Alias for 'git branch -D' (force delete branch)
  alias gbm='git branch -m'    # Alias for 'git branch -m' (rename branch)
  alias gbn='git branch --no-merged' # Alias for 'git branch --no-merged' (list branches not yet merged into the specified branch)
  alias gbo='git branch --remote --verbose' # Alias for 'git branch --remote --verbose' (list remote branches)
  alias gbs='git show-branch'  # Alias for 'git show-branch' (show branch labels and their commits)

  # Commit history commands
  alias gch='git cherry'       # Alias for 'git cherry' (compare two branches and list the commits that are not on both)
  alias gcl='git clone'        # Alias for 'git clone' (clone a repository)
  alias gco='git checkout'     # Alias for 'git checkout' (switch branches or restore working tree files)
  alias gcp='git cherry-pick'  # Alias for 'git cherry-pick' (apply changes introduced by some existing commits)
  alias gcv='git covert'       # Alias for 'git covert' (manage remote-tracking branches)
  alias gdt='git difftool'     # Alias for 'git difftool' (show changes between commits using external diff tools)
  alias glg='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative' # Alias for a colored, decorated, graph log with
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
