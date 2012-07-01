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
Bundle 'mirell/vim-matchit'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'sebastiangeiger/gitignore.vim'
Bundle 'vim-scripts/VimClojure'
Bundle 'samsonw/vim-task'
Bundle 'pangloss/vim-javascript'
Bundle 'tangledhelix/vim-octopress'
Bundle 'jpalardy/vim-slime'
Bundle 'sjl/vitality.vim'
 "Play nicely with iTerm2
"Bundle 'vim-scripts/a.vim'
"Bundle 'vim-scripts/rubycomplete.vim' "TODO: Does weird stuff!
"Bundle 'tpope/vim-cucumber'
"Bundle 'tpope/vim-haml'


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

" Tabs and white spaces
set tabstop=2 
set softtabstop=2
set shiftwidth=2                 
set expandtab

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" use vividchalk
colorscheme vividchalk
set gfn=Monaco:h14 
" Highlight current line
set cursorline
" hide toolbar
if has("gui_running")
    set guioptions=egmrt
endif
" Tab mappings.
"map <leader>tt :tabnew<cr>
"map <leader>te :tabedit
"map <leader>tc :tabclose<cr>
"map <leader>to :tabonly<cr>
"map <leader>tn :tabnext<cr>
"map <leader>tp :tabprevious<cr>
"map <leader>tf :tabfirst<cr>
"map <leader>tl :tablast<cr>
"map <leader>tm :tabmove

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

" Enhancements for Ruby and Autotest
compiler rubyunit
nmap <Leader>fd :cf /tmp/autotest.txt<cr> :compiler rubyunit<cr>

" Insert timestamp on typing dts 
iab <expr> dts strftime("%a, %e %b %Y %H:%M:%S %z")

" Add clear search highlight to space functionality in normal mode
nmap <SPACE> <SPACE>:noh<CR>

" Show lines longer than 100 if in C++ mode
autocmd FileType cpp match ErrorMsg '\%>100v.\+'

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
map <S-Enter> O<Esc>
map <CR> o<Esc>

" Opposite of Shift-J
nnoremap <S-K> a<CR><Esc>k$

" Autocorrects
iab shoud should
iab ü \"u
iab ö \"o
iab ä \"a
iab ß \ss 

" Remap omnicomplete
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <C-f> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Nicer TODO markers (see plugin todo-signs.vim)
if has("gui_running")
  autocmd BufNewFile,BufRead,BufWrite * call SignLines()
end

" Sweet RSpec vim
highlight RSpecFailed guibg=#671d1a
highlight RSpecPending guibg=#54521a
" autocmd FileType ruby map <D-r> :SweetVimRspecRunFileWithSigns<CR>

" Rename highlighted text (after you pressed * for example)
vnoremap <D-R> "hy:%s/<C-r>h//gc<left><left><left>

" Toggle Comment
map <D-/> <c-_><c-_>
map <leader>/ <c-_><c-_>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Two functions that let you move windows between tabs
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

let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

" General key mappings
" Making vim a bit harder:
inoremap jk <Esc>
inoremap <Esc> <nop>
inoremap  <Up> <nop>
inoremap  <Down> <nop>
inoremap  <Left> <nop>
inoremap  <Right> <nop>
" No more accidental help windows
:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>

let g:snippets_dir = '~/.vim/bundle/snipmate-snippets/snippets/,~/.vim/snippets/'

let g:ctrlp_map = '<Leader>t' "Keymapping for (the Ctrl+t replacement) Ctrl+p

"This is for vim-tasks
noremap <silent> <buffer> <Leader>m :call Toggle_task_status()<CR> 

"Editing epubs (epubs are zipped html pages)
au BufReadCmd   *.epub      call zip#Browse(expand("<amatch>"))

"source ~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim

"Break line at 72 characters in commit messages
autocmd filetype gitcommit set textwidth=72
