set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'snipMate'
Plugin 'molokai'
Plugin 'AutoComplPop'
Plugin 'php.vim'
Plugin 'AutoClose'
Plugin 'taglist.vim'
Plugin 'The-NERD-tree'
Plugin 'nanotech/jellybeans.vim'
Plugin 'fatih/vim-go'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

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
set hlsearch
set cursorline

if ! has("gui_running") 
    set t_Co=256 
endif 

"colorscheme molokai
"let g:molokai_original = 1
"colorscheme lucius
"LuciusLight 
"colorscheme diablo3
colorscheme jellybeans

map <F2> :tabfirst<CR>
map <F3> :tabp<CR>
map <F4> :tabn<CR>
map <F5> :tablast<CR>
map <F6> :TlistToggle<CR>
map <F8> :NERDTreeToggle<CR>

au FileType php setlocal dict+=~/.vim/dict/php.dict
au FileType go setlocal dict+=~/.vim/dict/go.dict

if !exists('g:AutoComplPop_Behavior')
    let g:AutoComplPop_Behavior = {}
    let g:AutoComplPop_Behavior['php'] = []
    call add(g:AutoComplPop_Behavior['php'], {
        \   'command'   : "\<C-x>\<C-o>", 
        \   'pattern'   : printf('\(->\|::\|\$\)\k\{%d,}$', 0),
        \   'repeat'    : 0,
        \})
endif
