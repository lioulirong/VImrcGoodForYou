set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set number
set smartindent
set ruler " show the cursor position all the time
set cursorcolumn

" playing tagbar
nmap <F1> :TagbarToggle<CR>

syntax on
colorscheme morning

" search
set hlsearch
set showmatch
set wildmode=longest,list
set matchpairs+=<:>

" status line
set laststatus=2
set statusline=%f\ %h%w%m%r\ %#warningmsg#%*%=%(%{getcwd()}\ %l,%c%V\ %=\ %P%)

" in case backspace not wotrking
set backspace=indent,eol,start

" read cl file with cpp file syntax highlight
au BufReadPost *.cl set syntax=cpp
au BufReadPost *.make set ft=make

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a " to disable: set mouse&
endif

"check if the OS is windows  
if has('win32')
    set guifont=consolas:h14 " increase font size
    set backspace=indent,eol,start " in case backspace doesn't work
    set guifont=consolas:h14 " increase font size
endif
" toggle line number and NERDTree
nnoremap <F8> : call ToggleLiNuAndNerdtree() <CR><CR>
"if filereadable(".leo.vim")
"   call inputsave()
"   if input("A closed session found, do you want to reload it?(y/n):")=="y"
"       source .leo.vim    
"   endif
"   call inputrestore()
"endif
" *****************NATIVE VIM END******************




"------------------NERDTree START-----------------
 "press <Tab> to open file/dir in new tab
let NERDTreeMapOpenInTab='<Tab>' "press <Tab> to open file/dir in new tab
"close NERDTree if it is the last window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" enable line numbers
let NERDTreeShowLineNumbers=1
" show hidden file in nerdtree
let NERDTreeShowHidden=1
" press <F9> to mirror all NERDTree
nnoremap <F9> :NERDTree <CR>
" sessions
"autocmd VimLeave * call StoreSession()
autocmd VimEnter * call RestoreSession()
" Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree
" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * silent NERDTreeMirror
" **************NERDTree END*********************


"------------------ Function definition--------------

command Mksession call StoreSession()

" function for storing session as file ,leo.vim
function StoreSession()
    :tabdo NERDTreeClose
    mksession! .leo.vim
    "call system("rm .leo.vim");
    echo "Session saved"
endfunction

" Restore previous session if .leo.vim is found
function RestoreSession()
    " on sourcing .leo.vim file, argc and argv will reset, so save them in
    " variables
    let foo=argv(0) 
    let argNum=argc()
    if filereadable(".leo.vim")
        if input("A stored session found, do you want to load it?(y/n):")=="y"
            source .leo.vim " on sourcing .leo.vim file, argc and argv will reset
        endif
        if (argNum>0)
            exe "tabnew" foo
        endif
    endif
    "call system("rm .leo.vim")
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

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif
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
