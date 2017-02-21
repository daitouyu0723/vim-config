"switch bash shell
set shell=/bin/sh

set nocompatible              " be iMproved, required
set showmatch 
set cc=120
filetype off                  " required
 
if &t_Co > 1
    syntax enable
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'snipMate'
Plugin 'molokai'
Plugin 'jellybeans.vim'
Plugin 'php.vim'
Plugin 'AutoClose'
Plugin 'taglist.vim'
Plugin 'The-NERD-tree'
Plugin 'fatih/vim-go'
Plugin 'junegunn/vim-easy-align'
Plugin 'abolish.vim'
Plugin 'majutsushi/tagbar'
Plugin 'garyburd/go-explorer'
Plugin 'klen/python-mode'
Plugin 'Emmet.vim'
Plugin 'AutoComplPop'
Plugin 'minibufexpl.vim'

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


set nu " show line number
set ts=4 " set 4 space instead tab
set sw=4 " set shiftwidth
set expandtab
set autoindent
set cursorline
set spell
set hls is
set showtabline=0


colorscheme molokai
let g:molokai_original = 1
"colorscheme jellybeans

map <F6> :TlistToggle<CR>
nmap <F7> :TagbarToggle<CR>
map <F8> :NERDTreeToggle<CR>

let mapleader=";"
"delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d
"replace currently selected text with default register
"without yanking it
vnoremap <leader>p "_dP

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

if ! has("gui_running") 
    set t_Co=256 
endif 

let g:go_fmt_command = "goimports"

" miniBufExpl
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

" pman
autocmd FileType php setlocal keywordprg=pman
