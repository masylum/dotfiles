DIRECTORY=~/dotfiles

install:
	ln -fs $(DIRECTORY)/vim ~/.vim
	ln -fs $(DIRECTORY)/vim/vimrc ~/.vimrc
	ln -fs $(DIRECTORY)/gitconfig ~/.gitconfig
	ln -fs $(DIRECTORY)/bashrc ~/.bash_profile
	ln -fs $(DIRECTORY)/bin ~/bin

.PHONY: install
