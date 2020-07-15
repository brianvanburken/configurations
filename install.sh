fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@"
}

fancy_echo "Creating local directories"
mkdir -p ~/Developer/personal
mkdir -p ~/.shell/
mkdir -p ~/.config/

fancy_echo "Creating local files"
touch ~/.gitconfig.local
touch ~/.hushlogin

fancy_echo "Cloning git repository for dotfiles"
DOT_DIR=~/Developer/personal/dotfiles
if [ ! -d $DOT_DIR ]; then
    fancy_echo "Cloning dotfiles"
    git clone https://github.com/brianvanburken/dotfiles.git $DOT_DIR
else
    fancy_echo "Dotfiles already present"
fi

fancy_echo "Navigating to $DOT_DIR"
cd $DOT_DIR
git remote remove origin
git remote add origin git@github.com:brianvanburken/dotfiles.git
git pull

# Install homebrew if not exists
which -s brew
if [[ $? != 0 ]] ; then
	fancy_echo "Installing Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	fancy_echo "Homebrew is installed"
else
	fancy_echo "Homebrew already installed"
fi

fancy_echo "Installing Homebrew packages"
brew doctor
brew update
brew bundle

PLUG_DIR=$XDG_DATA_HOME:-$HOME/.local/share
if [ ! -d $PLUG_DIR ]; then
    fancy_echo "Installing vim plugins"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    nvim +PlugInstall +qall
else
    fancy_echo "Updating vim plugins"
    nvim +PlugUpdate +qall
fi

fancy_echo "Linking dotfiles in $HOME to $DOT_DIR"
files=(
"agignore"
"aliases"
"asdfrc"
"bundle"
"config/nvim"
"default-gems"
"default-npm-packages"
"default-python-packages"
"editorconfig"
"gemrc"
"gitattributes"
"gitconfig"
"gitignore"
"ideavimrc"
"tmux.conf"
"tool-versions"
"zsh_functions"
"zshrc"
)

for x in "${files[@]}"; do
	fancy_echo "Linking $x"
	rm -rf $HOME/.$x
	ln -s $DOT_DIR/$x $HOME/.$x
done

fancy_echo "Adding asdf plugins"
asdf plugin-add ruby
asdf plugin-add nodejs
asdf plugin-add elm
asdf plugin-add erlang
asdf plugin-add elixir
asdf plugin-add python
asdf plugin-add haskell
asdf plugin-add java
asdf plugin-add kotlin

fancy_echo "Installing asdf versions"
cd ~
asdf install
cd -

fancy_echo "Done running script"
