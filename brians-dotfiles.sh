function upgrade_brians_dotfiles() {
  /usr/bin/env DOTFILES=$DOTFILES /bin/sh $DOTFILES/upgrade.sh
}

# Check for updates on initial load...
if [ "$DISABLE_AUTO_UPDATE" != "true" ]; then
  /usr/bin/env DOTFILES=$DOTFILES DISABLE_UPDATE_PROMPT=$DISABLE_UPDATE_PROMPT zsh -f $DOTFILES/check_for_upgrade.sh
fi
