execute pathogen#infect()

filetype on
filetype plugin on
set hidden
set history=100

" Enable syntax highlighting
syntax on

colorscheme molokai

let g:lightline = {
      \ 'colorscheme': 'default',
      \ }

set guifont=Menlo\ Regular:h18

" Enable UTF-8 encoding
set encoding=utf-8

" remap <leader> to ',' key
let mapleader = ","

" easy handling of split windows
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Open and source vimrc easily
nnoremap <leader>c :e ~/.vimrc<CR>
nnoremap <leader>s :source ~/.vimrc<CR>

" Number of spaces for tabs
set tabstop=2
" Number of spaces for each step of autoindent
set shiftwidth=2
" Expand tabs to spaces
set expandtab
" Do smart autoindenting
set smartindent
" Copy indentation of current line when starting a new line
set autoindent

autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType sh setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType vim setlocal shiftwidth=2 tabstop=2

" Enable highlighting search results
set hlsearch
set incsearch

"Show Matching Parenthesis
set showmatch

" Ignore case in search patterns
set ignorecase
set smartcase
nnoremap <leader><space> :noh<cr>

" Highlight trailing whitespaces
highlight Error ctermbg=red ctermfg=white guibg=red guifg=white
autocmd ColorScheme * highlight Error ctermbg=red ctermfg=white guibg=red guifg=white
match Error '\s\+$'
autocmd WinEnter,BufWinEnter * match Error /\s\+$/
autocmd InsertEnter * match Error /\s\+\%#\@<!$/
autocmd InsertLeave * match Error /\s\+$/
autocmd WinLeave,BufWinLeave * match Error //

" strip all trailing whitespace in the current file with <leader>W
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" F2: Toggle paste mode to avoid screwing indentation
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set scrolloff=5

" Allow command completion
set wildmode=longest,list,full
set wildmenu

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" <CR> highlights all occurences of the current word without moving
nnoremap <CR> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Re-Open Previously Opened File
nnoremap <Leader><Leader> :e#<CR>

" reindex everything by <leader>+r - plugin command-T
nnoremap <Leader>r :CommandTFlush<CR>
nnoremap <Leader>b ::CtrlPBuffer<CR>

" NERDTree
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
nmap <leader>. :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.git', '\.sass-cache', '\.swp']
if has("gui_macvim")
  autocmd VimEnter * NERDTree
  autocmd VimEnter * wincmd p
endif

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
