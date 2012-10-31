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
set scrolloff=3
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline

set background=light
colorscheme solarized

nmap <silent> <F2> :NERDTreeToggle<CR>

set guifont=Consolas:h10:cDEFAULT
set showcmd
set scrolloff=2 
behave mswin
set guioptions-=m " no menu
set guioptions-=T " no toolbar
set guioptions-=r " no scrollbar

filetype plugin indent on

autocmd BufEnter * lcd %:p:h

set nocompatible
autocmd FileType text setlocal textwidth=78

nmap <C-]> :vsc Edit.GoToDefinition<CR>
