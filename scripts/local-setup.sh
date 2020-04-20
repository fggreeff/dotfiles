#!/usr/bin/env bash

echo "Starting..."

# setup homebrew
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# update homebrew
echo "Updating homebrew..."
brew update

echo "Installing cask..."
if ! brew info cask &>/dev/null; then
    brew install caskroom/cask/brew-cask
fi

CASKS=(
    google-chrome
    iterm2
    github
    slack
    spectacle
    flux
    evernote
    docker
)

echo "Installing cask apps..."
echo "This might take a while please wait"
for i in "${CASKS[@]}"; do
    echo "Installing $i"
    if brew cask ls --versions $i >/dev/null; then
        brew cask upgrade $i
    else
        brew cask install $i
    fi
done

echo "Cleaning up..."
brew cleanup

echo "Complete!"
