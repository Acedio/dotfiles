set nocompatible
filetype off

let g:loaded_youcompleteme = 1

" Set up the rtp for Vundle and make sure that .vim is added for Windows.
set rtp+=~/.vim,~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Bundles
Plugin 'PProvost/vim-ps1'
Plugin 'anzaika/go.vim'
Plugin 'ciaranm/inkpot'
Plugin 'glsl.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'jpalardy/vim-slime'
Plugin 'nanotech/jellybeans.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/Wombat'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

" fzf plugin location
set rtp+=~/.fzf

" leader is usually \, changing to a non-pinky option
let mapleader = ","

if filereadable(expand('~/.vimrc_local'))
  " Work only
  source ~/.vimrc_local
else
  " Non-work only
  Plugin 'Valloric/YouCompleteMe'
  let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

  " clang-format C/C++ code
  noremap <leader>f :pyf /usr/share/clang/clang-format.py<CR>
endif

nnoremap <C-P> :FZF<CR>

autocmd! BufNewFile,BufRead *.ino setlocal ft=cpp

" Google style indenting
autocmd FileType c,cpp setlocal cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4
autocmd FileType c,cpp setlocal textwidth=80
autocmd FileType c,cpp setlocal formatoptions+=t

" Color the column on col=textwidth
set colorcolumn=+0

syntax on
set background=dark

let g:rehash256 = 1
color molokai

" Fix lame diff highlighting
hi DiffText term=reverse cterm=bold ctermbg=22

" do not wrap lines
set nowrap

" unicode
set encoding=utf-8

" stay at the current indentation level on new lines
set autoindent

" set a reasonable default textwidth
set textwidth=80

" use the mouse
set mouse=a

" make sure backspace works as expected
set bs=2

" tabs and indents are 2 spaces rather than one 8-wide tab
set tabstop=2
set shiftwidth=2
set expandtab

" we can delete tabs in one swoop at the beginning of a line
set smarttab

" only a single space after a period when joining lines
set nojoinspaces

" bash-style file autocomplete
set wildmenu
set wildmode=list:longest

" spellcheck
map <F10> <Esc>:setlocal spell! spelllang=en_us<CR>
map <F11> <Esc>:setlocal nospell<CR>

" recommendations from http://items.sjbach.com/319/configuring-vim-right
" remember marks and undo history for hidden buffers
set hidden

" remember lots of ex commands and search patterns
set history=1000

" set the term title to the file name
set title

" give more context around the cursor when scrolling
set scrolloff=3

" display line number and position % in the lower right
set ruler

" highlighting when searching
set hlsearch

" remove highlighting with ,n
nmap <silent> <leader>n :silent :nohlsearch<CR>

" statusline
set laststatus=2
set statusline=
set statusline +=\ [%n]\    "buffer number
set statusline +=%<%F       "full path
set statusline +=%m         "modified flag
set statusline +=%=%l\,     "current line
set statusline +=%c\        "column number
set statusline +=\ %P       " % through the file

" show command building on the status line
set showcmd

" show relative numbers for vertical movement
set relativenumber

" show non-printing characters in <xx> format rather than ^X
set display=uhex

" don't automatically go to the start of the line when using ^D et. al.
set nosol

" don't copy to X copy buffer immediately on visual select
set clipboard=

" jump between and highlight < angle brackets >
set mps+=<:>

" vim-slime should use tmux
let g:slime_target = "tmux"
" fix for unresponsive vim with tmux 2.2
let g:slime_paste_file = "$HOME/.slime_paste"

" GLSL filetype
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl set filetype=glsl

" Insert multiple lines
function! OpenLines(nrlines, dir)
    call append(line('.')+a:dir, repeat([''], a:nrlines))
    if a:dir < 0
        execute "normal " . a:nrlines . "k"
    else
        execute "normal " . a:nrlines . "j"
    endif
endfunction

nnoremap <Leader>o :<C-u>call OpenLines(v:count1, 0)<CR>S
nnoremap <Leader>O :<C-u>call OpenLines(v:count1, -1)<CR>S

function! DoXmlLint() range
    silent execute a:firstline . "," . a:lastline . '!xmllint --format -'
endfunction

command! XmlLint %call DoXmlLint()
