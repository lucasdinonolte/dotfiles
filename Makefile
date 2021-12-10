install: install-bundle install-zsh install-rcs install-vim-plugins

install-brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap Homebrew/bundle

install-bundle:
	brew update
	brew bundle

install-zsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

install-rcs:
	rcup -v -i rcrc
	rcup -v -i

install-vim-plugins:
	exec vim +PlugInstall +qall < /dev/tty "$@"
