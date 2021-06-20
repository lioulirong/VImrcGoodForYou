set number
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
"set cursorcolumn
set smartindent
 "press <Tab> to open file/dir in new tab
let NERDTreeMapOpenInTab='<Tab>' "press <Tab> to open file/dir in new tab
"close NERDTree if it is the last window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror
" enable line numbers
let NERDTreeShowLineNumbers=1
au BufReadPost *.cl set syntax=cpp
