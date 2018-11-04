#!/bin/sh

thispath="$( cd "$(dirname "$0")" ; pwd -P )"
cp -f "$thispath/vimrc" "$HOME/.vimrc" 
cp -f "$thispath/bash_support.sh" "$HOME/.bash_support.sh"
cp -f "$thispath/aliases.sh" "$HOME/.bash_aliases.sh"
cp -f "$thispath/bash_prompt.sh" "$HOME/.bash_prompt.sh" 
cp -f "$thispath/functions.sh" "$HOME/.bash_functions.sh"

if [ -f "/usr/share/bash-completion/completions/git" ]; then 
    echo "source usr/share/bash-completion/completions/git" > "$HOME/.git_completion.sh"
else 
    echo downloading git completion support
    curl -o $HOME/.git-completion.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash 
    echo "source $HOME/.git-completion.sh" > "$HOME/.git_completion.sh"
fi 

if ! [ -f "$HOME/.git-prompt.sh" ]; then
    echo downloading git prompt support
    curl -o $HOME/.git-prompt.sh  https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi 

installed=$(grep bash_support $HOME/.bashrc)
if [ -z "$installed" ]; then
    echo "source $HOME/.bash_support.sh" >> $HOME/.bashrc
else 
    echo "bashrc already calls bash_support!"
fi
echo "Done! Restart shell or resource"