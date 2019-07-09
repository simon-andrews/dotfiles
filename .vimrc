" PLUGINS
call plug#begin()
"misc
Plug '907th/vim-auto-save'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/NERDTree'
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

" COLORSCHEME
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" STATUSLINE
function! StatuslineGit()
  let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0 ? l:branchname : ''
endfunction

set laststatus=2
set statusline=
set statusline+=%#CursorColumn#
"set statusline+=\ %{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%=
set statusline+=%#CursorColumn#
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
