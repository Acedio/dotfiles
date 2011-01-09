color desert
syntax on
set nowrap
set autoindent
set cindent
set ignorecase
set smartcase
set mouse-=a
set tabstop=4
set expandtab
map <F10> <Esc>:setlocal spell! spelllang=en_us<CR>
map <F11> <Esc>:setlocal nospell<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
au FileType * setl fo-=cro
