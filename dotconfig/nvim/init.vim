:call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
:call plug#end()

:let g:airline_powerline_fonts=1
:let g:airline#extensions#tabline#enabled = 1
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
:nnoremap("<C-h>", ":bprev")
:nnoremap("<C-l>", ":bnext")

" Find files using Telescope command-line sugar.
nnoremap <leader>fp <cmd>Telescope git_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
