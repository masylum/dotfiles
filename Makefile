DIRECTORY=~/dotfiles

install:
	ln -fs $(DIRECTORY)/vim ~/.vim
	ln -fs $(DIRECTORY)/vim/gvimrc ~/.gvimrc
	ln -fs $(DIRECTORY)/vim/vimrc ~/.vimrc
	ln -fs $(DIRECTORY)/jshintrc ~/.jshintrc
	ln -fs $(DIRECTORY)/gitconfig ~/.gitconfig

.PHONY: install
