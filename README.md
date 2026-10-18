# bash_utils_macos

My small command-line tools, mostly single-file python/bash, living in `~/bin`.
On macOS, but most tools are plain POSIX/bash/python and run anywhere.

## Install

```sh
git clone https://github.com/nk53/bash_utils_macos.git ~/bin
cd ~/bin && ./setup.sh
```

`~/bin` is the install directory itself — a few tools (`edprog`, `lsbin`, the
completions) hardcode that path, so clone it there. `setup.sh` adds `~/bin` to
PATH and sources the bash completions, via one idempotent, clearly-marked
block in your shell profile. (`setup_bash_profile.sh` is the older 2022-era
equivalent — colors and aliases into `~/.profile`; superseded by `setup.sh`.)

## Conventions

The point of one flat directory: everything is discoverable.

- `lsbin [filter]` — what's installed (glob filter)
- `catprog NAME` — read a tool's source before you run it
- `edprog NAME` — edit a tool in place
- `newpy NAME` / `newexec NAME INTERPRETER` — scaffold a new tool
- tab-completion for `edprog` via `_bash_utils_macos_completions.bash`

## Catalog

`lsbin` is the authoritative list. Some highlights:

- **JSON/pythonREPL**: `json FILE -k 'a.b.0'` — key-path selection, in-place
  editing, compact-width output, `-i` drops you into a Python REPL with the
  object loaded. Needs Python >= 3.12.
- **numbers/text**: `binompdf`, `factors`, `primes`, `fraction`, `pyexpr`,
  `enum2literal`, `is_uuid`, `unicode-names`, `utf8-*`, `stem`, `setdiff`,
  `csv_sort.py`, `xml-indent-unsafe`
- **hangul**: `hangul-anki`, `hangul-romanize`
- **macOS**: `catimg`/`clipimg`, `pbclear`/`pbmod`, `vlccpy`, `saycpy`,
  `quicktime`, `imopen`, `my-ip`
- **files**: `lsdir`, `ls-ext`, `lastmod`, `mv-regex`, `prepend`, `rm-DS`,
  `backup`, `convert_all`, `autocrop`
- **time**: `timer`, `clock`, `count-time-charmm` (CHARMM output timing)
- **misc**: `meeting`, `manage-log`, `phone`, `prompt`, `prepsay`, `rcsb`
  (RCSB PDB lookups), `watchlast`, `waitfor`, `manyterm`

## Fine print

- `convert_temperature` imports my personal `temperature` library — not
  included here; the tool won't run without it.
- `git-add-all` is kept as a historical artifact, not a recommendation. It
  differs from `git add -u` by *not* staging deletions, but it parses the
  human-readable output of `git status`, so it breaks on filenames with
  spaces and non-English locales. A safe variant with the same no-deletions
  behavior: `git add $(git ls-files -m)`.
- These are personal tools: no support, no promises. PRs welcome if something
  bites you.
