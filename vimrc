filetype off                   " required before bundles

"
" Bundles
"
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

"
" Basic Vim settings
"

" <leader> was '\' by default
let mapleader=","

set nocompatible
syntax on

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

set encoding=utf8
set number
set ignorecase
set smartcase " case sensetive only if an uppercase character used

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
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
set copyindent " preserve indentation when creating a new line

set nobackup
set hidden " when e: FILE current file doesnt have to be saved, it's hidden

set mouse=a " always enable mouse
set clipboard=unnamedplus " X Window clipboard
filetype plugin indent on
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
" shit is always broken in my terminals - screw it
if has("gui_running")
  colorscheme solarized
else
  colorscheme noctu
end

"
" NERDTree
"
nmap <silent> <F2> :NERDTreeToggle<CR>
let g:NERDTreeCaseSensitiveSort=0
let g:NERDTreeDirArrows=1

"
" vim-airline
"
if has("gui_running")
  let g:airline_theme="solarized"
else
  let g:airline_theme="monochrome"
end

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
let g:syntastic_quiet_warnings=0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_cpp_checkers=['ycm']

"
" youcompleteme
"
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-tab>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

"
" ultisnips
"
let g:UltiSnipsExpandTrigger = '<c-s>'
let g:UltiSnipsListSnippets = '<c-m-s>'
let g:UltiSnipsJumpForwardTrigger = '<right>'
let g:UltiSnipsJumpBackwardTrigger = '<left>'

"
" Tabular
"
nnoremap <leader>a= :Tab /=<CR> 

"
" YankRing
"
let g:yankring_replace_n_pkey = ''
let g:yankring_replace_n_nkey = ''
nnoremap <silent> <leader>v :<C-U>YRReplace '-1', P<CR>
nnoremap <silent> <leader>V :<C-U>YRReplace '1', P<CR>

" disable Ctrl-a because it's used in tmux
noremap <C-A> <Nop>

"
" GUI
"
set guifont=Ubuntu\ Mono\ 11
set showcmd
set scrolloff=3
set display+=lastline
set sidescrolloff=5
set guioptions-=m " no menu
set guioptions-=T " no toolbar
set guioptions-=r " no scrollbar

autocmd FileType text setlocal textwidth=78
autocmd BufRead,BufNewFile Makeppfile set filetype=make

"
" Local config
"
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
