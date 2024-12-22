call plug#begin('~/.vim/plugged')
" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'drsooch/gruber-darker-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
" other
Plug 'vim-airline/vim-airline'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
call plug#end()

" IndentLine {{
let g:indentLine_char = '⎸'
let g:indentLine_first_char = '⎸'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}
"
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Limelight automatisch aktivieren, z. B. im Markdown-Modus
autocmd FileType markdown Limelight

" Definiere die Hervorhebung des nicht-fokussierten Textes
highlight LimelightConcealed ctermbg=NONE ctermfg=240 guibg=NONE guifg=#808080
let g:limelight_paragraph_span = 1 " Anzahl der fokussierten Absätze

syntax enable
set background=light
" colorscheme GruberDarker
set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" Basic vim settings

syntax on                     " Syntax-Hervorhebung einschalten
set number                   " Zeilennummern anzeigen
set relativenumber           " Relative Zeilennummern anzeigen ##set tabstop=4                 Tabulatorweite auf 4 setzen
set shiftwidth=4             " Einrückweite auf 4 setzen
set expandtab                " Tabs in Leerzeichen umwandeln
"set autoindent               " Automatische Einrückung
" set smartindent              " Intelligente Einrückung
set nowrap                   " Zeilen nicht umbrechen
" set cursorline               " Aktuelle Zeile hervorheben
set showcmd                  " Zeigt unvollständige Befehle an
set wildmenu                 " Bessere Auto-Vervollständigung
set hlsearch                 " Suchbegriffe hervorheben
set incsearch                " Inkrementelle Suche
set ignorecase               " Groß-/Kleinschreibung bei der Suche ignorieren
set smartcase                " Groß-/Kleinschreibung bei der Suche beachten, wenn Großbuchstaben verwendet werden
set clipboard=unnamedplus    " Systemweite Zwischenablage verwenden
set splitbelow               " Horizontale Splits unterhalb öffnen
set splitright               " Vertikale Splits rechts öffnen

set noerrorbells
set novisualbell
set t_vb=
set ttyfast

let &t_SI = "\e[6 q"
let &t_EI = "\e[0 q"

let g:SexyScroller_ScrollTime = -1

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :NERDTreeFind<CR>
nnoremap <C-a> :Goyo<CR>
nnoremap <C-x> :term<CR>

