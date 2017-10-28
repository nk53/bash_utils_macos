#!/bin/bash

profile="$HOME/.profile"
searchstr=bash_utils_profile_options

# append the contents of a here document to user's bash profile, but
# only if this hasn't already been done
if [ -z "$(grep $searchstr $profile)" ]; then
(
echo "Updating bash profile ..."
cat << END
#$searchstr
# ls colors
export LSCOLORS=Exfxcxdxbxegedabagacad
export CLICOLOR=1

# search ~/bin first
export PATH=\$HOME/bin:\$PATH

# shortcuts
alias clc='clear; clear'
alias cpy='clear; python'
alias sl='ls'
alias terme='\$HOME/bin/term & exit'
END
) >> $profile
source $profile
echo "Setup complete"
else
    echo "Error: Nothing to set up"
fi
