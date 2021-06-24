set expandtab
set cursorline
set number
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
" read cl file with cpp file syntax highlight
au BufReadPost *.cl set syntax=cpp
" press <F9> to mirror all NERDTree
nnoremap <F9> :tabdo NERDTreeMirror <CR>
" sessions
autocmd VimLeave * call StoreSession()


" Function definition
function StoreSession()
    :tabdo NERDTreeClose
    mksession! .leo.vim
endfunction
