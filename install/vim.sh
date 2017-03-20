# Set brew macvim to be the default
brew link --overwrite macvim

# Neovim with Python
brew install python
brew install python3
pip2 install neovim --upgrade
pip3 install neovim --upgrade

# brew tap neovim/homebrew-neovim
# brew install --HEAD neovim

brew install neovim/neovim/neovim

ln -s /Users/hahn/Development/Github/dotfiles/.vimrc  ~/.config/nvim/init.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# install vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir -p ~/.vim/colors
mkdir ~/.vim/plugin

echo "Run :NeoBundleInstall in vim"

ln -s $HOME/Dropbox/Github/dotfiles/.vim/snippets $HOME/.vim/snippets

# ctrlp.vim:
# 1. Clone the plugin into a separate directory:
cd ~/.vim
# 2.
git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim

# # Switch to NeoVim
# mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
# ln -s ~/.vim $XDG_CONFIG_HOME/nvim
# ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

cp -avR ~/.vim/ ~/.config/nvim
