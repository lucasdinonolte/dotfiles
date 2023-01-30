call plug#begin('~/.vim/plugged')

" Always load
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

set wildignore+=tags,doc,tmp,log,.git,node_modules,deps

Plug 'vim-scripts/gitignore'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim',                  { 'branch': 'release', 'do': { -> coc#util#install() } }
Plug 'itchyny/lightline.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'

" Manually set languages for some file types
au BufRead,BufNewFile *.astro set filetype=html
au BufRead,BufNewFile *.mdx   set filetype=mdx syntax=javascript

" COC Setup
let g:coc_global_extensions = [ 'coc-tsserver' ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Jumping around the code
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> K :call ShowDocumentation()<CR>

nnoremap <silent> <space>i :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>

nnoremap <silent> do <Plug>(coc-codeaction)
nnoremap <silent> rn <Plug>(coc-rename)

imap <C-l> <Plug>(coc-snippets-expand)

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" ==========================================================================

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Load based on filetype
Plug 'posva/vim-vue',                      { 'for': 'vue' }
Plug 'cespare/vim-toml',                   { 'for': 'toml' }
Plug 'elzr/vim-json',                      { 'for': 'json' }
Plug 'leafgarland/typescript-vim',         { 'for': [ 'typescript', 'typescript.tsx' ] }
Plug 'moll/vim-node',                      { 'for': 'javascript' }
" Plug 'neoclide/vim-jsx-improve',           { 'for': [ 'javascript', 'html' ] }
Plug 'othree/html5.vim',                   { 'for': 'html' }
Plug 'plasticboy/vim-markdown',            { 'for': 'markdown' }
Plug 'sophacles/vim-processing',           { 'for': 'processing' }
Plug 'evanleck/vim-svelte',                { 'for': 'svelte' }
" Plug 'tasn/vim-tsx',                       { 'for': 'typescript.tsx' }

call plug#end()

set nocompatible              " be iMproved, required
set number
set shortmess=atI

" Highlight 80th column
set textwidth=80

" However, in Git commit messages, let’s make it 72 characters
autocmd FileType gitcommit set textwidth=72

" Colour the 81st (or 73rd) column so that we don’t type over our limit
set colorcolumn=+1

" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51


" encoding
set encoding=utf-8
set fileencodings=utf-8

" yank and paste with system clipboard
set clipboard=unnamed

" watch for file changes
set autoread

" don't beep
" no bells
set noeb vb t_vb=
set belloff=all
set noerrorbells

" command window height
set cmdwinheight=3

" Spaces instead of tabs
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set shiftround
set autoindent
set smartindent
set cindent
set breakindent

set scrolloff=8
set guicursor=" "
set numberwidth=4
set relativenumber
set ignorecase
set incsearch
set signcolumn=yes
set splitbelow
set splitright
set spell

" German keyboard means SPACE as leaderkey
nnoremap <SPACE> <Nop>
let mapleader=" "

" File Explorer Stuff
nnoremap <C-n> :Lexplore<CR> :vertical resize 30<CR>

" Terminal
nnoremap <leader>t :sp<CR> :term<CR> :resize 20N<CR> i

" Be gone SWAP Files
set nobackup
set nowritebackup
set noswapfile

" Always show statusline
set laststatus=2

" General Linting Setup
set statusline+=%#warningmsg#
set statusline+=%*

" always display tabline
set showtabline=1

" Set theme
syntax enable
set background=dark
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" don't syntax highlight long lines
set synmaxcol=1024

" Force to rescan entire buffer when highlighting js, jsx or vue files
autocmd BufEnter *.{js,jsx,ts,tsx,vue} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx,vue} :syntax sync clear

" Shortcut for spellchecking
nnoremap <leader>ss :setlocal spell!<CR>

" Shortcuts for switching windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Move blocks around in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

" Shortcut for search and replace
nnoremap <C-S> :%s/
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Telescope things
nnoremap <C-P> <cmd>Telescope git_files<cr>
nnoremap <leader>pf <cmd>Telescope find_files<cr>
nnoremap <C-F> <cmd>Telescope live_grep<cr>

" Shortcut to go into command line mode
nnoremap <C-r> :!

" Disable arrow keys for the sake of learning proper vim
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Processing Stuff
au BufRead,BufNewFile *.pde set filetype=java
:command P5 :! processing-java --sketch=$PWD --run
nnoremap <leader>rr :P5<cr>

