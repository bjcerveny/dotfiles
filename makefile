dotfiles := vimrc
dotfiles += gvimrc
dotfiles += zshrc
dotfiles += zshrc.local

.PHONY: install $(dotfiles)

install: $(dotfiles)

$(dotfiles):
	cd $(HOME) && ln -f -s $(PWD)/$@ .$@

