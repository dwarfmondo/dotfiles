#!/bin/sh

echo "Setting up your Mac..."

# install Homebrew
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

rm $HOME/.zshrc
cp $PWD/zshrc $HOME/.zshrc

# Make ZSH the default shell environment
chsh -s $(which zsh)

echo "All done!"
