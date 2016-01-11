# Set brew macvim to be the default
brew link --overwrite macvim

echo "creating vim directories"

mkdir -p ~/.vim/colors
mkdir ~/.vim/plugin

# setp up Vundle
mkdir ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $HOME/Dropbox/Github/dotfiles/.vim/snippets $HOME/.vim/snippets

# pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# compile ycm
brew install CMake
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer --system-libclang

# ctrlp.vim:
# 1. Clone the plugin into a separate directory:
cd ~/.vim
# 2.
git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim



# Switch to NeoVim
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

