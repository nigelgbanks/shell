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
FILES=(bash bash_logout bash_profile bashrc profile sh shell zsh)
for file in "${FILES[@]}"
do
    create_link $file
done
