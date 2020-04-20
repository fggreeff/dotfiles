# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
#export PATH
#export PATH=~/Library/Python/3.6/bin:${PATH}


# Path to your oh-my-zsh installation.
export ZSH=/Users/francoisgreef/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bira"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias dc="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias nuke="rm -rf $1"
alias l="ls -alh"
alias cls="clear && printf '\e[3J'"
alias lsa="ls -a"
alias cores="sysctl hw"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias hs='history | grep'
alias myip="curl http://ipecho.net/plain; echo"
alias svim='sudo vim'
alias updatepc='sudo apt-get update && sudo apt-get upgrade'

# GIT aliases
alias ginit="git init && git co -b master && git ci --allow-empty -m 'Initial commit'"

# zsh aliases
alias refresh="source ~/.zshrc"
alias reload="source ~/.zshrc"
alias config="vim ~/.zshrc"

# Docker aliases
alias dl="docker images -a"
alias dnuke="docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)"
alias dstop="docker stop $(docker container ls -a -q)"

dnukesome() {
  docker container rm -f $(docker container ls -a -q)
  docker volume rm $(docker volume ls -q);
}

dpurge() {
        docker container rm $(docker container ls -a -q);
        docker image rm -f $(docker image ls -q);
        docker volume rm  $(docker volume ls -q);
}

dnukeall() {
  docker container rm -f $(docker container ls -a -q);
  docker image rm -f $(docker image ls -q);
  docker volume rm $(docker volume ls -q);
  docker network rm $(docker network ls -q);
}

alias dcu="docker-compose up --build"
alias di="docker images"

# RaspberryPI aliases
alias pi="sudo ssh pi@192.168.1.5"
alias piconfig="sudo raspi-config"
alias pireload="sudo reboot"

# AWS aliases 
alias assume-role="source ~/.aws/aws-assume-role.sh"
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION=eu-west-1

# JAVA aliases 
# Switch between Java versions
# Setup info: https://stackoverflow.com/questions/26252591/mac-os-x-and-multiple-java-versions
alias java13="jenv global 13.0"
alias java11="jenv global 11.0"
alias java8="jenv global 1.8"

# Python aliases 
# alias python=/usr/local/bin/python3.7

# . `brew --prefix`/etc/profile.d/z.sh

# NVM
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# miniconda
# https://www.davidculley.com/installing-python-on-a-mac/
# export PATH=~/miniconda3/bin:$PATH
# export PATH=~/anaconda2/bin:$PATH

# Kafka
# export PATH=$PATH:/opt/kafka/bin
# export PATH="$PATH:/Users/francoisgreef/kafka_2.12-2.0.0/bin"

# AWS
# export PATH="~/aws_bin:$PATH"

# Sourcing virtualenvwrapper
# source ~/Library/Python/3.7/bin/virtualenvwrapper.sh

# Google Cloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/francoisgreef/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/francoisgreef/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/francoisgreef/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/francoisgreef/google-cloud-sdk/completion.zsh.inc'; fi
