color molokai

" do not wrap lines
set nowrap

" stay at the current indentation level on new lines
set autoindent

" don't worry about case when searching, unless a cap is used
set ignorecase
set smartcase

" don't use the mouse
set mouse-=a

" make sure backspace works as expected
set bs=2

" tabs and indents are 4 spaces rather than one 8-wide tab
set tabstop=4
set shiftwidth=4
set expandtab

" we can delete tabs in one swoop at the beginning of a line
set smarttab

" bash-style file autocomplete
set wildmenu
set wildmode=list:longest

" spellcheck
map <F10> <Esc>:setlocal spell! spelllang=en_us<CR>
map <F11> <Esc>:setlocal nospell<CR>

nnoremap <silent> <C-l> :nohl<CR><C-l>
au FileType * setl fo-=cro

" recommendations from http://items.sjbach.com/319/configuring-vim-right
" remember marks and undo history for hidden buffers
set hidden

" leader is usually
let mapleader = ","

" remember lots of ex commands and search patterns
set history=1000

" set the term title to the file name
set title

" give more context around the cursor when scrolling
set scrolloff=3

" display line number and position % in the lower right
set ruler

" just incase the /etc/vimrc file doesn't have these set
syntax on
filetype on
filetype plugin on
filetype indent on

" highlighting when searching
set hlsearch

" remove highlighting with ,n
nmap <silent> <leader>n :silent :nohlsearch<CR>
