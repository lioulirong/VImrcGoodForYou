# VImrcGoodForYou
This is a .vimrc file which is good for you.

### Installation:

#### Linux

1. copy `.vimrc` to `~/`

2. Set up Vundle:
    ```bash
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim	
    ```
    
3. Install:
    Launch VIM and run `:PluginInstall` or `:BundleInstall`

#### Windows (gVIM)

1.  copy `.vimrc` to `C:/Users/<username>/.vimrc`

2. Ser up Vundle:

   ```bash
   git clone https://github.com/VundleVim/Vundle.vim.git C:/Users/<username>/.vim/bundle/Vundle.vim
   ```
3. Install:
      Launch VIM and run `:PluginInstall` or `:BundleInstall`

### Dependency

**In case steps in Installation doesn't work, you can install every dependency manually.**

1. Vundle : 
    please refer to this site [Vundle](https://github.com/VundleVim/Vundle.vim).
    To install Vundle:

  1. Set up Vundle:
  ```bash
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim	
  ```
  2. Install:

    Launch VIM and run `:PluginInstall` 

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

####Costumized feature

1. Press F9 to open NERDTree
2. Press F9 to toggle line number display and NERDTree
3. Auto save session as .leo.vim after leaving VIM

#### Plugins

1. NERDTree
2. NERDComment
3. Ack

Hint
  Restore session using 
```bash
  vim -S .leo.vim
```

or in VIM

```vimrc
:source .leo.vim
```

