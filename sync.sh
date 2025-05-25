#!/bin/bash

DOTFILES="$HOME/.dotfiles"
TARGET="$HOME"

# Find all files and directories inside the dotfiles folder recursively (excluding the folder itself)
find "$DOTFILES" -mindepth 1 -print0 | while IFS= read -r -d '' file; do
  # Get the relative path of the file/directory to the dotfiles folder
  rel_path="${file#$DOTFILES/}"

  # Define the target path in the home directory
  target_path="$TARGET/$rel_path"

  # Make sure the parent directory exists
  mkdir -p "$(dirname "$target_path")"

  # If the target file or symlink already exists, remove it
  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    rm -rf "$target_path"
  fi

  # Create a symlink from the dotfiles file to the target path
  ln -s "$file" "$target_path"

  echo "Linked $target_path -> $file"
done
