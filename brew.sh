#!/bin/zsh

echo "Installing xcode-select command line tools..."
xcode-select --install

echo "Checking for homebrew..."
if ! $(which brew > /dev/null); then
	echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "Homebrew installed!"

echo "Installing cask apps..."
CASKS=(
	visual-studio-code
    brave-browser
	docker
    alfred
    rectangle
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
)
brew install "${PACKAGES[@]}"

echo "Cleaning up brew..."
brew cleanup

# Removes downloaded DMGs in cache
rm -rf $(brew --cache)

echo "Done!"