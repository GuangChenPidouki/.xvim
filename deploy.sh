#!/usr/bin/env bash

#test .vim exist or not
if [ -d "$HOME/.vim/" ]; then
	echo ".vim exist"
else
	ehco "no .vim dir, creating it"
	mkdir $HOME/.vim
fi

#test bundle dir
if [ -d "$HOME/.vim/bundle/" ]; then
	echo "the vundle exist!"
	rm -rf $HOME/.vim/bundle/Vundle.vim
	git clone https://github.com/gmarik/Vundle.vim.git \
	$HOME/.vim/bundle/Vundle.vim

else
	echo "can't find the vundle! fetch it on github now!"
	mkdir $HOME/.vim/bundle
	git clone https://github.com/gmarik/Vundle.vim.git \
	$HOME/.vim/bundle/Vundle.vim
fi

rm -f $HOME/.vimrc
ln -s $PWD/vimrc $HOME/.vimrc
