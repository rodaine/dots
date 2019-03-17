set nocompatible " VIM is less VI-like

" Environment
set directory=$VIMCFG,~/,/tmp
set backupdir=$VIMCFG,~/,/tmp
set viminfo+='1000,n$VIMCFG/.viminfo
set runtimepath=$VIMCFG,$VIMCFG/after,$VIM,$VIMRUNTIME
let $MYVIMRC="$VIMCFG/.vimrc"

" COLORS
colorscheme Tomorrow-Night-Eighties " the BEST color scheme
syntax on                           " enable syntax processing

" SPACES & TABS
set tabstop=2     " tabs should take up 2 spaces
set softtabstop=2 " tabs should be converted to 2 spaces
set smarttab      " be smart about adding tabs
set autoindent    " use auto indenting to match prev lines
set smartindent   " use auto indenting when starting a new line

" UI CONFIG
set number                      " Show line numbers
highlight LineNr ctermfg=6
set showcmd                     " Show the command in the bottom bar
set cursorline                  " Show the cursorline and highlight it in LineNr
highlight CursorLine cterm=NONE
set ruler                       " show current position in the document
filetype indent on              " load filetype-specific indent files
set wildmenu                    " visual autocomplete for command menu
set lazyredraw                  " don't redraw unless you need to
set showmatch                   " bracket matching

" SEARCH
set incsearch " search as characters are entered
set hlsearch  " highlight matches, type ,<space> to unhighlight
nnoremap <leader><space> :nohlsearch<CR>

" FOLDING
set foldenable        " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nested fold max
set foldmethod=indent " fold based on indent level

" MOVEMENT
" move vertically by visual line, not skipping wrapped portion
nnoremap j gj
nnoremap k gk

" LEADER SHORTCUTS
let mapleader=","    " comma replaces \ as leader
" toggle Gundo
nnoremap <leader>u :GundoToggle<CR>
" edit/source various RC files
nnoremap <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <leader>ez :tabedit ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" PATHOGEN
runtime bundle/vim-pathogen/autoload/pathogen.vim
filetype off
call pathogen#infect() " Pathogen hack
call pathogen#helptags()
filetype plugin indent on " Enable file-type indentation

set backspace=indent,eol,start
