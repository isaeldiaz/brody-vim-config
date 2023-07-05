set nocompatible              " be iMproved, required
set expandtab                 " To make tabs into spaces

set tabstop=2
set shiftwidth=2
filetype indent on
set hlsearch
set number
set nomousehide

set number relativenumber
"
" Map the leader key to SPACE
let mapleader="\<SPACE>"

set guioptions-=T  "remove toolbar


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Associate r files to XML syntax
 au BufNewFile,BufRead *.r setlocal ft=xml
" associate *.upf with Tcl filetype
au BufRead,BufNewFile *.upf set filetype=tcl

" ----------------------------------
" Font Adjust sections
if has('win32') || has ('win64')
  let s:fonttype = 'Consolas:h'
else
  let s:fonttype = 'Monospace:h'
endif

let s:fontsize = 12
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! " . s:fonttype . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
" ----------------------------------


if has('nvim')
  " Esc to leave terminal mode
  tnoremap <Esc> <C-\><C-n>
endif

" ===========  Plug 'flazz/vim-colorschemes'
colorscheme wombat
set background=dark

" ========== Plug 'vim-airline/vim-airline'
let g:airline_theme='distinguished'

" ========== Plug 'plasticboy/vim-markdown'
autocmd FileType markdown normal zR
let g:vim_markdown_conceal = 0

" ========== Plug 'easymotion/vim-easymotion'
map  <Leader>w <Plug>(easymotion-bd-w)
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" ============  Plug 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind %<CR>
map <Leader>n :NERDTreeFocus<CR>
let NERDTreeShowLineNumbers=1

nnoremap <F1> :h brody-vim-config<CR>
