" PLUGINS
call plug#begin()
"misc
Plug '907th/vim-auto-save'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/NERDTree'
Plug 'w0rp/ale', { 'for': 'python' }
"language support
Plug 'cespare/vim-toml',                { 'for': 'toml' }
Plug 'hashivim/vim-terraform',          { 'for': 'terraform' }
Plug 'idris-hackers/idris-vim',         { 'for': ['idris', 'lidris'] }
Plug 'leafgarland/typescript-vim',      { 'for': 'typescript' }
Plug 'martinda/Jenkinsfile-vim-syntax', { 'for': 'Jenkinsfile' }
call plug#end()

" EDITING
set backspace=indent,eol,start "make backspace key work normally
set tabstop=2                  "set tab display with

" MISC
set clipboard=unnamed "use system clipboard (requires +clipboard)

" SEARCH
set ignorecase "ignore case when searching
set incsearch  "enable incremental search

" UI/UX
set mouse=a "enable mouse usage (in all modes)
set number  "enable line numbers in left gutter
set ruler   "show line and column numbers in bottom right
syntax on   "enable syntax highlighting

" NERDTREE
noremap <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = [ '\.pyc$' ]
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ALE LINTING
let g:ale_lint_on_text_changed = 'never' "don't lint while typing (so only save, exiting insert mode, etc.)
let g:ale_linters_explicit = 1           "only use linters that have been explicitly enabled
let g:ale_linters = {
\	'python': [ 'flake8' ],
\}
