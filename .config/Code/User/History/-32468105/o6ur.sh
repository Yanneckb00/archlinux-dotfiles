#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%s)"
EXCLUDES=(".git" ".gitignore" "install.sh" "README.md", ".docs")

echo "🔧 initialize git repository..."

if [ ! -d "$DOTFILES_DIR/.git" ]; then
    git init "$DOTFILES_DIR"
    echo "👉 git-repository initalized."
else
    echo "✅ git-repository already exists."
fi

read -p "🔗 would you like to add a remote repository (y/n)? " add_remote
if [[ "$add_remote" == "y" ]]; then
    read -p "🌐 git-url: " remote_url
    git -C "$DOTFILES_DIR" remote add origin "$remote_url"
    echo "✅ added remote: $remote_url"
fi

echo "🔗 create symlinks for home directory..."
mkdir -p "$BACKUP_DIR"

cd "$DOTFILES_DIR" || exit 1

for file in .* *; do
    # skip excluded files
    if [[ " ${EXCLUDES[*]} " =~ " $file " ]]; then
        continue
    fi

    src="$DOTFILES_DIR/$file"
    dest="$HOME/$file"

    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "📦 safe existing files: $dest → $BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR/"
    fi

    if [ -L "$dest" ]; then
        echo "❌ remove existing symlinks: $dest"
        rm "$dest"
    fi

    echo "🔗 link $src → $dest"
    ln -s "$src" "$dest"
done

echo "✅ all symlinks created."
