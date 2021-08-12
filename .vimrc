" ----------------------VUNDLE MANAGEMENT START HERE--------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" install NERDTree
Plugin 'preservim/nerdtree'
" install NERDCommentor
Plugin 'preservim/nerdcommenter'
" install ack.vim (search tool for vim)
Plugin 'mileszs/ack.vim'
" tagbar
Plugin 'preservim/tagbar'
" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
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
" ***************VUNDLE END HERE*****************************

"----------------NATIVE VIM START----------------------
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set number
"set cursorcolumn
set smartindent
" read cl file with cpp file syntax highlight
au BufReadPost *.cl set syntax=cpp
" change VIM's default background
colorscheme industry 
"check if the OS is windows  
if has('win32')
    set guifont=consolas:h14 " increase font size
    syntax on
    set backspace=indent,eol,start " in case backspace doesn't work
    set guifont=consolas:h14 " increase font size
endif
" toggle line number and NERDTree
nnoremap <F8> : call ToggleLiNuAndNerdtree() <CR><CR>
" *****************NATIVE VIM END******************


"------------------NERDTree START-----------------
 "press <Tab> to open file/dir in new tab
let NERDTreeMapOpenInTab='<Tab>' "press <Tab> to open file/dir in new tab
"close NERDTree if it is the last window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" enable line numbers
let NERDTreeShowLineNumbers=1
" press <F9> to mirror all NERDTree
nnoremap <F9> :NERDTree <CR>
" sessions
autocmd VimLeave * call StoreSession()

" Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree
" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * silent NERDTreeMirror
" **************NERDTree END*********************


"------------------ Function definition--------------

" function for storing session as file ,leo.vim
function StoreSession()
    :tabdo NERDTreeClose
    mksession! .leo.vim
endfunction

" function for toggle line number and nerdtree
function ToggleLiNuAndNerdtree()
    if &number
        let &nu=0
    else 
        let &nu=1
    endif 
    if g:NERDTree.IsOpen()
        exec "NERDTreeClose"
    endif
endfunction
