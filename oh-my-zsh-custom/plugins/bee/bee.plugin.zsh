# Aliases
alias b='bee'
compdef _bee b=bee

alias bra='bee rebase --auto-stash'
compdef _bee bra='bee rebase --auto-stash'

alias bs='bee sync'
compdef _bee bs='bee sync'

alias bsbra='bee sync ; bee rebase --auto-stash'
compdef _bee bsbra='bee sync ; bee rebase --auto-stash'


# Automatically set the beetop environment variable when we change
# directory into a 'bee' tool Git forest. Unset the variable
# otherwise.
function chpwd() {

  local BEE_TOP=$PWD
  until [[ -d "$BEE_TOP/.hive/config" || "$BEE_TOP" == "/" ]]; do
    BEE_TOP=$BEE_TOP:h
  done

  if [[ "$BEE_TOP" != "/" ]]; then
    export beetop=$BEE_TOP
    beepaths=($(bee-paths))
  else
    unset beetop
    unset beepaths
  fi
}

function bee-projects {
  if [[ -n $beetop ]]; then
	if [[ -f $beetop/.hive/default.xml ]]; then
	  xml sel -t -v '//project/@path' $beetop/.hive/default.xml
	fi
  else
    print -u 2 Not in a bee forest.
  fi
}

function bee-paths {
  if [[ -n $beetop ]]; then
    bee-projects | xargs -n 1 dirname | sort -u
  fi
}

# Tail-follow the last 4 pages of Bee log
#
function beelog {
  is_beehive

  bee_logfile=$beetop/.hive/log/bee.log

  case "$1" in 
  	(-e) ${EDITOR-"vi"} $bee_logfile ;;
	(-f) tail -f -$((4 * $LINES)) $bee_logfile ;;
	(-t) tail -$((4 * $LINES)) $bee_logfile ;;
	(-c) cat $bee_logfile ;;
	(*)  ${PAGER-"more"} $bee_logfile ;;
  esac	
}

function is_beehive {
  if [[ -z $beetop ]]; then
	echoerr This command must be run from a bee hive.
	return 1
  fi
}

function is_beehive {
  if [[ -z $beetop ]]; then
	echoerr This command must be run from a bee hive.
	return 1
  fi
}
