:call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
:call plug#end()

:let g:airline_powerline_fonts=1
:let g:netrw_banner = 0

:colorscheme dracula
:set hidden
:set number
:set encoding=UTF-8
:set autoindent
:set expandtab
:set tabstop=2
:set softtabstop=2
:set shiftwidth=2
:set mouse=a
:set relativenumber
:set rnu

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

:nnoremap("<C-d>", "<C-d>zz")
:nnoremap("<C-u>", "<C-u>zz")

