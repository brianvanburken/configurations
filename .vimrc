call plug#begin()
" Language
Plug 'elixir-lang/vim-elixir',  { 'for': ['erlang', 'elixir', 'eelixir'] }
Plug 'elmcast/elm-vim',         { 'for': ['elm'] }
Plug 'othree/html5.vim',        { 'for': ['html', 'eelixir'] }
Plug 'pangloss/vim-javascript', { 'for': ['html', 'eelixir', 'javascript'] }
Plug 'mxw/vim-jsx',             { 'for': ['javascript'] }

" Code display
Plug 'ayu-theme/ayu-vim'
Plug 'Yggdroot/indentLine'

" Integrations
Plug 'editorconfig/editorconfig-vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-commentary'

" Interface
Plug 'ctrlpvim/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPTag'] }
Plug 'itchyny/lightline.vim'

" Commands
Plug 'tpope/vim-surround'

call plug#end()

" ---------- SYSTEM
set clipboard=unnamed              " Share Clipboard with OS
set colorcolumn=80                 " Show column on 80 character for limit reference
set encoding=utf-8 nobomb          " Set default encoding to UTF-8
set expandtab                      " Use spaces not tabs
set hlsearch                       " highlight matches
set incsearch                      " search as characters are entered
set laststatus=2                   " Always enable status line
set list                           " Always display whitespace
set listchars=tab:»·,trail:·,eol:¬,nbsp:_ " Display extra whitespace
set nobackup
set noswapfile
set nowritebackup
set number                         " Show line numers
set numberwidth=2                  " Line numbers max to two digits
set shiftwidth=2                   " An autoindent (with <<) is two space
set showcmd                        " Show typed command in bottom bar
set showmatch                      " highlight matching [{()}]
set softtabstop=2                  " Number of spaces in tab when editing
set tabstop=2                      " A tab is two space
set termencoding=utf-8             " Set encoding to UTF-8
set termguicolors
set ttyfast

" ---------- OTHER
" Highlight trailing whitespace
match ErrorMsg /\\\@<![\u3000[:space:]]\+$/

filetype indent on " Load filetype-specific indent files

let ayucolor="dark"
silent! colorscheme ayu

" Disable netrw and vimball plugins
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_vimballPlugin = 1
let html_no_rendering = 1 " Don't render italic, bold, links in HTML

let g:jsx_ext_required = 0

let g:elm_format_autosave = 1

let g:ctrlp_jump_to_buffer = 2         " Jump to tab AND buffer if already open
let g:ctrlp_match_window_bottom = 1    " Show at bottom of window
let g:ctrlp_max_files = 0              " no restriction on results/file list
let g:ctrlp_max_height = 10            " restrict match list to a maxheight of 40
let g:ctrlp_mru_files = 1              " Enable Most Recently Used files feature
let g:ctrlp_open_multiple_files = 'vr' " opens multiple selections in vertical splits to the right
let g:ctrlp_open_new_file = 'v'        " open selections in a vertical split
let g:ctrlp_split_window = 0

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>o :CtrlP ./<CR>

" Treat .json files as JavaScript (Vim hides quotes for JSON files)
au! BufNewFile,BufFilePre,BufRead *.json setlocal filetype=javascript
" Treat .md files as Markdown
au! BufNewFile,BufFilePre,BufRead *.md setlocal filetype=markdown
