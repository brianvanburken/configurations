call plug#begin()
Plug 'andys8/vim-elm-syntax'
Plug 'ayu-theme/ayu-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
call plug#end()

filetype plugin indent on " Load filetype-specific indent files
syntax on

set background=dark
set backspace=indent,eol,start
set clipboard=unnamed " Share Clipboard with OS
set cmdheight=2 " Better display for messages
set hidden " Hide buffers instead of closing them
set hlsearch " highlight matches
set incsearch " search as characters are entered
set iskeyword-=_ " Enable word movement when word contains _
set laststatus=2 " Always enable status line
set lazyredraw
set list " Always display whitespace
set listchars=tab:»·,trail:·,eol:¬,nbsp:_ " Display extra whitespace
set nobackup
set nocompatible
set noswapfile
set nowrap " Don't wrap lines
set nowritebackup
set number " Show line numbers
set numberwidth=3 " Line numbers max digits
set scrolloff=5 " Show lines below current line at all times while scrolling
set showcmd " Show typed command in bottom bar
set signcolumn=yes
set smarttab " Insert tabs on the start of a line according to shiftwidth
set termguicolors
set ttimeoutlen=100
set ttyfast

set statusline=%t " Tail of the filename
set statusline+=%m " Modified flag
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}] " File encoding/format
set statusline+=%h " Help file flag
set statusline+=%r " Read only flag
set statusline+=%y " Filetype
set statusline+=%= " Left/right separator
set statusline+=%l/%L: " Cursor line/total lines
set statusline+=%c " Cursor column

nnoremap <Leader>a :Ag<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>t :Tags<CR>

nnoremap <Leader>d :Dash<CR>

nnoremap <Leader>r :Rename<Space>

au BufRead,BufNewFile .envrc setlocal filetype=sh
au BufRead,BufNewFile *.md setlocal filetype=markdown
au BufRead,BufNewFile *.ts setlocal filetype=typescript
au BufRead,BufNewFile *.tsx setlocal filetype=typescript.tsx

au BufWritePre * :%s/\s\+$//e " Remove whitespace before writing buffer

let g:ayucolor="dark"
colorscheme ayu

" Set background color to none
hi Normal ctermbg=NONE guibg=NONE
