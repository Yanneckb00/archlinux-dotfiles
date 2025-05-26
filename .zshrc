#!/bin/bash

# Description:
# Symlinks all files from ~/.dotfiles into the home directory (~),
# preserving the directory structure.
# Only files are symlinked, not folders.
# Existing files at the destination will be overwritten.
# The following patterns are ignored:
# - .docs/**
# - sync.sh
# - README.md
# - .git/**
# - .gitignore

DOTFILES_DIR="$HOME/.dotfiles"
TARGET_DIR="$HOME"

# Ignore patterns (relative to $DOTFILES_DIR)
IGNORE_PATTERNS=(
  ".docs/*"
  "sync.sh"
  "README.md"
  ".git/*"
  ".gitignore"
)

# Check if path matches any ignore pattern
should_ignore() {
  local rel_path="$1"
  for pattern in "${IGNORE_PATTERNS[@]}"; do
    if [[ "$rel_path" == $pattern ]]; then
      return 0
    fi
  done
  return 1
}

# Main logic
cd "$DOTFILES_DIR" || exit 1

# Find all files (not directories)
find . -type f | while read -r file; do
  # Strip leading './'
  rel_path="${file#./}"

  # Skip ignored files
  if should_ignore "$rel_path"; then
    echo "Ignoring: $rel_path"
    continue
  fi

  src="$DOTFILES_DIR/$rel_path"
  dest="$TARGET_DIR/$rel_path"

  # Create parent directory in home if it doesn't exist
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
