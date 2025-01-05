call plug#begin('~/.vim/plugged')
" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'drsooch/gruber-darker-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'voldikss/vim-floaterm'
" other
Plug 'vim-airline/vim-airline'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'townk/vim-autoclose'
Plug 'mhinz/vim-startify'
call plug#end()

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
autocmd FileType markdown Limelight

highlight LimelightConcealed ctermbg=NONE ctermfg=240 guibg=NONE guifg=#808080
let g:limelight_paragraph_span = 1
let g:workspace_session_disable_on_args = 1

syntax enable
set background=dark
set termguicolors

let ayucolor="light"
let ayucolor="mirage"
let ayucolor="dark"

colorscheme onedark

" Basic vim settings
syntax on
set number
set relativenumber
set tabstop=4
set shiftwidth=2
set expandtab
set nowrap
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase
set clipboard=unnamedplus
set splitbelow
set splitright
set noerrorbells
set novisualbell
set t_vb=
set ttyfast

let SexyScroller_ScrollTime = 1

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-l> :NERDTreeFind<CR>
nnoremap <C-a> :Goyo<CR>
nnoremap <C-x> :FloatermToggle<CR>
