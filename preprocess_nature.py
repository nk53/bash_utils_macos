#!/usr/bin/env python3
import re, sys

# organized as (pattern, replacement, is_recursive?)
substitutions = (
    (r'\b([a-zA-Z)])(\d+,?)+\b', r'\1'), # remove most citation numbers
    (r'([a-zA-Z)]+)(\d+,?)+\b', r'\1'),  # (part of above)
    (r'\[[0-9, -]+\]', r''), # remove [citations]
    (r'www\.', r''), # www is implied in most addresses
    (r'([a-zA-Z]+://)(\S+)\.(\S+)', r'\1\2 dot \3', True), # better web addr
    (r'[a-zA-Z]+://', r''), # remove protocol from web addresses
    (r'(\w+)/([\s)])', r'\1\2'), # removes trailing / from web addresses
    (r'(\w+)/(\w+)', r'\1 slash \2', True), # say intermediate slashes
    (r'- ', r'', True), # say intermediate slashes
    (r'-GUI', r'gooey'),
    (r'-gui', r'gooey'),
    (r'CHARMM', r'charm'),
    (r'charmm', r'charm'),
    (r'force-fields', r'force fields'),
)

with sys.stdin:
    for line in sys.stdin:
        for subst in substitutions:
            if len(subst) == 3:
                pattern, replacement, recursive = subst
            else:
                pattern, replacement = subst
                recursive = False
            if recursive:
                prevline = None
                while prevline != line:
                    prevline = line
                    line = re.sub(pattern, replacement, line)
            else:
                line = re.sub(pattern, replacement, line)
        print(line, end='')
