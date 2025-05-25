#!/bin/bash

DOTFILES="$HOME/.dotfiles"
TARGET="$HOME"

# Patterns to exclude (relative to $DOTFILES)
EXCLUDE_PATTERNS=(
  ".docs/*"
  "README.md"
  "sync.sh"
  ".gitignore"
)

# Function to check if a file matches exclude patterns
is_excluded() {
  local file="$1"
  for pattern in "${EXCLUDE_PATTERNS[@]}"; do
    if [[ "$file" == $pattern ]] || [[ "$file" == $pattern/* ]]; then
      return 0  # excluded
    fi
  done
  return 1  # not excluded
}

find "$DOTFILES" -mindepth 1 -print0 | while IFS= read -r -d '' file; do
  rel_path="${file#$DOTFILES/}"

  # Skip excluded files/folders
  if is_excluded "$rel_path"; then
    echo "Skipping $rel_path"
    continue
  fi

  target_path="$TARGET/$rel_path"

  # Create parent directories for the target path
  mkdir -p "$(dirname "$target_path")"

  # Only remove target if it exists and is a symlink or a file/dir that was previously linked to .dotfiles
  if [ -L "$target_path" ]; then
    rm "$target_path"
  elif [ -e "$target_path" ]; then
    # Check if existing target is not part of .dotfiles - if not, skip to avoid accidental deletion
    existing_link_target=$(readlink "$target_path" 2>/dev/null || echo "")
    if [[ "$existing_link_target" == "$DOTFILES"* ]]; then
      rm -rf "$target_path"
    else
      echo "Warning: $target_path exists and is not linked to dotfiles. Skipping."
      continue
    fi
  fi

  # Create symlink
  ln -s "$file" "$target_path"
  echo "Linked $target_path -> $file"
done
