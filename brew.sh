#!/bin/zsh

echo "Checking for homebrew..."
if ! $(which brew > /dev/null); then
	echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "Homebrew installed!"

echo "Installing taps..."
TAPS=(
    homebrew/cask-fonts
)
for tap in "${TAPS[@]}"
  do
    brew tap "$tap" || true
  done

echo "Installing cask apps..."
CASKS=(
  visual-studio-code
  brave-browser
  docker
  alfred
  rectangle
  obsidian
  font-hack-nerd-font
)
for app in "${CASKS[@]}"
  do
    brew install --cask "$app" || true
  done


echo "Installing packages..."
PACKAGES=(
  zsh
  python3
  vim
  cmake
)
brew install "${PACKAGES[@]}"

echo "Cleaning up brew..."
brew cleanup
brew analytics off

# Removes downloaded DMGs in cache
rm -rf $(brew --cache)

echo "Done!"
