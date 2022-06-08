call plug#begin('~/.vim/plugged')

" Always load
Plug 'ctrlpvim/ctrlp.vim'
" Configuration for CTRL-P
set wildignore+=tags,doc,tmp,log,.git,node_modules,deps

Plug 'vim-scripts/gitignore'
Plug 'honza/vim-snippets'
Plug 'szymonkaliski/muninn-vim'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim',                  { 'do': { -> coc#util#install() } }
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'ayu-theme/ayu-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
"
" Manually set languages for some file types
au BufRead,BufNewFile *.astro set filetype=html
au BufRead,BufNewFile *.mdx   set filetype=mdx syntax=javascript

let g:ale_fixers = { 'javascript': ['prettier'], 'css': ['prettier'], 'mdx': ['prettier'] }
let g:ale_fix_on_save = 1

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

set scrolloff=3
set cursorline
set numberwidth=4
set relativenumber
set ignorecase
set hlsearch
set signcolumn=yes
set splitbelow
set splitright

" German keyboard means SPACE as leaderkey
nnoremap <SPACE> <Nop>
let mapleader=" "

" Enable mouse
if has("mouse_sgr")
	set ttymouse=sgr
elseif has("mouse_xterm")
	set ttymouse=xterm2
end

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

" CTRLP Settings
let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" don't syntax highlight long lines
set synmaxcol=1024

" Force to rescan entire buffer when highlighting js, jsx or vue files
autocmd BufEnter *.{js,jsx,ts,tsx,vue} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx,vue} :syntax sync clear

" Shortcuts for switching windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shortcut for search and replace
nnoremap <C-S> :%s/

" Disable arrow keys for the sake of learning proper vim
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Processing Stuff
au BufRead,BufNewFile *.pde set filetype=java
:command P5 :! processing-java --sketch=$PWD --run
nnoremap <leader>rr :P5<cr>


" Memex Dreams
let g:muninn_path = expand('$WIKI_PATH/') " configure muninn wiki path, required!

function! s:open_today()
  " opens today daily log plus quickfix window with tasks

  call muninn#journal_today()
  call muninn#tasks_today()
endfunction

" commands
command! Tasks         call muninn#tasks_today()
command! Today         call <sid>open_today()

command! WikiJournal   call muninn#journal_today()
command! WikiInbox     call muninn#open('inbox')
command! WikiBacklinks call muninn#backlinks()
command! WikiUI        call muninn#open_ui()

command! -nargs=? -complete=custom,muninn#complete_open Wiki call muninn#open(<f-args>)

" maps
nnoremap <leader>wt :Tasks<cr>
nnoremap <leader>wj :WikiJournal<cr>
nnoremap <leader>wi :WikiInbox<cr>
nnoremap <leader>wb :WikiBacklinks<cr>
nnoremap <leader>wu :WikiUI<cr>

nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" bindings for working with tasks:
" - td - toggle to[d]o
" - tt - task for [t]oday
" - tm - task for to[m]orrow
" - tw - task is [w]aiting

augroup muninn_markdown
  autocmd!

  autocmd FileType markdown nnoremap <buffer> <leader>td :<c-u>call muninn#toggle_todo()<cr>
  autocmd FileType markdown nnoremap <buffer> <leader>tm :<c-u>call muninn#toggle_tag('due', '<c-r>=strftime('%Y-%m-%d', localtime() + 86400)<cr>')<cr>
  autocmd FileType markdown nnoremap <buffer> <leader>tt :<c-u>call muninn#toggle_tag('due', '<c-r>=strftime('%Y-%m-%d')<cr>')<cr>
  autocmd FileType markdown nnoremap <buffer> <leader>tw :<c-u>call muninn#toggle_tag('waiting', '')<cr>
augroup END
