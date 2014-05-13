# Git aliases for bash/zsh
# Inline aliases, zsh -g aliases can be anywhere in command line
#alias enter_oc6="ssh musxeris001.imu.intel.com"
alias '..'='cd ..'
alias -g ......='../../../../..'
alias -g .....='../../../..'
alias -g .....='../../../..'
alias -g ....='../../..'
alias -g ...='../..'
alias -g G='| grep'
alias -g L='| less'
alias -g NF='$(\ls *(.om[1]))'    # newest file
alias b="bee"
alias basebranch="sed -e 's=.*/\\([^/]*\\)\\/[1-9][0-9]*\$=\\1='"
alias basebranchl="sed -e 's=.*@@\\(/.*\\)\\/[0-9]*\$=\\1=q'"
alias bd="cd ~/Work/OptiCM6/bee-devel"
alias bd='popd'
alias bd=popd
alias bee-sms4="/usr/local/opticm6/dev/bee-sms4/bee"
alias beedev="/usr/local/opticm6/dev/bee/bee"
alias beedev="/usr/local/opticm6/dev/bee/bee"
alias bl='gvim $HOME/bldlogs/`ls -1rt $HOME/bldlogs/ | tail -1`'
alias bld='bsub -I -q il93g-lnxbld'
alias breset="bee forall -- git checkout development"
alias bst="bee status"
alias bt='cd $beetop'
alias catcr='cleartool catcr'
alias catcs='cleartool catcs'
alias cci='cleartool checkin'
alias cciall='lsco -cview -all   -s | xargs -i -n 15 -P 2 --no-run-if-empty cleartool ci -nc '
alias cciavobs='lsco -cview -avobs -s | xargs -i -n 15 -P 2 --no-run-if-empty cleartool ci -nc '
alias cco='cleartool checkout'
alias cdiff='cleartool diff -columns 132'
alias cdr='cd `pwd -r`'
alias cls='cleartool ls'
alias cman='cleartool man'
alias cp='cp -v'
alias ct='cleartool'
alias df='df -H'
alias dir="ls -l"
alias dir='ll'
alias dirt="ls -lrt"
alias dirt='ll -rt'
alias dr2="cd /localrepo2/$USER"
alias dr="cd /localrepo/$USER"
alias du='du --si'
alias edcs='cleartool edcs'
alias g="grep"
alias g='grep'
alias gb='git branch'
alias gba='git branch -a'
alias gbl='gvim $HOME/bldlogs/`ls -1rt $HOME/bldlogs/ | tail -1`'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcp='git cherry-pick --no-commit'
alias gd='git diff | mate'
alias ger=gerrit
alias gfa="git fetch --all"
alias gfa='git fetch --all'
alias gg='git log --oneline --all -i --grep'
alias gk="gitk"
alias gk='gitk &'
alias gka="gitk --all"
alias gka='gitk --all &'
alias gl11='git log --oneline -1'
alias gl1='git log --oneline'
alias gl='git log'
alias gr='git remote'
alias grb='git rebase'
alias gst="git status -s"
alias gst='git status --short'
alias gvim='gvim -p'  # open multiple files in tabs
alias gzip='gzip --no-name'  # Do not store original filename/timestamp
alias l='git l'
alias lsattype='cleartool lstype -kind attype'
alias lsbrtype='cleartool lstype -kind brtype'
alias lsco='cleartool lsco'
alias lslbtype='cleartool lstype -kind lbtype'
alias lsvt='cleartool lsvtree -merge'
alias lt=dirt
alias lu="cd /localuser/bjcerven && ls -1d *(/)"
alias mdl='cd ~/droidrepo/main-dev-lte'
alias mf='repo manifest -o -'
alias mfv='mf | view -'
alias nbcdiff='cleartool diff -columns 132 -options -blank_ignore'
alias nbxdiff='cleartool diff -g -options -blank_ignore'
alias psed='perl -pe'
alias psg='ps -C'
alias psme='ps -Hu $USER'
alias ptrel='source ~/bin/ptrel'
alias pushprod='(cd ../prod && git pull dev lte)'
alias pwv='cleartool pwv -short'
alias quota='quota -s'
alias r='cd ~/repo'
alias rfa='repo forall -c git fetch --all'
alias rt='cd $repotop'   # See repotop function below
alias setcs='cleartool setcs'
alias sms='echo Command exited code $? | sendmail 8479036389@txt.att.net'
alias ssync='repo sync -j 4 $(lsepoch.pl -q -d -w)'
alias t='tig'
alias ta='tig --all'
alias thisvob='cleartool desc -fmt "%n\n" vob:.'
alias unco='cleartool uncheckout'
alias uncoall='lsco -cview -all   -s | sort -r | xargs -i -n 15 -P 2 --no-run-if-empty cleartool unco -rm '
alias uncoavobs='lsco -cview -avobs -s | sort -r | xargs -i -n 15 -P 2 --no-run-if-empty cleartool unco -rm '
alias uniqvobs='grep /vob | sed -e "s=.*\(/vob[s]*/\(\(linuxjava\|cdma\|cwag\|gccsc\|jem\|linuxjava\|linuxjava_test\|mm\|simtech\|tdma_tool\|testtech\|tetra\|util\)/\)\?[a-zA-Z0-9_\-]*\).*=\1=" | sort | uniq' # add -c on command line for count of uniq vobs 
alias unptrel='source ~/bin/unptrel'
alias vim='vim -p'
alias vnc2='vncserver -geometry 1900x1200 :89 &'
alias vnc='vncserver -geometry 1680x1050 -depth 16 :88 &'
alias vncreset='rm -f /tmp/.X88-lock /tmp/.X11-unix/X88'
alias warn='print -u 2'
alias xdiff0='cleartool diff -g `ct desc -s \!* | sed -f $HOME/bin/xdiff0.sed` &'
alias xdiff='cleartool diff -g'
alias xlsvt='cleartool lsvtree -g'
alias zl='gvim -f $HOME/.zshrc.local && source $HOME/.zshrc.local'
alias zs="source ~/.zshrc"
alias zs='gvim -f $HOME/.zshrc.site  && source $HOME/.zshrc.site'


