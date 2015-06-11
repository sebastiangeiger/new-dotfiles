" vim:fdm=marker

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
"}}} 7. Editing files {{{1

" Show lines longer than 79
autocmd BufNewFile,BufRead * match ErrorMsg '\%>79v.\+'

" Opposite of Shift-J
nnoremap <S-K> a<CR><Esc>k$

"Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

"}}} 8. Appearance {{{1
colorscheme vividchalk

"}}} 9. Vimrc files {{{1
map <leader>- :edit ~/.nvimrc<CR>

"}}} 10. git files {{{1
"Break line at 72 characters in commit messages
autocmd filetype gitcommit set textwidth=72

"}}}
