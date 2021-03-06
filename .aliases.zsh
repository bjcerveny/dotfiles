# Git aliases for bash/zsh
# Inline aliases, zsh -g aliases can be anywhere in command line
#alias enter_oc6="ssh musxeris001.imu.intel.com"
domainname () {
  hostname -f | sed -e 's/^[^.]*\.//'
}

realpath() { path=`eval echo "$1"` folder=$(dirname "$path ") echo $(cd "$folder"; pwd)/$(basename "$path"); }

alias lc="tr '[:upper:]' '[:lower:]'"
alias '..'='cd ..'
alias -g ......='../../../../..'
alias -g .....='../../../..'
alias -g .....='../../../..'
alias -g ....='../../..'
alias -g ...='../..'
alias -g G='| grep'
alias -g L='| less'
alias -g NF='$(\ls *(.om[1]))'    # newest file
alias -g np='PAGER='
alias -g GT='GIT_TRACE=1'
alias cdr='cd `pwd -r`'
alias cp='cp -v'
alias df='df -H'
alias dir="ls -l"
alias dir='ll'
alias dirt="ls -lrt"
alias dirt='ll -rt'
alias du='du -h'
alias fromip="last -1 -i -a | cut -c61- | head -1"
alias g="grep"
alias g='grep'
#alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcp='git cherry-pick --no-commit'
alias gd='git diff | mate'
alias ger=gerrit
alias gfa="git fetch --all"
alias gfa='git fetch --all'
alias gg='git log --oneline --all -i --grep'
alias gk='gitk &'
alias gka="gitk --all"
alias gka='gitk --all &'
alias gl11='git log --oneline -1'
alias gl1='git log --oneline'
alias gl='git log'
alias gq='ssh git.shure.com gerrit show-queue | grep tasks'
alias gr='git remote'
alias grb='git rebase'
alias gst="git status -s"
alias gst='git status --short'
alias gt='cd $(git root)'  # cd $(git rev-parse --show-toplevel
alias gvim='gvim -p'  # open multiple files in tabs
alias gzip='gzip --no-name'  # Do not store original filename/timestamp
alias l='git l'
alias lt=dirt
alias lu="cd /localuser/bjcerven && ls -1d *(/)"
alias mdl='cd ~/droidrepo/main-dev-lte'
alias mf='repo manifest -o -'
alias mfv='mf | view -'
alias psed='perl -pe'
alias pushprod='(cd ../prod && git pull dev lte)'
alias quota='quota -s'
alias rfa='repo forall -c git fetch --all'
alias rt='cd $repotop'   # See repotop function below
alias sms='echo Command exited code $? | sendmail 8479036389@txt.att.net'
alias ssync='repo sync -j 4 $(lsepoch.pl -q -d -w)'
alias t='tig'
alias ta='tig --all'
alias thisvob='cleartool desc -fmt "%n\n" vob:.'
alias unco='cleartool uncheckout'
alias uncoall='lsco -cview -all   -s | sort -r | xargs -i -n 15 -P 2 --no-run-if-empty cleartool unco -rm '
alias uncoavobs='lsco -cview -avobs -s | sort -r | xargs -i -n 15 -P 2 --no-run-if-empty cleartool unco -rm '
alias uniqvobs='grep /vob | sed -e "s=.*\(/vob[s]*/\(\(linuxjava\|cdma\|cwag\|gccsc\|jem\|linuxjava\|linuxjava_test\|mm\|simtech\|tdma_tool\|testtech\|tetra\|util\)/\)\?[a-zA-Z0-9_\-]*\).*=\1=" | sort | uniq' # add -c on command line for count of uniq vobs 
alias vnc2='vncserver -geometry 1900x1200 :89 &'
alias vnc='vncserver -geometry 1680x1050 -depth 16 :88 &'
alias vncreset='rm -f /tmp/.X88-lock /tmp/.X11-unix/X88'
alias warn='print -u 2'
alias zl='gvim -f $HOME/.zshrc.local && source $HOME/.zshrc.local'
alias zs='gvim -f $HOME/.zshrc.site  && source $HOME/.zshrc.site'
if [[ $(uname -s) == 'Darwin' ]]; then
  alias vim='mvim -p'
  alias psg='ps -ef | grep'
  alias psme='ps -fu $USER'
else
  alias vim='vim -p'
  alias psg='ps -C | grep'
  alias psme='ps -Hu $USER'
