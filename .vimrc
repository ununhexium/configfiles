execute pathogen#infect()

set tabstop=4
set hlsearch
set number relativenumber
set autoindent
set smartindent

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