echoerr() { echo "$@" 1>&2; }


# Open argument in Dash
function dash() {
  open "dash://$*"
}

# Like dash() but quickie for man pages
function dman() {
  open "dash://manpages:$*"
}

function proxtog() { 
    if [ -n "${http_proxy:+1}" ]; then 
        unset {http,https,ftp,no,socks}_proxy 
        unset {HTTP,HTTPS,FTP,ALL,NO,SOCKS}_PROXY 
        echo PROXIES CLEAR 
    else 
        export {http,https,ftp,all}_proxy='http://proxy-chain.intel.com:911' 
        export {HTTP,HTTPS,FTP,ALL}_PROXY=$http_proxy 
        export socks_proxy=http://proxy-chain.intel.com:1080 
        export SOCKS_PROXY=$socks_proxy 
        export no_proxy=intel.com,.intel.com,10.0.0.0/8,192.168.0.0/16,localhost,127.0.0.0/8,134.134.0.0/16 
        export NO_PROXY=$no_proxy 
        echo PROXIES SET 
    fi 
} 

function proxstat() { 
    if [ -n "${http_proxy:+1}" ]; then 
        echo PROXIES SET 
    else 
        echo PROXIES EMPTY 
    fi 
}

brew() {
#  proxy 
  command brew $*
#  noproxy
}

source ~/bin/als.bash

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
}


cpbee() {
  beetop=`pwd`
  cp -v $beetop/bee-script/build/libs/bee-script-*(On[1]) ~/bee/bee-script.jar 
  cp -v $beetop/bee-script/bee ~/bee/
  cp -vr $beetop/bee-script/conf ~/bee/
}

# Rename files to lowercase
zmv_lc() {
  zmv '(*)' '${(L)1}'
}

module ()
{
    eval `/opt/Modules/bin/modulecmd bash $*`
}
