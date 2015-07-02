" vim:fdm=marker

"0. Plugins {{{1
"<Vundle for plugins> {{{2
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin()

"}}} 7. Editing files {{{2
Plugin 'edsono/vim-matchit'       " '%' works for more constructs

"}}} 8. Appearance {{{2
Plugin 'tpope/vim-vividchalk'
Plugin 'bling/vim-airline'

"}}} 9. Running Tests {{{2
Plugin 'benmills/vimux'

"}}} 12. Ruby & Rails {{{2
Plugin  'slim-template/vim-slim'
"}}} </Vundle for plugins> {{{2
call vundle#end()

"}}}
"1. General configuration {{{1
let mapleader = ','               " Set leader to ,
syntax on                         " Switch syntax highlighting on
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set visualbell                    " No beeping.

set hidden                        " Buffers stay loaded when abandoned
set autoread                      " Automatically read (externally) changed files

set backspace=indent,eol,start    " Intuitive backspacing

set nowrap                        " Don't wrap long lines
"}}} 2. Backup files {{{1
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " Don't need swapfiles

"}}} 3. Searching {{{1
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

"}}} 4. Tabs & Spaces {{{1
set expandtab                     " Insert spaces when hitting <tab>
set autoindent                    " Keep indentation level of previous line
set smartindent                   " Indentation based on syntax

filetype indent on                " Load the indentation for the current file type

set tabstop=2
set softtabstop=2
set shiftwidth=2

"}}} 5. Key mappings {{{1
" Use `jk` instead of `esc`
inoremap jk <Esc>
inoremap Jk <Esc>
inoremap JK <Esc>
inoremap jK <Esc>
inoremap <Esc> <nop>

" Arrow keys are bad form
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" No more accidental help windows
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

"}}} 6. Navigating buffers {{{1
nnoremap <leader>t :ls<CR>:b
nnoremap <leader><leader> :b#<CR>
nnoremap <Left> :bprevious<CR>
nnoremap <Right> :bnext<CR>
"}}} 7. Editing files {{{1

" Opposite of Shift-J
nnoremap <S-K> a<CR><Esc>k$

"Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

"Close buffer
nnoremap <C-x> :w<CR>:bd<CR>
nnoremap <leader>x :w<CR>:bd<CR>

"}}} 8. Appearance {{{1
colorscheme vividchalk

" Highlight lines longer than 79
autocmd BufNewFile,BufRead * match ErrorMsg '\%>79v.\+'

" Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

"}}} 9. Running Tests {{{1
noremap <SPACE> :w<CR>:VimuxRunLastCommand<CR>
imap <leader><leader> jk:w<CR>:VimuxRunLastCommand<CR>
map <leader>c :VimuxClosePanes<CR>
let g:VimuxOrientation = "h"
let g:VimuxHeight = "36"

"}}} 10. Vimrc files {{{1
map <leader>- :edit ~/.nvimrc<CR>

"}}} 11. git files {{{1
"Break line at 72 characters in commit messages
autocmd filetype gitcommit set textwidth=72

"}}} 12. Ruby & Rails {{{1
"}}}
