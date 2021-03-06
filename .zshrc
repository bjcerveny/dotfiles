# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
source $HOME/.zshrc.site.pre
SHELL=/bin/zsh
ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/git/dotfiles

TIMEFMT="'$fg[green]%J$reset_color' real: $fg[yellow]%*Es$reset_color, user: $fg[yellow]%U$reset_color, sys: $fg[yellow]%S$reset_color, cpu: $fg[yellow]%P$reset_color"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=powerlevel10k/powerlevel10k

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES/oh-my-zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(aws git svn osx docker gradle brew repo history-substring-search)


source $ZSH/oh-my-zsh.sh

# User configuration

source $DOTFILES/brians-dotfiles.sh

# Customize to your needs...
export PATH=~/bin:/opt/swdev/bin:$HOME/bin:/usr/local/bin:$PATH:./
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
source ~/.aliases.zsh

# Turn off annoying spell correction
setopt nocorrectall

if [[ `uname -s` == "Darwin" ]]; then 
  export GROOVY_HOME=/usr/local/opt/groovy/libexec
  export JAVA_HOME=`/usr/libexec/java_home`
  # for Bee
  #export JAVA_OPTS="$JAVA_OPTS -Djavax.net.ssl.trustStore=/Library/Java/Home/lib/security/cacerts -Djavax.net.ssl.trustStorePassword=java-0kEys"
  export JAVA_OPTS="$JAVA_OPTS -Djavax.net.ssl.trustStore=$JAVA_HOME/lib/security/cacerts -Djavax.net.ssl.trustStorePassword=java-0kEys"
  export GRADLE_HOME=/usr/local/opt/gradle/libexec
fi

LD_LIBRARY_PATH=$HOME/lib:$LD_LIBRARY_PATH

cdpath=(~ ~/Work /local/$USER)

# Set site-specific items.
source ~/.zshrc.site
compinit -i

export LESS=-r
export PAGER=less


# added by Anaconda3 2019.03 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '$HOME/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/bcerveny/anaconda3/etc/profile.d/conda.sh" ]; then
# . "/Users/bcerveny/anaconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/bcerveny/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/opt/ruby/bin:/usr/local/opt/python@3.8/bin:$PATH"

TIMEFMT="%J  %U user %S system %P cpu %*E total"

eval "$(direnv hook zsh)"
