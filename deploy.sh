#!/usr/bin/env bash

if [ -d "$HOME/.vim/" ]; then
	echo ".vim exist"
else
	ehco "no .vim dir, creating it"
	mkdir $HOME/.vim
fi

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

if [ -d "$HOME/.vim/colors/" ]; then
	echo "color dir exist!"
	rm -f $HOME/.vim/colors/mine.vim
	ln -s $PWD/colors/mine.vim $HOME/.vim/colors/mine.vim
else
	echo "no color dir!"
	mkdir $HOME/.vim/colors
	ln -s $PWD/colors/mine.vim $HOME/.vim/colors/mine.vim
fi

#if [ -d "$HOME/.vim/ftdetect/" ]; then
#	echo "ftdetect dir exist!"
#	rm -f $HOME/.vim/ftdetect/c.vim
#	ln -s $PWD/ftdetect/c.vim $HOME/.vim/ftdetect/c.vim
#else
#	echo "no ftdetect dir!"
#	mkdir $HOME/.vim/ftdetect
#	ln -s $PWD/ftdetect/c.vim $HOME/.vim/ftdetect/c.vim
#fi

if [ -d "$HOME/.vim/syntax/" ]; then
	echo "syntax dir exist!"
	rm -f $HOME/.vim/syntax/c.vim
	rm -f $HOME/.vim/syntax/python.vim
	ln -s $PWD/syntax/c.vim $HOME/.vim/syntax/c.vim
	ln -s $PWD/syntax/python.vim $HOME/.vim/syntax/python.vim
else
	echo "no syntax dir!"
	mkdir $HOME/.vim/syntax
	ln -s $PWD/syntax/c.vim $HOME/.vim/syntax/c.vim
	ln -s $PWD/syntax/python.vim $HOME/.vim/syntax/python.vim
fi

if [ -d "$HOME/.vim/plugin/" ]; then
	echo "plugin dir exist!"
	rm -f $HOME/.vim/plugin/cscope_maps.vim
	ln -s $PWD/plugin/cscope_maps.vim $HOME/.vim/plugin/cscope_maps.vim
else
	echo "no plugin dir!"
	mkdir $HOME/.vim/plugin
	ln -s $PWD/plugin/cscope_maps.vim $HOME/.vim/plugin/cscope_maps.vim
fi

rm -f $HOME/.vimrc
ln -s $PWD/vimrc $HOME/.vimrc
