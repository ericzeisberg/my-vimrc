set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'
Plugin 'kien/ctrlp.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
call vundle#end()            " required
filetype plugin indent on    " required
"=======================Basic Configurations=========================
syntax enable

set backspace=indent,eol,start
let mapleader = ','
set number
set encoding=utf-8


"==========================Configure Tabs===========================


"Tab should be four spaces unless otherwise specified
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Set colorscheme
set background=dark
colorscheme atom-dark-256

"=======================Auto-Close Brackets=========================="

"All of these commands can be escaped with (C-v)

ino " ""<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<cr> {<cr>}<ESC>O

"The curly-brace carriage return is good for starting functions, obviously



"========================Search Settings==========================="
set hlsearch
set incsearch


"==========================Mappings================================="

"Edit the Vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Remove highlighting
nmap <Leader><space> :nohlsearch<cr>

"Close current tab
nmap <Leader>cl :tabclose<cr>

"========================Split Configuration======================="
"Set splits to occur below and right

set splitbelow
set splitright


"Remove the W from split switching commands"
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"==========================Code Fold================================"

"enable folding"
set foldmethod=indent
set foldlevel=99


"========================AutoCommands==============================="

"Automatically source the Vimrc file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"These are specific configurations for Python, web and Ruby"
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css, *.rb, *.erb
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"We flag unnecessary whitespace in Python and C files"
au BufRead,BufNewFile *.py, *.pyw, *.c, *.h match BadWhitespace /\s\+$/
