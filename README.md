# VImrcGoodForYou

This is a .vimrc file which is good for you.
The dependency is list as below:

1. Vundle : 
please refer to this site [Vundle](https://github.com/VundleVim/Vundle.vim).
To install Vundle:
	1. Set up Vundle:
	```bash
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim	
	```
	2. Install:
	Launch VIM and run `:PluginInstall` 
> The Vundle manages the following dependency.
> Just run `:PluginInstall` and `BundleInstall`.
2. NERDTRree :

please refer to this site: [The NERDTree](https://github.com/preservim/nerdtree)
or Install it **manually**
```bash=1
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
```
3. NERDCommenter:
please refer to this site: [The NERDCommenter](https://github.com/preservim/nerdcommenter).
or Intall it **maually**
	1. Add Plugin 'preservim/nerdcommenter' to your vimrc file.
	2. Reload your vimrc or restart
	3. Run :BundleInstall
	4. After installation, make sure this line appears in your vimrc:
```vimrc
filetype plugin on
```


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
  
