set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Raimondi/delimitMate'
Bundle 'SirVer/ultisnips'
Bundle 'mileszs/ack.vim'
Bundle 'godlygeek/tabular'

" <leader> was '\' by default
"
let mapleader=","

" Basic Vim settings
"
set nocompatible
syntax on
set encoding=utf8
set number
set ignorecase
set smartcase " case sensetive only if an uppercase character used

set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start " backspace over autoindent and line breaks

set showmatch
set ruler
set hlsearch
set incsearch
set laststatus=2 " always show statusline
set virtualedit=onemore " allow to move one character beyond the last one

set wildmenu " TAB expansion of commands in command mode
set wildmode=list:longest

set visualbell " blink screen instead of beeping
set cursorline
set copyindent " preserve indentation when creating a new line

set nobackup
set hidden " when e: FILE current file doesnt have to be saved, it's hidden

set mouse=a " always enable mouse
set clipboard=unnamedplus " X Window clipboard
filetype plugin indent on
set fileformats=unix,dos

set history=1000
set undolevels=9999
set title " change terminal's title
set noautochdir " makes sense when using command-t, we want the editor
                " top level directory to be constant

nnoremap <leader>e :e#<CR> " go to prviously edited buffer (easy switching)
nnoremap <leader>n :noh<CR> " hide search highlighting, q for quiet
nnoremap <leader>w :w<CR> " save :D
nnoremap <leader>q :q<CR> " quit

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_max_height = 20
let g:ctrlp_max_files = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
nnoremap <leader>m :CtrlPBuffer<CR> " only opened buffers

" window splits
"
" easier resizing
nnoremap <silent> <leader><leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader><leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" colors
"
set background=dark
colorscheme desert

" highlight/remove trailing spaces
"
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif

" NERDTree
"
nmap <silent> <F2> :NERDTreeToggle<CR>

" tagbar
"
nmap <F3> :TagbarToggle<CR>

" easymotion
"
let g:EasyMotion_leader_key = '\'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz' " no uppercase

" Ack
"
nnoremap <leader>f :Ack!<space>
let g:ackprg = 'ag --nogroup --nocolor --column' " ag is faster: github.com/ggreer/the_silver_searcher

" Syntastic
"
nmap <silent> <F4> :Errors<CR>

" youcompleteme
"
let g:ycm_key_list_select_completion = ['<tab>', '<c-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-tab>', '<c-k>', '<Up>']

" ultisnips
"
let g:UltiSnipsExpandTrigger = '<c-l>'
let g:UltiSnipsListSnippets = '<c-h>'

" GUI
"
set guifont=Source\ Code\ Pro\ 10
set showcmd
set scrolloff=3
set display+=lastline
set sidescrolloff=5
set guioptions-=m " no menu
set guioptions-=T " no toolbar
set guioptions-=r " no scrollbar

autocmd FileType text setlocal textwidth=78
autocmd BufRead,BufNewFile Makeppfile set filetype=make

