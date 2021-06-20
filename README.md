# VImrcGoodForYou

This is a .vimrc file which is good for you.
The dependency is list as below:

1. NERDTRree :

please refer to this site: [The NERDTree](https://github.com/preservim/nerdtree)
or you can just "install" NERDTree with the following command
```bash=1
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
```
2. no more dependency

Everything is done. Enjoy yourself!

### Features
1. Open NERDTree when VIM is entered
2. Mirror NERDTree when new buffer entered
3. Press F9 to mirror NERDTree to all buffer(tab)
4. Auto save session as .leo.vim after leaving VIM

Hint
  Restore session using 
```bash
  vim -S .leo.vim
```
  
