:call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
:call plug#end()

lua require("telescope").load_extension "file_browser"

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
:set termguicolors

" coc.nvim configs
:set nobackup
:set nowritebackup
:set updatetime=300
:set shortmess+=c
:set signcolumn=number
:set clipboard=unnamedplus

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" :nmap <silent> [g <Plug>(coc-diagnostic-prev)
" :nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
" :nmap <silent> gd <Plug>(coc-definition)
" :nmap <silent> gy <Plug>(coc-type-definition)
" :nmap <silent> gi <Plug>(coc-implementation)
" :nmap <silent> gr <Plug>(coc-references)


" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
:nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
:xmap <leader>f  <Plug>(coc-format-selected)
:nmap <leader>f  <Plug>(coc-format-selected)

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use K to show documentation in preview window.
:nnoremap <silent> K :call ShowDocumentation()<CR>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

:nnoremap <leader>fp <cmd>Telescope git_files<cr>
:nnoremap <leader>ff <cmd>Telescope find_files<cr>
:nnoremap <leader>fg <cmd>Telescope live_grep<cr>
:nnoremap <leader>fb <cmd>Telescope buffers<cr>
:nnoremap <leader>fh <cmd>Telescope help_tags<cr>
