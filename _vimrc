" 
" install plugins:
"
" ctrlp.vim
" nerdtree
" vim-markdown
" vim-surround
" vim-signature
" vim-easymotion
" zencoding-vim
"
set nocompatible
syntax on
set encoding=utf8
set number
set ignorecase
set smartcase
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set showmatch
set ruler
set hlsearch
set incsearch
set scrolloff=4 " when c-f, c-b show previous 4 lines
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set copyindent
set nobackup
set hidden " when e: FILE current file doesnt have to be saved, it's hidden
filetype plugin indent on
autocmd BufEnter * lcd %:p:h

set history=1000
set undolevels=1000
set title " change terminal's title

" <Leader> was '\' by default
let mapleader=","

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

"
" window splits
"
nnoremap <silent> <Leader><Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader><Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" 
" colors
"
set background=light
colorscheme solarized

"
" CtrlP
"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer' " by default search in buffers
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" 
" Pathogen
"
call pathogen#infect()

" 
" NERDTree
"
nmap <silent> <F2> :NERDTreeToggle<CR>

"
" zencoding
"
let g:user_zen_leader_key = '<c-e>' " eg. ul > li<c-e>,

"
" easymotion
"
let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz' " no uppercase

"
" Windows
"
set guifont=Consolas:h10:cDEFAULT
set showcmd
set scrolloff=2 
behave mswin
set guioptions-=m " no menu
set guioptions-=T " no toolbar
set guioptions-=r " no scrollbar

autocmd FileType text setlocal textwidth=78

"
" for VsVim
"
nmap <C-]> :vsc Edit.GoToDefinition<CR>
