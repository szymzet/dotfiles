set nocompatible
filetype off
set regexpengine=1

"
" Plugins (https://github.com/junegunn/vim-plug)
"
call plug#begin('~/.vim/plugged')
Plug 'Shougo/junkfile.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'
Plug 'vim-ruby/vim-ruby', {'for' : 'ruby'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'w0rp/ale'
Plug 'raimondi/delimitmate'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/gv.vim'
Plug 'AndrewRadev/splitjoin.vim'
call plug#end()
runtime macros/matchit.vim " see :help matchit-activate

let mapleader = "\<space>"

" v == vimrc
nnoremap <leader>v :vsplit $MYVIMRC<cr>
nnoremap <leader>V :source $MYVIMRC<cr>

inoremap jk <esc>
inoremap kj <esc>
inoremap fd <esc>

noremap <leader>yy :.w !pbcopy<CR><CR>
noremap <leader>y :.w !pbcopy<CR><CR>
vmap <leader>y :.w !pbcopy<CR><CR>
noremap <leader>p :r !pbpaste<CR>

" quick nohighlight
nnoremap <leader>c :nohlsearch<CR>:match<CR>:echo 'cleared search highlight'<CR> " c == clear

" Disable Ex-mode.
nnoremap Q q

" Save files quickly
nnoremap <leader>w :update<CR>

" A'la M-x in Emacs
nnoremap <leader>x :

" '1' for 'shift-1 (!)'
nnoremap <leader>1 :!
vnoremap <leader>1 :!
nnoremap <leader>! :!
vnoremap <leader>! :!

" 'E' for 'Execute'
inoremap <C-e> <ESC>:exec 'r! '.getline('.')<CR>
nnoremap <C-e> :exec 'r! '.getline('.')<CR>
nnoremap <leader>e :exec 'r! '.getline('.')<CR>

nnoremap <leader>[ :bp<CR>
nnoremap <leader>] :bn<CR>

nnoremap <leader>D :bd!<CR>
nnoremap <leader>d :bprevious<CR>:bdelete #<CR> " close buffer without closing window
nnoremap <leader>Y :let @* = expand("%:p")<CR>:echo 'copied file path to clipboard: '.@*<CR>

nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qall<CR>

nnoremap <leader>n :new<CR>

nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wv :wincmd v<CR>
nnoremap <leader>ws :wincmd s<CR>
nnoremap <leader>wo :wincmd o<CR>
nnoremap <leader>wc :wincmd c<CR>
nnoremap <leader>wH :wincmd H<CR>
nnoremap <leader>wJ :wincmd J<CR>
nnoremap <leader>wK :wincmd K<CR>
nnoremap <leader>wL :wincmd L<CR>
nnoremap <leader>w= :wincmd =<CR>

" easier resizing
nnoremap <silent> <c-up> :resize +5<CR>
nnoremap <silent> <c-down> :resize -5<CR>
nnoremap <silent> <c-right> :vertical resize +5<CR>
nnoremap <silent> <c-left> :vertical resize -5<CR>

"
" Vim settings
"
filetype plugin indent on
syntax on
colors gruvbox
set termguicolors
set encoding=utf8
set autoindent
set breakindent
set showbreak=\\\\\
set autoread " reload file if changed outside
set backspace=indent,eol,start
set cmdheight=2
set display=lastline
set fileformats=unix,dos,mac
set foldopen+=jump
set formatoptions+=j
set grepprg=/usr/local/bin/ag\ --vimgrep\ -s\ -H\ --nocolor\ --nogroup\ --column\ --smart-case\ --follow
set history=200
set hidden " buffers with changes can be window-less
set incsearch
set hlsearch
set synmaxcol=200
set ignorecase smartcase
set laststatus=2
set lazyredraw
set matchpairs+=<:> " Match, to be used with %
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set scrolloff=1
set guioptions='g'
set shiftwidth=2
set softtabstop=2 " Let backspace delete indent
set splitbelow " Puts new split windows to the bottom of the current
set splitright " Puts new vsplit windows to the right of the current
set tabstop=2 " An indentation every four columns
set expandtab " Tabs are spaces, not tabs
set softtabstop=2 " Let backspace delete indent
" source: https://github.com/tpope/tpope/blob/master/.vimrc
set timeoutlen=1200 " A little bit more time for macros
set ttimeoutlen=50  " Make Esc work faster
set undofile
set virtualedit=onemore " allow to move one character beyond the last one
set visualbell
set wildignore+=tags,.*.un~,*.pyc,*.class
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildmenu
set wildmode=longest:full,full
set nowritebackup
set nobackup
set directory=$HOME/.vim/swapfiles/
set undodir=$HOME/.vim/swapfiles/
set dictionary+=/usr/share/dict/words
set backupdir-=.
set nonumber
set norelativenumber
" copy to clipboard
set clipboard=unnamed

" Don't use Ex mode, use Q for formatting
noremap Q gq

" uncomment only for molokai
" let g:molokai_original = 1
" let g:rehash256 = 1
set cursorline
set background=dark
set guifont=Inconsolata-g\ for\ Powerline:h12

set shell=/usr/local/bin/zsh\ -i
"
" emacs style key bindings on command line
"
" start of line
cnoremap <C-A>    <Home>
" back one character
cnoremap <C-B>    <Left>
" delete character under cursor
cnoremap <C-D>    <Del>
" end of line
cnoremap <C-E>    <End>
" forward one character
cnoremap <C-F>    <Right>
" recall newer command-line
cnoremap <C-N>    <Down>
" recall previous (older) command-line
cnoremap <C-P>    <Up>
" back one word
cnoremap <Esc><C-B>  <S-Left>
" forward one word
cnoremap <Esc><C-F>  <S-Right>
" paste
cnoremap <C-y> <C-r>*

"
" FZF
"
" add the following to bashrc for ultra fast files listings
"   export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
let g:fzf_command_prefix = 'FZF'
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_history_dir = '~/.fzf-history'
nnoremap <leader>f :FZFFiles .<CR>
nnoremap <leader>b :FZFBuffers<CR>
nnoremap <leader>s :FZFBLines<CR>
nnoremap <leader>; :FZFCommands<CR>
nnoremap <leader>: :FZFCommands<CR>
nnoremap <leader>/ :FZFAg 
nnoremap <leader>* :FZFAg <C-R><C-W><CR>

"
" NERDTree
"
" mnemonic: f-file t-tree
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>T :NERDTreeFind<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeCaseSensitiveSort=0
let g:NERDTreeDirArrows=1
let g:NERDTreeChDirMode=2

"
" EasyMotion
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

" 'L' for 'move to Line'
nmap <leader>l <Plug>(easymotion-overwin-line)

" 'j' for 'jump to character'
nmap <leader>j <Plug>(easymotion-overwin-f)

"
" ALE
"
nmap <silent> <C-k> <Plug>(ale_previous)
nmap <silent> <C-j> <Plug>(ale_next)

"
" Ruby settings
"

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
augroup END
let g:ruby_path = [] " https://github.com/vim-ruby/vim-ruby/issues/294

"
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
" Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
" Do the business:
    %s/\s\+$//e
" Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()

" mnemonic e = edit, s = strip
nnoremap <leader>es :StripTrailingWhitespaces<CR>
