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
Plugin 'AutoComplPop'
Plugin 'php.vim'
Plugin 'AutoClose'
Plugin 'taglist.vim'
Plugin 'The-NERD-tree'
Plugin 'fatih/vim-go'
Plugin 'junegunn/vim-easy-align'
Plugin 'abolish.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'SyntaxMotion.vim'

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


"colorscheme molokai
"let g:molokai_original = 1
"colorscheme lucius
"LuciusLight 
"orscheme diablo3
colorscheme jellybeans
"colorscheme hybrid

map <F6> :TlistToggle<CR>
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

if !exists('g:AutoComplPop_Behavior')
    let g:AutoComplPop_Behavior = {}
    let g:AutoComplPop_Behavior['php'] = []
    call add(g:AutoComplPop_Behavior['php'], {
        \   'command'   : "\<C-x>\<C-o>", 
        \   'pattern'   : printf('\(->\|::\|\$\)\k\{%d,}$', 0),
        \   'repeat'    : 0,
        \})
endif

if ! has("gui_running") 
    set t_Co=256 
endif 

"tab number
set tabline=%!TabLine()  " custom tab pages line
function TabLine()
    let s = '' " complete tabline goes here
    " loop through each tab page
    for t in range(tabpagenr('$'))
        " set highlight
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " set the tab page number (for mouse clicks)
        let s .= '%' . (t + 1) . 'T'
        let s .= ' '
        " set page number string
        let s .= t + 1 . ' '
        " get buffer names and statuses
        let n = ''      "temp string for buffer names while we loop and check buftype
        let m = 0       " &modified counter
        let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
        " loop through each buffer in a tab
        for b in tabpagebuflist(t + 1)
            " buffer types: quickfix gets a [Q], help gets [H]{base fname}
            " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
            if getbufvar( b, "&buftype" ) == 'help'
                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
            elseif getbufvar( b, "&buftype" ) == 'quickfix'
                let n .= '[Q]'
            else
                let n .= pathshorten(bufname(b))
            endif
            " check and ++ tab's &modified count
            if getbufvar( b, "&modified" )
                let m += 1
            endif
            " no final ' ' added...formatting looks better done later
            if bc > 1
                let n .= ' '
            endif
            let bc -= 1
        endfor
        " add modified label [n+] where n pages in tab are modified
        if m > 0
            let s .= '[' . m . '+]'
        endif
        " select the highlighting for the buffer names
        " my default highlighting only underlines the active tab
        " buffer names.
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " add buffer names
        if n == ''
            let s.= '[New]'
        else
            let s .= n
        endif
        " switch to no underlining and add final space to buffer list
        let s .= ' '
    endfor
    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'
    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        let s .= '%=%#TabLineFill#X'
    endif
    return s
endfunction
syntax on
au BufRead,BufNewFile *.go set filetype=go
colorscheme molokai
let g:go_fmt_command = "goimports"
let g:vim_markdown_folding_disabled = 1
