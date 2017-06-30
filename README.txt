Recommended installation procedure:
    $ git clone https://github.com/nk53/bash_utils_macos.git ~/bin

Also, add the following to your Bash profile:
    # ls colors
    export LSCOLORS=Exfxcxdxbxegedabagacad
    export CLICOLOR=1

    # search ~/bin first
    export PATH=$HOME/bin:$PATH

    # shortcuts
    alias clc='clear; clear'
    alias cpy='clear; python'
    alias sl='ls'
    alias terme='$HOME/bin/term & exit'
