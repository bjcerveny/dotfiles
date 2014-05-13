# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/git/dotfiles

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys-brian"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx sublime gradle brew repo bee xrandr)

source $ZSH/oh-my-zsh.sh
source $DOTFILES/brians-dotfiles.sh

# Customize to your needs...
PATH=~/bin:/opt/swdev/bin:$PATH:./

source $DOTFILES/als.bash

# Load alias file
source ~/.aliases.zsh

PATH=$HOME/bin:/usr/local/bin:$PATH

# Turn off annoying spell correction
setopt nocorrectall

if [[ `uname -s` == "Darwin" ]]; then 
  export GROOVY_HOME=/usr/local/opt/groovy/libexec
  export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
  export GRADLE_HOME=/usr/local/opt/gradle/libexec
fi

export no_proxy=".intel.com,localhost,127.0.0.1"
export NO_PROXY=$no_proxy
proxtog

LD_LIBRARY_PATH=$HOME/lib:$LD_LIBRARY_PATH

