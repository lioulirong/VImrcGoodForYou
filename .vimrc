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
autocmd VimLeave * call StoreSession()
autocmd VimEnter * call RestoreSession()
" Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree
" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * silent NERDTreeMirror
" **************NERDTree END*********************


"------------------ Function definition--------------

" function for storing session as file ,leo.vim
function StoreSession()
    if (input("Save session?(y/n):")=="y")        
        :tabdo NERDTreeClose
        mksession! .leo.vim
    else
        if (filereadable(".leo.vim"))
            call system("rm .leo.vim");
    endif
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
