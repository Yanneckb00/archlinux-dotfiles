# General information

## install fonts
- `mkdir -p ~/.local/share/fonts`
- `cp ~/Downloads/*.ttf ~/.local/share/fonts/`
- `fc-cache -fv`

### for all user
- `sudo mkdir -p /usr/share/fonts/custom`
- `sudo cp ~/Downloads/*.ttf /usr/share/fonts/custom/`
- `sudo fc-cache -fv`

## Zip
- zip: `tar czvf /path/to/destination/backup.tar.gz -C /path/to/target-files .`
- unzip: `tar xzvf /path/to/backup.tar.gz -C /destination/path`

x: extract — Archiv entpacken
z: gzip — Archiv wurde mit gzip komprimiert (.tar.gz oder .tgz)
v: verbose — zeige die Dateien während des Entpackens (Ausgabe im Terminal)
f: file — gibt an, dass danach der Dateiname folgt

## symlinks
- create Symlink: `ln -s /path/to/target /name/of/target` (for example: `ln -s /mnt/disks/ssd1/Minecraft~/.minecraft`)