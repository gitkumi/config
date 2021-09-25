call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

colorscheme nord
:set number
:set encoding=UTF-8

let g:airline_powerline_fonts=1
let g:netrw_banner = 0

:nnoremap <F5> :buffers<CR>:buffer<Space>
:nnoremap <C-p> :GFiles<Cr>
