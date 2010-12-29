dotfiles := .vimrc
dotfiles += .gvimrc
dotfiles += .zshrc
dotfiles += .zshrc.local

install: $(dotfiles)
	cp -v -f $^ $(HOME)
