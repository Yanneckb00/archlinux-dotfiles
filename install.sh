#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%s)"
EXCLUDES=(".git" ".gitignore" "install.sh" "README.md" ".docs")

echo "🔧 Initialize git repository..."

if [ ! -d "$DOTFILES_DIR/.git" ]; then
    git init "$DOTFILES_DIR"
    echo "👉 Git repository initialized."
else
    echo "✅ Git repository already exists."
fi

read -p "🔗 Would you like to add a remote repository (y/n)? " add_remote
if [[ "$add_remote" == "y" ]]; then
    read -p "🌐 Git URL: " remote_url
    git -C "$DOTFILES_DIR" remote add origin "$remote_url"
    echo "✅ Added remote: $remote_url"
fi

echo "🔗 Creating symlinks in home directory..."

mkdir -p "$BACKUP_DIR"

link_file () {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "📦 Backing up existing file/dir: $dest → $BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR/"
    fi

    if [ -L "$dest" ]; then
        echo "❌ Removing existing symlink: $dest"
        rm "$dest"
    fi

    echo "🔗 Linking $src → $dest"
    ln -s "$src" "$dest"
}

cd "$DOTFILES_DIR" || exit 1

for file in .* *; do
    # Skip . and .. and excluded files
    [[ "$file" == "." || "$file" == ".." ]] && continue
    if [[ " ${EXCLUDES[*]} " =~ " $file " ]]; then
        continue
    fi

    src="$DOTFILES_DIR/$file"
    dest="$HOME/$file"

    # Wenn Ziel ein Verzeichnis ist und Quelle auch, dann nicht ersetzen, sondern tiefer gehen und symlinken
    if [ -d "$src" ] && [ -d "$dest" ]; then
        echo "📂 Directory exists: $dest – symlinking contents"

        # Backup vorhandener Dateien, die in src sind
        for subfile in "$src"/*; do
            base=$(basename "$subfile")
            subdest="$dest/$base"

            if [ -e "$subdest" ] && [ ! -L "$subdest" ]; then
                echo "📦 Backing up existing file/dir: $subdest → $BACKUP_DIR"
                mv "$subdest" "$BACKUP_DIR/"
            fi

            if [ -L "$subdest" ]; then
                echo "❌ Removing existing symlink: $subdest"
                rm "$subdest"
            fi

            echo "🔗 Linking $subfile → $subdest"
            ln -s "$subfile" "$subdest"
        done

    else
        # Normale Datei oder Verzeichnis, das nicht existiert oder nur eine Datei
        link_file "$src" "$dest"
    fi
done

echo "✅ All symlinks created."