fi
alias zl='vim -f $HOME/.zshrc.local && source $HOME/.zshrc.local'
alias zs='vim -f $HOME/.zshrc && source $HOME/.zshrc'
alias za='vim -f $HOME/.aliases.zsh && source $HOME/.aliases.zsh'

echoerr() { echo "$@" 1>&2; }


# Open argument in Dash
function dash() {
  open "dash://$*"
}

# Like dash() but quickie for man pages
function dman() {
  open "dash://man:$*"
}

brew() {
#  proxy 
  command brew $*
#  noproxy
}

# Quick remove a file or directory in the background by renaming it first.
qrm() {
  for target in $@; do

    qrm_target=$(dirname "$target")/.qrm-$RANDOM-$(basename "$target")
    mv "$target" "$qrm_target" && rm -rf "$qrm_target" &
    if [[ $? == 0 ]]; then
      print Removing \"$target\" in background.
    else
      # In case it failed, rename it back
      test -e "$qrm_target" && mv "$qrm_target" "$target"
    fi
  done
}


bb() {
  is_beehive

  echo Building in $beetop/build...
  cd $beetop/build
  ./gradlew $@
  cd -
}


cpbee() {
  cp -v $beetop/bee-script/build/libs/bee-script-*(On[1]) ~/bee/bee-script.jar 
  cp -v $beetop/bee-script/bee ~/bee/
  cp -v $beetop/bee-script/conf/* ~/bee/conf
  #cp -v $beetop/conf/* ~/bee/conf
}

# Rename files to lowercase
zmv_lc() {
  zmv '(*)' '${(L)1}'
}

module ()
{
    eval `/opt/Modules/bin/modulecmd bash $*`
}


function ip() {
  local en0=$(ifconfig en0 | grep '^\s*inet ' | sed 's/.*inet \([0-9\.]*\).*/\1/')
  local en1=$(ifconfig en1 | grep '^\s*inet ' | sed 's/.*inet \([0-9\.]*\).*/\1/')
  if [[ -n "$en0" ]]; then
	echo $en0
  elif [[ -n "$en1" ]]; then
	echo $en1
  else
	echo No IP Address set
  fi
}

function gb() {
  branches=($(git for-each-ref --format='%(refname)' refs/heads/ | sed 's|refs/heads/||'))
  for branch in $branches; do
    desc="$(git config branch.$branch.description)"
    if [[ $branch == $(git rev-parse --abbrev-ref HEAD) ]]; then
      branch="* \033[0;32m$branch\033[0m"
     else
       branch="  $branch"
     fi
     echo -e "$branch \033[0;36m$desc\033[0m"
  done
}

alias fromip="last -1 -i -a | cut -c61- | head -1"
alias gerrit="ssh git.shure.com gerrit"

# alias last and save
# # use `als c NAME` to chop off the last argument (for filenames/patterns)

als () {
	local aliasfile chop x
	[[ $# = 0 ]] && echo "Name your alias" && return
	if [[ $1 = "c" ]]
	then
		chop=true 
		shift
	fi
	aliasfile=~/.aliases.${SHELL:t}
	touch $aliasfile
	if [[ `cat "$aliasfile" |grep "alias ${1// /}="` != "" ]]
	then
		echo "Alias ${1// /} already exists"
	else
		x=`fc -l -n -1`
		if [[ $chop = true ]]
		then
			echo "Chopping..."
			x=$(echo $x | rev | cut -d " " -f2- | rev) 
		fi
		echo -e "\nalias ${1// /}=\"`echo $x|sed -e 's/ *$//'|sed -e 's/\"/\\\\"/g'`\"" >> $aliasfile && source $aliasfile
		alias $1
	fi
}

function bt() {
  if [[ -n $beetop ]]; then
  	cd $beetop
  else
  	echo Not in a bee workspace.
  fi
}

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

alias gdt="git difftool"
alias ax="chmod a+x"
alias py="python"
alias gerrit="ssh git.shure.com gerrit"
alias gbv="git branch -v"
alias ipy="python -m IPython"
alias py3="python3"
alias jenkins="ssh -p 30303 localhost restart"

#####################################
# Shure Only

if [[ $(domainname) = "shure.com" ]]; then

  echo Setting up Shure environment...

  for i in {1..70} 801 802; do
	alias lx-vm${i}="ssh -p 22 lx-vm${i}"
	alias lx-ch${i}="ssh -p 22 lx-ch${i}"
	alias ms-vm${i}="ssh -p 22 ms-vm${i}"
  done

  for i in sandbox bbdev jiradev; do
	alias ${i}="ssh -p 22 $i"
  done
fi

