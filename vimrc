filetype off                   " required before bundles
set nocompatible

"
" Bundles
"
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

"
" Filetype-specific behaviour enabled
"
filetype on
filetype indent on
filetype plugin on

"
" Basic Vim settings
"

" <leader> was '\' by default
let mapleader=","

set t_Co=16
syntax on

set encoding=utf8
set number
set ignorecase
set smartcase " case sensetive only if an uppercase character used

set tabstop=4
set softtabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set copyindent " preserve indentation when creating a new line
set smartindent
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

set nobackup
set hidden " when e: FILE current file doesnt have to be saved, it's hidden

set mouse=a " always enable mouse
set mousemodel=popup
set clipboard=unnamedplus " X Window clipboard, the "+" register
set fileformats=unix,dos

set history=1000
set undolevels=9999
set updatetime=1000
set title " change terminal's title
set noautochdir " makes sense when using CtrlP, we want the editor
                " top level directory to be constant

nnoremap <leader>n :noh<CR> " hide search highlighting
nnoremap <leader>w :w<CR> " save :D
nnoremap <leader>q :q<CR> " quit

"
" whitechars
"
if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8') && version >= 700
  let &listchars = "tab:\u21e5\u00b7,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  let &fillchars = "vert:\u259a,fold:\u00b7"
else
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<
endif

"
" CtrlP
"
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

"
" window splits
"
" easier resizing
nnoremap <silent> <leader><leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader><leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>  

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"
" colors
"
set background=dark
let g:solarized_termcolors=16
colorscheme solarized

"
" NERDTree
"
nmap <silent> <F2> :NERDTreeToggle<CR>
let g:NERDTreeCaseSensitiveSort=0
let g:NERDTreeDirArrows=1

"
" vim-airline
"
let g:airline_theme="solarized"
let g:airline_detect_whitespace=0 "disabled
let g:airline_powerline_fonts=1
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_branch_prefix = '⎇ '
let g:airline_enable_syntastic = 1
let g:airline_enable_tagbar = 1
let g:airline_enable_branch = 1

"
" tagbar
"
nmap <F3> :TagbarToggle<CR>

"
" easymotion
"
let g:EasyMotion_leader_key = '\'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz' " no uppercase

"
" Ack / Ag
"
nnoremap <leader>f :Ack!<space>
let g:ackprg = 'ag --nogroup --nocolor --column' " ag is faster: github.com/ggreer/the_silver_searcher

"
" Syntastic
"
nmap <silent> <F4> :Errors<CR>
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
let g:syntastic_enable_highlighting = 1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_cpp_checkers=['ycm']
let g:syntastic_enable_signs = 1
"
" youcompleteme
"
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-tab>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1

"
" ultisnips
"
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

"
" YankRing
"
let g:yankring_replace_n_pkey = ''
let g:yankring_replace_n_nkey = ''
nnoremap <silent> <leader>v :<C-U>YRReplace '-1', P<CR>
nnoremap <silent> <leader>V :<C-U>YRReplace '1', P<CR>

"
" GUI
"
if has("unix")
  set guifont=bitstream\ vera\ sans\ mono\ 10
elseif has("win32")
    set guifont=Consolas:h11,Courier\ New:h10
endif

set showcmd
set scrolloff=3
set display+=lastline
set sidescrolloff=5
set guioptions-=m " no menu
set guioptions-=T " no toolbar
set guioptions-=r " no scrollbar

autocmd FileType text setlocal textwidth=78
autocmd FileType markdown setlocal textwidth=78
autocmd BufRead,BufNewFile Makeppfile set filetype=make

"
" ruby
"
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:ruby_minlines = 500

" insert hashrocket =>
imap <c-l> <space>=><space>

autocmd FileType ruby set ts=2| set sw=2| set sts=2
autocmd FileType ruby
    \ if expand('%') =~# '_test\.rb$' |
    \ compiler rubyunit | setl makeprg=testrb\ \"%:p\" |
    \ elseif expand('%') =~# '_spec\.rb$' |
    \ compiler rspec | setl makeprg=rspec\ \"%:p\" |
    \ else |
    \ compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
    \ endif

"
" Local config
"
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
