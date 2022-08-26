#!/bin/zsh
xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

cd `dirname $0`
brew bundle --file=../bundle/Brewfile
