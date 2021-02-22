" vim:fdm=marker

" Compatibility {{{

" Don't try to be vi compatible
set nocompatible

" Encoding
set encoding=utf-8

" Allow modeline...just for .vimrc
set modelines=1

" Allow hidden buffers
set hidden

" }}} Compatibility

" Vundle Auto Install {{{

" Install Vundle if vundle is not installed - Git is required
let hasVundle=1
if !filereadable($HOME . "/.vim/bundle/Vundle.vim/README.md")
    echo "Installing Vundle..."
    echo ""
    silent execute "!mkdir -p " . $HOME . "/.vim/bundle"
    silent execute "!git clone " . "https://github.com/VundleVim/Vundle.vim " . $HOME . "/.vim/bundle/Vundle.vim"
    let hasVundle=0
endif

" }}} Vundle Auto Install

" Vundle Settings {{{

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" }}} Vundle Settings

" Vundle Plugins {{{

" Begin Plugins
call vundle#begin()

" Required that Vundle manages Vundle
Plugin 'VundleVim/Vundle.vim'

" Solarized theme (light or dark)
Plugin 'altercation/vim-colors-solarized'

" Easily jump around a file
Plugin 'easymotion/vim-easymotion'

" Easy surroundings
Plugin 'tpope/vim-surround'

" Easy commenting
Plugin 'tpope/vim-commentary'

" Better indenting
Plugin 'michaeljsmith/vim-indent-object'

" File tree/explorer
Plugin 'scrooloose/nerdtree'

" Select entire buffer
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'

" Airline Bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Start screen
Plugin 'mhinz/vim-startify'

" Secure modelines
Plugin 'securemodelines'

" Ends Plugins
call vundle#end()

" }}} Vundle Plugins

" Vundle Plugin Auto Install {{{

" Install plugins the first time vim runs
if hasVundle == 0
    echo "Installing plugins, please ignore key map error messages"
    :PluginInstall
endif

" }}} Vundle Plugins Auto Install

" Solarized Auto Install {{{

" Auto move solarized to colors
let hasSolarized=1
if !filereadable($HOME . "/.vim/colors/solarized.vim")
    echo "Installing Solarized...."
    echo ""
    silent execute "!mkdir -p " . $HOME . "/.vim/colors"
    silent execute "!mv -f " . $HOME . "/.vim/bundle/vim-colors-solarized/colors/solarized.vim " . $HOME . "/.vim/colors/"
    let hasSolarized=0
endif

" }}} Solarized Auto Install

" Filetype {{{

" Enable filetype plugins
filetype plugin on
filetype indent on

" }}} Filetype

" Path and File Completion {{{

" Include subfolders in path, and autocomplete in file search
set path+=** 
set wildmenu

" }}} Path and File Completion

" Code Folding {{{

" Add folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" }}} Code Folding

" Syntax and Display {{{

" Turn on syntax highlighting
syntax on

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1


" Show line numbers
set number
set relativenumber

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Color scheme (terminal)
set t_Co=256
set background=light
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
colorscheme solarized

" }}} Syntax and Display

" GVIM {{{

" Disable GUI Extras
set guioptions-=m  
set guioptions-=T  
set guioptions-=r  
set guioptions-=L

" }}} GVIM

" Searching {{{

nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" }}} Searching

" Tabs {{{

"Set tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intelligently dedent / indent new lines based on rules.

" }}} Tabs

" Keymaps {{{

" Set JJ to Esc
imap jj <Esc>

" Pick a leader key
let mapleader = " "
nnoremap <SPACE> <Nop>

" Quick save
noremap <Leader>w :w!<CR>

" Open Nerd Tree
nmap <leader>ne :NERDTreeFind<cr>

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Change folding keymap
nnoremap zC zM
nnoremap zO zR

" Quick quit
map <leader>q :q<CR>

" New buffer
nmap <leader>b :enew<CR>

" Close buffer
nmap <leader>z :bd<CR>

" Open vimrc
nmap <leader>ev :e $MYVIMRC<CR>

" Reload vimrc
nnoremap <leader>er :source $MYVIMRC<CR> :redraw!<CR>

" Turn off search highlight
nnoremap <leader>nn :set hlsearch!<CR>
nmap <silent> <C-n> :set hlsearch!<CR>

" New tab
nmap <leader>et :tabe<CR>

" Switch tab
nnoremap <C-Tab> :tabnext<CR>
nnoremap <leader>t :tabnext<CR>
nnoremap <leader>eq :tabclose<CR>

" Move between windows
map <leader>j <C-W>j<C-W>_
map <leader>k <C-W>k<C-W>_
map <leader>h <C-W>h<C-W>_
map <leader>l <C-W>l<C-W>_
map <leader>v <C-W>v<C-W>_
map <leader>h <C-W>h<C-W>_

" Auto insert braces
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>es :set list!<CR> " Toggle tabs and EOL

" Formatting
map <leader>gq gqip
" Cursor motion

" Match tags and use %
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Toggle relative numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <leader>r :call NumberToggle()<cr>

" Select all
" nmap <C-a> ggVG

" Copy to clipboard
" vmap <C-c> "+y<CR>

" Paste from clipboard
" nmap <C-v> "+gP<CR>

" Cut to clipboard
" vmap <C-x> "+x<CR>

" }}} Keymaps
