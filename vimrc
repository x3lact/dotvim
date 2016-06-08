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

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

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
nnoremap <Leader>b ::CtrlPBuffer<CR>

" NERDTree
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let g:NERDTreeWinSize = 35
nmap <leader>. :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.git', '\.sass-cache', '\.swp']
if has("gui_macvim")
  autocmd VimEnter * NERDTree
  autocmd VimEnter * wincmd p
endif
let g:NERDTreeBookmarksFile = '/home/ecefjmo/.vim/.nerdtreebookmarks'
"Open NERDTree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
let g:SimpylFold_docstring_preview = 1
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

set ttimeoutlen=50
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" F3: Toggle list (display unprintable characters).
nnoremap <F3> :set list!<CR>

set swapfile
set dir=$HOME/.vimswap


" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

map + <c-w>>
map - <c-w><
