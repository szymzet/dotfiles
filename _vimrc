" install plugins
" ctrlp
" nerdtree
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
set noexpandtab
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

" 
" colors
"
set background=light
colorscheme solarized

filetype plugin indent on

autocmd BufEnter * lcd %:p:h

"
" CtrlP
"
let g:ctrlp_map = '<c-p>'
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
let g:user_zen_leader_key = '<c-e>'

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

nmap <C-]> :vsc Edit.GoToDefinition<CR>
