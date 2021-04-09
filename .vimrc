" Enable syntax highlighting
syntax on

" Need to set this also to see the current line number
set number
" Use relative line numbers
set relativenumber

" Do not create swapfiles
set noswapfile

set tabstop=3 softtabstop=3
set expandtab
set smartindent

" Do not wrap the line
set nowrap

" View a colored column at 80 chars
set colorcolumn=80
" Color of column
highlight ColorColumn ctermbg=0 guibg=lightgrey

filetype plugin indent on
filetype detect
autocmd FileType make set noexpandtab
