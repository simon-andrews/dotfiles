" PLUGINS
call plug#begin()
Plug '907th/vim-auto-save'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/NERDTree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
call plug#end()

" EDITING
set backspace=indent,eol,start "make backspace key work normally
set expandtab                  "replace tabs with spaces
set scrolloff=3                "leave 3 lines at top and bottom
set shiftwidth=2               "how many columns to indent for auto-indent
set tabstop=2                  "set tab display with

" MISC
set clipboard=unnamed "use system clipboard (requires +clipboard)
set updatetime=100    "refresh rate (in ms) for plugins
set wildmenu          "enable fancy tab-completion menu (requires +wildmenu)
set wildmode=full     "tab-complete to next full string

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
set laststatus=2          "always enable statusline on bottom of screen
set statusline=\          "start a space
set statusline+=%f\ %m    "add current file name (%f) and indicator for whether it's been edited since last save (%m)
set statusline+=%=        "add separator to right-align everything else
set statusline+=\ %p%%    "add position percentage (%p)
set statusline+=\ %l:%c   "add current line (%l) and column (%c)
set statusline+=\         "add one more space on the end

" NERDTREE
noremap <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = [ '\.pyc$' ]

" ALE LINTING
let g:ale_lint_on_text_changed = 'never' "don't lint while typing (so only save, exiting insert mode, etc.)
let g:ale_linters_explicit = 1           "only use linters that have been explicitly enabled
let g:ale_linters = {
\	'python': [ 'clangtidy', 'flake8' ],
\}
