printf '\033[0;34m%s\033[0m\n' "Upgrading Brian's dotfiles"
cd "$DOTFILES"
if git pull --rebase --stat origin master
then
  printf '\033[0;34m%s\033[0m\n' "Brian's dotfiles have been updated and/or are at the current version."
else
  printf '\033[0;31m%s\033[0m\n' 'There was an error updating. Try again later?'
fi

