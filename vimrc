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
set fileencodings=utf-8,latin2,latin1
set number
set relativenumber
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

" Don't use Ex mode, use Q for formatting
map Q gq

" handy shortcuts
nnoremap <leader>n :noh<CR> " hide search highlighting
nnoremap <leader>s :w<CR> " save :D
nnoremap <leader>q :q<CR> " quit
imap jk <Esc>
imap kj <Esc>

" space to enter Ex line
nnoremap <Space> :
vnoremap <Space> :

" show trailing whitespace
set list listchars=tab:\ \ ,trail:·

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
" e = edit, s = strip
nmap <leader>es :StripTrailingWhitespaces<CR>

"
" CtrlP
"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_max_height = 20
let g:ctrlp_max_files = 100000
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_by_filname = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'rw'
if executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag "%s" -l -a -g "" -s --ignore "\.git$\|\.hg$\|\.svn$" ./'
else
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif
nnoremap <leader>m :CtrlPBuffer<CR> " only opened buffers

"
" window splits
"
nnoremap <silent> <leader>ws :split<CR>
nnoremap <silent> <leader>wv :vsplit<CR>
nnoremap <silent> <leader>wc :wincmd c<CR>
nnoremap <silent> <leader>ww :wincmd w<CR>

nnoremap <silent> <up> :wincmd k<CR>
nnoremap <silent> <leader>wk :wincmd k<CR>

nnoremap <silent> <down> :wincmd j<CR>
nnoremap <silent> <leader>wj :wincmd j<CR>

nnoremap <silent> <left> :wincmd h<CR>
nnoremap <silent> <leader>wh :wincmd h<CR>

nnoremap <silent> <right> :wincmd l<CR>
nnoremap <silent> <leader>wl :wincmd l<CR>

" easier resizing 
nnoremap <silent> <c-up> :resize +5<CR>
nnoremap <silent> <c-down> :resize -5<CR>
nnoremap <silent> <c-right> :vertical resize +5<CR>
nnoremap <silent> <c-left> :vertical resize +5<CR>

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
nmap <silent> <leader>ee :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeCaseSensitiveSort=0
let g:NERDTreeDirArrows=1

"
" vim-airline
"
let g:airline_theme="solarized"
let g:airline_detect_whitespace=0 "disabled
let g:airline_powerline_fonts=1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#enabled = 1

"
" tagbar
"
nmap <silent> <leader>et :TagbarToggle<CR>

"
" easymotion
"
let g:EasyMotion_leader_key = '\'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz' " no uppercase

"
" Ack / Ag
"
"
nmap <leader>ag :Ag ""<Left>
nmap <leader>af :AgFile ""<Left>

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
let g:yankring_history_file = '.yankring_history'
nnoremap <silent> <leader>v :<C-U>YRReplace '-1', P<CR>
nnoremap <silent> <leader>V :<C-U>YRReplace '1', P<CR>

"
" gundo
"
nmap <leader>u :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_width = 60

"
" GUI
"
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

" highlight 80-th column only when we reach it (Damian Conway - Instantly
" Better Vim from OSCON 2013)
highligh ColorColumn ctermbg=10 guibg=Magenta 
call matchadd('ColorColumn', '\%81v.', 100)
call matchadd('ColorColumn', '\%121v.\+', 100) " after 120 its all bad

"
" Local config
"
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
