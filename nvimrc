" vim:fdm=marker

"0. Plugins {{{1
"<Vundle for plugins> {{{2
set nocompatible              " be iMproved, required
filetype off                  " required
set shell=/bin/bash           " otherwise vundle doesn't want to update
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin()

"}}} 7. Navigating files {{{2

Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'

"}}} 8. Editing files {{{2
Plugin 'vim-scripts/tComment'
Plugin 'godlygeek/tabular'
Plugin 'bkad/CamelCaseMotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'danro/rename.vim'

"}}} 9. Appearance {{{2
Plugin 'tpope/vim-vividchalk'
Plugin 'bling/vim-airline'

"}}} 10. Running Tests {{{2
Plugin 'benmills/vimux'

"}}} 13. Ruby & Rails {{{2
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
" Convert do .. end into { .. }
Plugin 'jgdavey/vim-blockle'

"}}} 14. Elixir {{{2
Plugin 'elixir-lang/vim-elixir'
"}}} 15. Integration with external apps {{{2
Plugin 'rizzatti/dash.vim'

"}}} 16. Rust {{{2
Plugin 'rust-lang/rust.vim'

"}}} 18. Elm {{{2
Plugin 'lambdatoast/elm.vim'

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
nnoremap <Left> :bprevious<CR>
nnoremap <Right> :bnext<CR>

"Close buffer
nnoremap <C-x> :w<CR>:bp\|bd #<CR>
nnoremap <leader>x :w<CR>:bp\|bd #<CR>

"}}} 7. Navigating files {{{1
" Go through ack matches
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>

" Ctrl+P
map <leader>t :CtrlP<CR>
map <leader>T :CtrlPClearAllCaches<CR>:CtrlP<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vcr_cassettes/*/*.yml,*/node_modules/*

"}}} 8. Editing files {{{1

" Opposite of Shift-J
nnoremap <S-K> a<CR><Esc>k$

"Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Toggle Comment
map <leader>/ <c-_><c-_>

" Git gutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

"}}} 9. Appearance {{{1
colorscheme vividchalk

" Highlight lines longer than 79
autocmd BufNewFile,BufRead * match ErrorMsg '\%>79v.\+'

" Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

"}}} 10. Running Tests {{{1
noremap <SPACE> :w<CR>:VimuxRunLastCommand<CR>
imap <leader><leader> jk:w<CR>:VimuxRunLastCommand<CR>
map <leader>c :VimuxInterruptRunner<CR>
map <leader>i :VimuxInspectRunner<CR>
let g:VimuxOrientation = "h"
let g:VimuxHeight = "36"

"}}} 11. Vimrc files {{{1
map <leader>- :edit ~/.nvimrc<CR>
map <silent> <leader>_ :source ~/.nvimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

"}}} 12. git files {{{1
"Break line at 72 characters in commit messages
autocmd filetype gitcommit set textwidth=72

"}}} 13. Ruby & Rails {{{1

au BufEnter *.rb map <Leader>ra :call VimuxRunCommand("bundle exec rspec " . bufname("%"))<CR>
au BufEnter *.rb map <Leader>rf :call VimuxRunCommand("bundle exec rspec " . bufname("%") . ":" . line("."))<CR>
au BufEnter *.rb map <Leader>rr :call VimuxRunCommand("bundle exec rspec")<CR>
au BufEnter *.feature map <Leader>ra :call VimuxRunCommand("bundle exec cucumber " . bufname("%"))<CR>
au BufEnter *.feature map <Leader>rf :call VimuxRunCommand("bundle exec cucumber " . bufname("%") . " -l " . line("."))<CR>
"
"}}} 14. Elixir {{{1
"}}}
"}}} 15. Integration with external apps {{{1
map <leader>d :Dash<CR>

"}}} 16. Rust {{{1
"}}} 17. Spellchecking/Correction {{{1
 iab teh the
 iab destory destroy
"}}} 18. Elm {{{1
au BufEnter *.elm map <Leader>rf :ElmMakeCurrentFile<CR>

"}}}
