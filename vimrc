set nocompatible                  " Must come first because it changes other options.
filetype off

"====================
"| Vundle related   |
"====================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
"instead of: Bundle 'wincent/Command-T'
Bundle 'tpope/vim-rails'
Bundle 'vim-scripts/tComment'
Bundle 'vim-ruby/vim-ruby'
Bundle 'bkad/CamelCaseMotion'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'edsono/vim-matchit'
Bundle 'sebastiangeiger/gitignore.vim'
Bundle 'vim-scripts/VimClojure'
Bundle 'samsonw/vim-task'
Bundle 'pangloss/vim-javascript'
Bundle 'tangledhelix/vim-octopress'
Bundle 'sjl/vitality.vim'
" Bundle 'Lokaltog/vim-powerline'
" Record activitiy
Bundle 'AD7six/vim-activity-log'
Bundle 'rking/vim-detailed'
Bundle 'godlygeek/tabular'
Bundle 'benmills/vimux'
Bundle 'pgr0ss/vimux-ruby-test'
Bundle 'cloud8421/vimux-cucumber'
Bundle 'Arduino-syntax-file'
Bundle 'slim-template/vim-slim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kchmck/vim-coffee-script'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'airblade/vim-gitgutter'
Bundle 't9md/vim-ruby-xmpfilter'
Bundle 'mileszs/ack.vim'
Bundle 'plasticboy/vim-markdown'


syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

let mapleader = ","               " Leaderkey to ,

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set nowrap                        " Turn off line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile
"set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set autoread                      " Automatically read changed files

" Tabs and white spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

set clipboard^=unnamed

colorscheme vividchalk
set gfn=Inconsolata:h17
" Highlight current line
set cursorline
" hide toolbar
if has("gui_running")
    set guioptions=egmrt
endif
" Tab mappings.
map <C-T>t :tabnew<cr>
map <C-T>e :tabedit
map <C-T>c :tabclose<cr>
map <C-T>o :tabonly<cr>
map <C-T>n :tabnext<cr>
map <C-T>p :tabprevious<cr>
map <C-T>f :tabfirst<cr>
map <C-T>l :tablast<cr>
map <C-T>m :tabmove

let &t_Co=256            "Make iTerm play nicely

nnoremap <C-W>O :call MaximizeToggle ()<CR>
nnoremap <C-W>o :call MaximizeToggle ()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle ()<CR>

" Toggle Maximize in split windows (see: http://vim.wikia.com/wiki/Maximize_window_and_return_to_previous_split_structure)
function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

" Insert timestamp on typing dts
iab <expr> dts strftime("%a, %e %b %Y %H:%M:%S %z")

" Add clear search highlight to space functionality in normal mode
nnoremap <leader><SPACE> :nohl<CR>

" Show lines longer than 79
autocmd BufNewFile,BufRead * match ErrorMsg '\%>79v.\+'

" Run the ~/.vim/bin/vimexec.scpt AppleScript which takes the .vimexec.sh file
" and executes it on the current iTerm
function! OsascriptVimexec()
	exec	"!osascript ~/.vim/bin/vimexec.scpt"
endfunction
" Now map it to Apple+R and ,r
autocmd FileType cpp map <D-r> :wall<CR>:call OsascriptVimexec ()<CR><CR>
autocmd FileType java map <D-r> :wall<CR>:call OsascriptVimexec ()<CR><CR>
autocmd FileType ruby map <D-r> :wall<CR>:call OsascriptVimexec ()<CR><CR>
autocmd FileType cpp nmap ,r   :w<CR>:call OsascriptVimexec ()<CR><CR>

" Add empty lines without insert mode
nmap <S-Enter> O<Esc>

" Opposite of Shift-J
nnoremap <S-K> a<CR><Esc>k$

" Autocorrects
iab shoud should

" Remap omnicomplete
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <C-f> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Nicer TODO markers (see plugin todo-signs.vim)
if has("gui_running")
  autocmd BufNewFile,BufRead,BufWrite * call SignLines()
end

" Rename highlighted text (after you pressed * for example)
vnoremap <D-R> "hy:%s/<C-r>h//gc<left><left><left>

" Toggle Comment
map <D-/> <c-_><c-_>
map <leader>/ <c-_><c-_>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:>-,eol:Â

