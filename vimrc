"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My vimrc  
" Modified from cduan.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vundle Begin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
"Set runtime path to include vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"let vundle manage vundle
Plugin 'gmarik/Vundle.vim'

"Plugin 'klen/python-mode'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options Begin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let b:did_ftplugin = 1

"set term=ansi

"load color scheme mine.vim
colo mine

" Folding mode
set fdm=syntax

" Encoding
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8
set number 			"Turn line number on

"set comments=sl:/*,mb:\ *,elx:\ */ 		"intelligent comments
set tabstop=4    	"tab 4 spaces
set autoindent
set backspace=2		" Allows insert-mode backspace to work as one expects
set cindent
set cinkeys=0{,0},:,!^F,o,O,e	" See "cinkeys"; this stops "#" from indenting
set fileformat=unix	" No crazy CR/LF
set listchars=tab:\ \ ,trail:· " If you do ":set list", shows trailing spaces
set mouse=			" I don't like the mouse in VIM
set nobackup		" Don't use a backup file (also see writebackup)
set hlsearch  		" Hightlight the search	
set incsearch  		"incremental searching
set nojoinspaces	" One space after a "." rather than 2
set ruler			" Show the line position at the bottom of the window
set scrolloff=1		" Minimum lines between cursor and window edge
set shiftwidth=4	" Indent by 4 columns (for C functions, etc).
set showcmd			" Show partially typed commands
set showmatch		" Show parentheses matching
set smartindent		" Indent settings (really only the cindent matters)
set textwidth=80	" Maximum line width
set viminfo='0,\"100,	" Stay at the start of a file when opening it
set whichwrap=<,>,[,],h,l " Allows for left/right keys to wrap across lines
set writebackup		" Write temporary backup files in case we crash
set ignorecase 		" Ingore the case sensitive
set formatoptions=tcroql "Set text and comment formatting 

syn sync fromstart " Increase the highlighting accuracy

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Based on VIM tip 102: automatic tab completion of keywords
function InsertTabWrapper(dir)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
	return "\<tab>"
    elseif "back" == a:dir
	return "\<c-p>"
    else
	return "\<c-n>"
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enhanced keyboard mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" If it's OSX aka Unix:Darwin, we have to map the functon key different
if has("unix")
	let s:uname = system("uname -s")
	"'\n' have to be used
	if s:uname == "Darwin\n"
		map <Esc>OP <F1>
		map <Esc>OQ <F2>
		map <Esc>OR <F3>
		map <Esc>OS <F4>
		map <Esc>[15~ <F5>
		map <Esc>[17~ <F6>
		map <Esc>[18~ <F7>
		map <Esc>[19~ <F8>
		map <Esc>[20~ <F9>
		map <Esc>[21~ <F10>
		map <Esc>[23~ <F11>
		map <Esc>[24~ <F12>
	endif
endif

" switch between header/source with F4
"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" Split screen
"map <c-s> :vsplit<CR>
" Move between Window
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

"Tab to auto completion
inoremap <tab> <c-r>=InsertTabWrapper("fwd")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper("back")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"python-mode
"auto complete
"let g:pytmode_rope = 1
""Documentation
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'
""Linting
"let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes,pep8"
""Auto check on save
"let g:pymode_lint_write = 1
""Support virtualenv
"let g:pymode_virtualenv = 1
""syntax highlighting
"let g:pymode_syntax = 1
"let g:pymode_syntax_all =1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
"let g:pymode_folding = 1
