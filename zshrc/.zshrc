# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~

set -o vi

export VUSUAL=nvim
export EDITOR=nvim
export TERM="tmux-256color"

export BROWSER="firefox"

## directories:

export REPOS="$HOME/repos"
export DOTFILES="$HOME/.dotfiles"
export SCRIPTS="$REPOS/scripts"
export DOCUMENTS=$HOME/Documents
export BRAIN="$DOCUMENTS/2brain"
export ZETTELKASTEN="$REPOS/zettelkasten"
export LAB="$REPOS/lab"

export GITUSER="zimmerling"


# ~~~~~~~~~~~~~~~ Path configuration ~~~~~~~~~~~~~~~~~~~~~~~~

setopt extended_glob null_glob

path=(
    $path                           # Keep existing PATH entries
    $HOME/bin
    $HOME/.local/bin
    $SCRIPTS
)


# Remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH


# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions


# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

alias vim="nvim"
alias v="nvim"
alias t="tmux"
alias e="exit"
alias c="clear"
alias open="xdg-open"
alias o="open"

## cd
alias ..="cd .."
alias scripts="cd $SCRIPTS"
alias dot="cd $DOTFILES"
alias repos="cd $REPOS"
alias urepos="cd $REPOS/uni/lectures"
alias docs="cd $DOCUMENTS"
alias 2b="cd $BRAIN"
alias nrepos="cd $REPOS/nxtb"
alias kasten="cd $ZETTELKASTEN"
alias lab="cd $LAB"

## ls
alias ls='ls --color=auto'
alias la='ls -lathr'

alias zrc="v $DOTFILES/zsh/.zshrc"
eval "$(thefuck --alias)"
# systemctl
alias start="sudo systemctl start"

[ -f "/home/Richard/.ghcup/env" ] && . "/home/Richard/.ghcup/env" # ghcup-env

# vpn
alias nextvpn="sudo openfortivpn -c /etc/openfortivpn/config"


# Git

alias gp='git pull'
alias gs='git status'
alias lg='lazygit'


# Kubernetes

alias k='kubectl'

alias kgp='kubectl get pods'
alias kc='kubectx'
alias kn='kubens'


# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~


fpath+=($HOME/.zsh/pure)

autoload -U promptinit; promptinit
prompt pure


# ~~~~~~~~~~~~~~~ Completion ~~~~~~~~~~~~~~~~~~~~~~~~

fpath+=~/.zfunc

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -Uz compinit
compinit -u

zstyle ':completion:*' menu select


# Example to install completion:
# talosctl completion zsh > ~/.zfunc/_talosctl


# ~~~~~~~~~~~~~~~ Sourcing ~~~~~~~~~~~~~~~~~~~~~~~~

source <(fzf --zsh)

eval "$(direnv hook zsh)"


# ~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~

fpath+=~/.zfunc; autoload -Uz compinit; compinit


# ~~~~~~~~~~~~~~~ nxtb ~~~~~~~~~~~~~~~~~~~~~~~~

function aws-login() {
	aws sso login --sso-session nextbike
}

# Authorize your shell to access resources in staging account as admin
function staging-admin() {
	eval "$(aws configure export-credentials --profile nextbike-staging-admin --format env)"
}

# Authorize your shell to access resources in staging account as operator
function staging() {
	eval "$(aws configure export-credentials --profile nextbike-staging-operator --format env)"
}

# Authorize your shell to access resources in production account
function production() {
	eval "$(aws configure export-credentials --profile nextbike-production --format env)"
}

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/home/Richard/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
