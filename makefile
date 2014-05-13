dotfiles := .vimrc
dotfiles += .gvimrc
dotfiles += .zshrc
dotfiles += .zshrc.local
dotfiles += .aliases.zsh
dotfiles += .aliases.tcsh
dotfiles += .ws_pwd.dat
dotfiles += .cn_urania_tool.ini

.SILENT:

.PHONY: install $(dotfiles)

install: $(dotfiles)

$(dotfiles):
	if [[ -e $(HOME)/$@ && ! -L $(HOME)/$@ ]]; then \
	  echo Error: $(HOME)/$@ is a file. Move and commit to dotfiles repo first.; \
	  exit 1 ;\
	fi
	cd $(HOME) && ln -f -s $(PWD)/$@ $@

