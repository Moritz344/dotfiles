"" Switched to lazyvim
call plug#begin('~/.vim/plugged')  


Plug 'tpope/vim-sensible'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'

call plug#end()

set termguicolors
let base16colorspace=256  
colorscheme base16-default-dark

highlight SignColumn guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE

let g:airline#extensions#tabline#enabled = 1
let mapleader = " "

"" coc.nvim Einstellungen
"" Automatische LSP-Funktionalitäten aktivieren
inoremap <silent><expr> <C-Space> coc#refresh()

" Nützliche Mappings für Coc (Autocomplete & mehr)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> K :call CocActionAsync('doHover')<CR>
nmap <leader>rn <Plug>(coc-rename)

" Fehler anzeigen
nnoremap <silent> <leader>e :CocDiagnostics<CR>

nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>


set number
set relativenumber
let g:startify_bookmarks = [
            \ { '6': '~/.config/vim/configs/' },
            \ { '7': '~/Documents/Vim_Setup/' },
            \ { '8': '~/codeforces/' },
            \ { '9': '~/.config/vim/plugged/' },
            \ { 'w': '~/AppData/Local/coc/ultisnips' },
            \ { 'r': '~/.config/vim/Vim/vim82/' },
            \ ]

let g:ascii = [
       \ '        __',
       \ '.--.--.|__|.--------.',
       \ '|  |  ||  ||        |',
       \ ' \___/ |__||__|__|__|',
       \ ''
       \]

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
let g:startify_change_to_dir = 1
let g:startify_fortune_use_unicode = 1
let g:startify_custom_header = g:ascii + startify#fortune#boxed()
" 'Most Recent Files' number
let g:startify_files_number = 11
" Update session automatically as you exit vim
let g:startify_session_persistence= 1
