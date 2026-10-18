#!/bin/bash
# one-shot setup: PATH + completions, appended to the shell profile as one
# guarded block. Re-running is a no-op; remove the block to uninstall.
set -u

BIN_DIR="$HOME/bin"
if [ "$PWD" != "$BIN_DIR" ]; then
    echo "warning: tools hardcode $BIN_DIR; recommended checkout is \`git clone ... $BIN_DIR\`" >&2
fi

case "$SHELL" in
    */zsh)  profile="$HOME/.zshrc" ;;
    */bash) profile="$HOME/.bashrc" ;;
    *)      profile="$HOME/.profile" ;;
esac

BEGIN='# >>> bash_utils_macos >>>'
END_MARK='# <<< bash_utils_macos <<<'

if grep -qF "$BEGIN" "$profile" 2>/dev/null; then
    echo "already set up in $profile (nothing to do)"
    exit 0
fi

{
    echo "$BEGIN"
    echo "export PATH=\"$BIN_DIR:\$PATH\""
    echo "[ -n \"\$BASH_VERSION\" ] && [ -s \"$BIN_DIR/_bash_utils_macos_completions.bash\" ] && . \"$BIN_DIR/_bash_utils_macos_completions.bash\""
    echo "$END_MARK"
} >> "$profile"

echo "added PATH + completions block to $profile"
echo "open a new shell (or: source $profile) to activate"
