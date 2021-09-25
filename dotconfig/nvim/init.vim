call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme nord
:set number

let g:airline_powerline_fonts=1

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 80

:nnoremap <F5> :buffers<CR>:buffer<Space>
