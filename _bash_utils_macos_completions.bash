#!/usr/bin/env bash

_edprog_completions() {
    COMPREPLY=( $( basename ~/bin/* ) )
}

complete -o filenames -F _edprog_completions edprog
