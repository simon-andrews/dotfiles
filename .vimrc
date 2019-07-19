" PLUGINS
call plug#begin()
"misc
Plug '907th/vim-auto-save'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/NERDTree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
"language support
Plug 'cespare/vim-toml'
Plug 'hashivim/vim-terraform'
Plug 'idris-hackers/idris-vim'
Plug 'leafgarland/typescript-vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'neovimhaskell/haskell-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pangloss/vim-javascript'
call plug#end()

" EDITING
set backspace=indent,eol,start "make backspace key work normally
set expandtab                  "replace tabs with spaces
set scrolloff=3                "leave 3 lines at top and bottom
set shiftwidth=2               "how many columns to indent for auto-indent
set tabstop=2                  "set tab display with

" MISC
set clipboard=unnamed "use system clipboard (requires +clipboard)
set updatetime=100

" SEARCH
set ignorecase "ignore case when searching
set incsearch  "enable incremental search

" UI/UX
set mouse=a "enable mouse usage (in all modes)
set number  "enable line numbers in left gutter
set ruler   "show line and column numbers in bottom right
syntax on   "enable syntax highlighting
colorscheme jellybeans

" STATUSLINE
set laststatus=2
set statusline=
set statusline+=\ %f\ %m
set statusline+=%=
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

" NERDTREE
noremap <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = [ '\.pyc$' ]

" ALE LINTING
let g:ale_lint_on_text_changed = 'never' "don't lint while typing (so only save, exiting insert mode, etc.)
let g:ale_linters_explicit = 1           "only use linters that have been explicitly enabled
let g:ale_linters = {
\	'python': [ 'clangtidy', 'flake8' ],
\}
