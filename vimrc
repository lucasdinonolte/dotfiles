set nocompatible              " be iMproved, required
set number

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Hide startup message
set shortmess=atI


" Hight 80th column
set textwidth=80

" Spaces instead of tabs
set tabstop=2
set shiftwidth=2
set expandtab

" However, in Git commit messages, let’s make it 72 characters
autocmd FileType gitcommit set textwidth=72

" Colour the 81st (or 73rd) column so that we don’t type over our limit
set colorcolumn=+1

" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51

" Enable mouse
if has("mouse_sgr")
	set ttymouse=sgr
elseif has("mouse_xterm")
	set ttymouse=xterm2
end

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" CTRLP
Plugin 'ctrlpvim/ctrlp.vim'
" Configure CTRLP
set wildignore+=tags,doc,tmp,log,.git,node_modules,deps

" Automatically parse the .gitignore
Plugin 'vim-scripts/gitignore'

" Additional Syntax Highlighting
Plugin 'posva/vim-vue'

Plugin 'w0rp/ale'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" Plugin ACK
Plugin 'mileszs/ack.vim'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

execute pathogen#infect()

" Be gone SWAP Files
set nobackup
set nowritebackup
set noswapfile

" Always show statusline
set laststatus=2

" General Linting Setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Set theme
syntax on
set background=dark
colorscheme solarized 

" Fix randomly stopping syntax highlighting
autocmd FileType vue syntax sync fromstart

" Shortcuts for switching windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Disable arrow keys for the sake of learning proper vim
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" OpenFrameworks make
let &makeprg = 'if [ -f Makefile ]; then make Release && make RunRelease; else make Release -C .. && make RunRelease -C ..; fi'
