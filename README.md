# VImrcGoodForYou
This is a .vimrc file which is good for you.

### Installation:

#### Linux
1. make
    ```bash
        make
    ```
2. done
3.Possible extra work:
	Build Universal ctags yourself.
    
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
4. Universal ctags
To build it from source: https://docs.ctags.io/en/latest/autotools.html

Everything is done. Enjoy yourself!

### Features/Plugin
Don't forget to leverage the power of plugin

#### Plugins
* NerdComment
* NerdTree
* Ack: grep-like package

#### Feature

1. Press F9 to toggle on NERDTree
2. Press F8 to toggle line numbering
3. Save and restore session (.leo.vim) with `:Mksession`
4. Show number on each tab (tabnew)
5. Press F1 to toggle tagbar

