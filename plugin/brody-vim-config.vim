nnoremap <F1> :h brody-vim-config<CR>

set expandtab                 " To make tabs into spaces
set tabstop=2
set shiftwidth=2
set hlsearch
set number
set nomousehide
filetype indent on

set guioptions-=T  "remove toolbar


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


if has('win32') || has ('win64')
  "To use powershell (on Windows): >
  set shell=powershell.exe
  set shellxquote=
  let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
  let &shellquote   = ''
  let &shellpipe    = '| Out-File -Encoding UTF8 %s'
  let &shellredir   = '| Out-File -Encoding UTF8 %s'

  " Copy automatically to clipboard
  set clipboard+=unnamedplus
endif

" ----------------------------------

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

"==========     Plug 'nvim-telescope/telescope.nvim'
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>

"==========     Plug 'junegunn/vim-easy-align'
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

