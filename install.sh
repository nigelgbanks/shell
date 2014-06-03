#!/bin/bash

# Directory of this bash script.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -h "~/.bash_profile" ]; then
    echo 'testing'
fi

# Creates a link between the home directory and the given file / folder.
function create_link()
{
    DEST="${HOME}/.${1}"
    if [ -h $DEST ]; then # Symbolic Link
        rm $DEST
    elif [ -f $DEST -o -d $DEST ]; then # Existing File
        cp -rn $DEST{,.`date +%Y%m%d-%H%M%S`.bak}
        rm -r $DEST
    fi
    ln -s "${DIR}/${1}" $DEST
}

# Create Symlinks to files and folders.
echo "Creating symbolic links to top level files and folders"
FILES=(bash bash_logout bash_profile bashrc ghc Profile sh shell zlogin zsh zshenv zshrc)
for file in "${FILES[@]}"
do
    create_link $file
done

# Install Git
function install_git() {
    echo "Download git-completion scripts."
    curl -o $HOME/.git-completion.bash "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"
    if ! hash git 2>/dev/null; then
        echo "Todo add code for installing git."
    fi
}

# Install zsh
function install_zsh() {
    echo "Todo Add code for install zsh."
    if [ -d $HOME/.oh-my-zsh]; then
        echo "OH MY ZSH, is already installed."
    else
        echo "Installing OH MY ZSH."
        if ! hash git 2>/dev/null; then
            git clone git@github.com:robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
        else
            curl -L http://install.ohmyz.sh | sh
        fi
    fi
    chsh -s /bin/zsh
}

# Prompt for installing git.
while true; do
    read -p "Do you wish to setup git? " yn
    case $yn in
        [Yy]* ) install_git; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Prompt for installing git.
while true; do
    read -p "Do you wish to setup zsh? " yn
    case $yn in
        [Yy]* ) install_zsh; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


function main() {
    echo "main"
}
main
