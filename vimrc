set nocompatible              " be iMproved, required
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

" Enable syntax highlighting
syntax on

" Line numbers
set number

" Hight 80th column
set textwidth=80
set colorcolumn=+0

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
" Enable support for editorconfigs
Plugin 'editorconfig/editorconfig-vim'
" CTRLP
Plugin 'ctrlpvim/ctrlp.vim'
" Configure CTRLP
set wildignore+=tags,doc,tmp,log,.git,node_modules,deps

" Automatically parse the .gitignore
Plugin 'vim-scripts/gitignore'

" Syntax Linting
Plugin 'scrooloose/syntastic'
Plugin 'gcorne/vim-sass-lint'

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


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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

" Always show statusline
set laststatus=2

" File explorer
let g:NERDTreeChDirMode=2
let g:NERDTreeCascadeSingleChildDir=0
" These mappings would interfere with vim-tmux-navigator
let g:NERDTreeMapJumpNextSibling=''
let g:NERDTreeMapJumpPrevSibling=''
let g:NERDTreeMinimalUI=1

" General Linting Setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Setup SASS Linting
let g:syntastic_sass_checkers=["sasslint"]
let g:syntastic_scss_checkers=["sasslint"]

" Use general config file
let g:sass_lint_config = '~/.sass-lint.yml'

" Set theme
colorscheme github 

" Disable arrow keys for the sake of learning proper vim
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
