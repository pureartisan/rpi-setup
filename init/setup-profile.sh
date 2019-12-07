#!/bin/bash

echo "=== Setting up PROFILE ====================="

BASH_ALIASES_PATH=~/.bash_aliases
BASH_ALIASES_BACKUP_PATH=~/.bash_aliases.backup
if test -f "$BASH_ALIASES_PATH"; then
    echo "$BASH_ALIASES_PATH exist, creating backup"
    mv "$BASH_ALIASES_PATH" "$BASH_ALIASES_BACKUP_PATH"
fi

# copy bash aliases
cp "$DIRECTORY/profile/.bash_aliases" "$BASH_ALIASES_PATH"


echo "=== Setting up PROFILE >>> DONE! ==========="