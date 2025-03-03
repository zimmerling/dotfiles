#
# ~/.bashrc
#

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"



# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# envs:

## directories:
export REPOS="$HOME/repos"
export DOTFILES="$HOME/.dotfiles"
export SCRIPTS="$REPOS/scripts"
export DOCUMENTS=$HOME/Documents
export BRAIN="$DOCUMENTS/2brain"

# clis
export PATH="$HOME/.cargo/bin:$PATH"

# aliases

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

## ls
alias ls='ls --color=auto'

alias brc="v $DOTFILES/bash/.bashrc"
eval "$(thefuck --alias)"
# systemctl
alias start="sudo systemctl start"

[ -f "/home/Richard/.ghcup/env" ] && . "/home/Richard/.ghcup/env" # ghcup-env

# vpn
alias nextvpn="sudo openfortivpn -c /etc/openfortivpn/config"

# ssh machines
alias sshansible="ssh ansible@100.71.111.43"

# nextbike envs
export RABBITMQ_HOST="localhost"
export RABBITMQ_USERNAME=user
export RABBITMQ_PASSWORD=password
export RABBITMQ_QUEUE_NAME="test"
export HTTP_HOST="localhost"

export MYSQL_USER=root
export MYSQL_PORT=3306
export MYSQL_PASSWORD=password
export MYSQL_HOST=localhost
export MYSQL_DB=push_service
export MONGO_CONNECTION_STRING=mongodb://ps1coworpmd0002.nextbike.lan:27017/
export DATABASE_MIGRATION=true

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
