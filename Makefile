Vundle=~/.vim/bundle/Vundle.vim
ACK=/usr/bin/ack-grep

default: $(Vundle) $(ACK)
	vim +PluginInstall +qall
	cp .vimrc ~/.vimrc
$(Vundle):
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$(ACK):
	apt-get install ack-grep
	
