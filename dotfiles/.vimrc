:call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
:call plug#end()

:let g:airline_powerline_fonts=1
:let g:netrw_banner = 0
:let NERDTreeShowHidden=1

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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
:nmap <silent> [g <Plug>(coc-diagnostic-prev)
:nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
:nmap <silent> gd <Plug>(coc-definition)
:nmap <silent> gy <Plug>(coc-type-definition)
:nmap <silent> gi <Plug>(coc-implementation)
:nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
:nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
:nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
:xmap <leader>f  <Plug>(coc-format-selected)
:nmap <leader>f  <Plug>(coc-format-selected)

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

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Close tab if NERDTree is the only buffer.
autocmd BufEnter * if tabpagenr('$') > 1 && !len(filter(tabpagebuflist(), 'getbufvar(v:val,"&ft") != "nerdtree"')) | tabclose | endif

function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

:nnoremap <silent> <C-g>g :call FZFOpen(':Ag')<CR>
:nnoremap <silent> <C-g>c :call FZFOpen(':Commands')<CR>
:nnoremap <silent> <C-g>l :call FZFOpen(':BLines')<CR>
:nnoremap <silent> <C-p> :call FZFOpen(':GFiles')<CR>
