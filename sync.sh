#!/bin/bash

# Description:
# Symlinks all files from ~/.dotfiles into the home directory (~),
# preserving directory structure. Only files are linked.
# Certain files and folders are ignored.

DOTFILES_DIR="$HOME/.dotfiles"
TARGET_DIR="$HOME"

cd "$DOTFILES_DIR" || exit 1

# Find all files while excluding ignored ones
find . -type f \
  ! -path "./.docs/*" \
  ! -path "./sync.sh" \
  ! -path "./README.md" \
  ! -path "./.git/*" \
  ! -path "./.gitignore" |
while read -r file; do
  # Strip leading './'
  rel_path="${file#./}"
  src="$DOTFILES_DIR/$rel_path"
  dest="$TARGET_DIR/$rel_path"

  # Create parent directory if needed
  mkdir -p "$(dirname "$dest")"

  # Remove existing file or symlink
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    rm -rf "$dest"
  fi

  # Create symlink
  ln -s "$src" "$dest"
  echo "Linked: $dest -> $src"
done

echo "Dotfiles symlinked successfully."