" Two functions that let you move windows between tabs
if !exists("*MoveToPrevTab")
  function MoveToPrevTab()
    "there is only one window
    if tabpagenr('$') == 1 && winnr('$') == 1
      return
    endif
    "preparing new window
    let l:tab_nr = tabpagenr('$')
    let l:cur_buf = bufnr('%')
    if tabpagenr() != 1
      close!
      if l:tab_nr == tabpagenr('$')
        tabprev
      endif
      vsplit
    else
      close!
      exe "0tabnew"
    endif
    "opening current buffer in new window
    exe "b".l:cur_buf
  endfunc
  command MoveToPrevTab :call MoveToPrevTab()
endif

if !exists("*MoveToNextTab")
  function MoveToNextTab()
    "there is only one window
    if tabpagenr('$') == 1 && winnr('$') == 1
      return
    endif
    "preparing new window
    let l:tab_nr = tabpagenr('$')
    let l:cur_buf = bufnr('%')
    if tabpagenr() < tab_nr
      close!
      if l:tab_nr == tabpagenr('$')
        tabnext
      endif
      vsplit
    else
      close!
      tabnew
    endif
    "opening current buffer in new window
    exe "b".l:cur_buf
  endfunc
  command MoveToNextTab :call MoveToNextTab()
endif

let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

" General key mappings
" Making vim a bit harder:
inoremap jj <Esc>
inoremap jk <Esc>
inoremap Jk <Esc>
inoremap JK <Esc>
inoremap <Esc> <nop>
inoremap  <Up> <nop>
inoremap  <Down> <nop>
inoremap  <Left> <nop>
inoremap  <Right> <nop>
" No more accidental help windows
:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>
" Get lost Ex-mode
nnoremap Q <nop>

let g:ctrlp_map = '<Leader>t' "Keymapping for (the Ctrl+t replacement) Ctrl+p

"This is for vim-tasks
noremap <silent> <buffer> <Leader>m :call Toggle_task_status()<CR>

"Editing epubs (epubs are zipped html pages)
au BufReadCmd   *.epub      call zip#Browse(expand("<amatch>"))

"Break line at 72 characters in commit messages
autocmd filetype gitcommit set textwidth=72

"Powerline config
let g:Powerline_symbols = 'fancy'

"Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

"Get rspec filetype outside of rails projects
autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function

"Custom spellfile
set spellfile=~/.vim/en.utf-8.add

" Activity log location:
let g:activity_log_location = '~/Dropbox/vim-activity'

" Edit and load vimrc
map <leader>- :tabedit ~/.vimrc<CR>
map <silent> <leader>_ :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Clear Ctrl+P cache
map <leader>T :CtrlPClearAllCaches<CR>:CtrlP<CR>

" Executing commands with vimux
noremap <leader><leader> :w<CR>:VimuxRunLastCommand<CR>
noremap <SPACE> :w<CR>:VimuxRunLastCommand<CR>
imap <leader><leader> jk:w<CR>:VimuxRunLastCommand<CR>
map <leader>c :VimuxClosePanes<CR>
let g:VimuxOrientation = "h"
let g:VimuxHeight = "36"
map <leader>q :cfile rspec.quickfix.errors<CR>
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>
autocmd FileType ruby map <buffer> <Leader>rf :w<CR>:RunRubyFocusedTest<CR>
autocmd FileType ruby map <buffer> <Leader>ra :w<CR>:RunAllRubyTests<CR>
autocmd FileType cucumber map <Leader>rf :w<CR>:RunFocusedCuke<CR>
autocmd FileType cucumber map <Leader>ra :w<CR>:RunAllCukes<CR>

" Arduino syntax highlighting
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

" Need this for gitgutter
highlight clear SignColumn

" Mappings for vim-ruby-xmpfilter
nmap <buffer> <leader>m <Plug>(xmpfilter-run)
xmap <buffer> <leader>m <Plug>(xmpfilter-run)
imap <buffer> <leader>m <Plug>(xmpfilter-run)

nmap <buffer> <F5> <Plug>(xmpfilter-mark)
xmap <buffer> <F5> <Plug>(xmpfilter-mark)
imap <buffer> <F5> <Plug>(xmpfilter-mark)
