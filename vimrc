"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My vimrc  
" Modified from cduan.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vundle 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
"Set runtime path to include vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"let vundle manage vundle
Plugin 'gmarik/Vundle.vim'
"my own vim color and syntax
Plugin 'monojo/vim-basic'
Plugin 'monojo/cscope-map'
"python ide
Plugin 'klen/python-mode'
"ultimate auto complete tool
Plugin 'Valloric/YouCompleteMe'
"cool status line
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'"
"syntax check
Plugin 'scrooloose/syntastic'
"session management
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'

Plugin 'kien/ctrlp.vim'
"vim indent guide
Plugin 'nathanaelkane/vim-indent-guides'
"snippte
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'edkolev/promptline.vim'
"Plugin 'edkolev/tmuxline.vim'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"load color scheme mine.vim
colorscheme mine

" Folding mode
set fdm=syntax

" Encoding
scriptencoding utf-8
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8
set number 			"Turn line number on

"set comments=sl:/*,mb:\ *,elx:\ */ 		"intelligent comments
autocmd FileType * set tabstop=4    	"tab 4 spaces
"for python, real python use spaces
autocmd FileType python set tabstop=4|set expandtab|set shiftwidth=4|set softtabstop=4  

set autoindent
set backspace=2		" Allows insert-mode backspace to work as one expects
set cindent
set cinkeys=0{,0},:,!^F,o,O,e	" See "cinkeys"; this stops "#" from indenting
set fileformat=unix	" No crazy CR/LF
set listchars=tab:\ \ ,trail:· " If you do ":set list", shows trailing spaces
set mouse=n			" I don't like the mouse in VIM
set mousefocus 

"Disable backup, swap files
set nobackup	
set nowritebackup
set noswapfile

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

let mapleader="," " map leader to comma
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
"inoremap <tab> <c-r>=InsertTabWrapper("fwd")<cr>
"inoremap <s-tab> <c-r>=InsertTabWrapper("back")<cr>

"switch buffer
"nmap <leader>1 :b1<cr>
"nmap <leader>2 :b2<cr>
"nmap <leader>3 :b3<cr>
"nmap <leader>4 :b4<cr>
"nmap <leader>5 :b5<cr>
"nmap <leader>6 :b6<cr>
"nmap <leader>7 :b7<cr>
"nmap <leader>8 :b8<cr>
"nmap <leader>9 :b9<cr>
"nmap <leader>b :bp<CR>
"nmap <leader>f :bn<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""python-mode""""""""
let g:pymode = 1
let g:pymode_folding = 1
"python-mode
"auto complete
let g:pymode_rope = 0
""Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
""Linting
let g:pymode_lint = 0
"let g:pymode_lint_checker = "pyflakes,pep8"
""Auto check on save
let g:pymode_lint_write = 0
"Support virtualenv
let g:pymode_virtualenv = 1

""syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all =1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

""""""""vim-airline""""""""
"make it work
set laststatus=2
"enable extention support
let g:airline_enable_syntastic = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]

let g:airline#extensions#tagbar#enabled = 1
"short leave insert mode
set ttimeoutlen=50

"bufferline
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
"make buuferline on status line
let g:bufferline_echo = 0
  autocmd VimEnter *
    \ let &statusline='%{bufferline#refresh_status()}'
      \ .bufferline#get_status_string()

"use powerline style fonts
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'dark'
"let g:airline#extensions#tmuxline#enabled = 1
"let g:tmuxline_theme = 'zenburn'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
nmap <leader>1 1gt 
nmap <leader>2 2gt 
nmap <leader>3 3gt 
nmap <leader>4 4gt 
nmap <leader>5 5gt 
nmap <leader>6 6gt 
nmap <leader>7 7gt 
nmap <leader>8 8gt 
nmap <leader>9 9gt 

""""""""YCM""""""""
"solve the ycm Value Error problem
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' 

""""""""Session""""""""
"let g:session_autosave = 'no'
let g:session_autotsave = 'yes'
let g:session_autoload = 'no'

""""""""utltisnips""""""""
let g:UltiSnipsExpandTrigger = "<leader>t"
let g:UltiSnipsJumpForwardTrigger = "<leader>f"
let g:UltiSnipsJumpBackwardTrigger = "<leader>b"

""""""""indent guide""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 5
hi IndentGuidesEven ctermbg=lightgrey

"""""""Tagbar""""""""
nmap <F8> :TagbarToggle<CR>
"""""""CtrlP"""""""""
"dont know why tab also trigger this
nmap <c-i> :CtrlPBufTagAll<CR>
""""""""promptline""""""""
let g:promptline_preset = {
	\'a' : [ promptline#slices#host() ],
	\'x' : [ promptline#slices#cwd() ],
    \'y' : [ promptline#slices#vcs_branch() ],
    \'warn' : [ promptline#slices#last_exit_code() ]}
