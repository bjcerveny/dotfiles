echoerr() { echo "$@" 1>&2; }

alias dir="ls -l"
alias g="grep"
alias bt='cd $beetop'
alias dirt="ls -lrt"
alias lt=dirt
alias df='df -H'

alias bd="cd ~/Work/OptiCM6/bee-devel"
alias beedev="/usr/local/opticm6/dev/bee/bee"

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


#alias enter_oc6="ssh musxeris001.imu.intel.com"

alias gfa="git fetch --all"
alias gst="git status -s"
alias gka="gitk --all"
alias zs="source ~/.zshrc"

bb() {
  is_beehive

  echo Building in $beetop/build...
  cd $beetop/build
  ./gradlew $@
}

alias beedev="/usr/local/opticm6/dev/bee/bee"
alias bst="bee status"
alias b="bee"
alias breset="bee forall -- git checkout development"

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

alias bee-sms4="/usr/local/opticm6/dev/bee-sms4/bee"

alias lu="cd /localuser/bjcerven && ls -1d *(/)"

module ()
{
    eval `/opt/Modules/bin/modulecmd bash $*`
}

