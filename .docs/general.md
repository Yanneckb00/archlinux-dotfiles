# General information

## install fonts
- `mkdir -p ~/.local/share/fonts`
- `cp ~/Downloads/*.ttf ~/.local/share/fonts/`
- `fc-cache -fv`

### for all user
- `sudo mkdir -p /usr/share/fonts/custom`
- `sudo cp ~/Downloads/*.ttf /usr/share/fonts/custom/`
- `sudo fc-cache -fv`

## Zipp
- zip: `tar czvf /path/to/destination/backup.tar.gz -C /path/to/target-files .`
- unzip: `tar xzvf /path/to/backup.tar.gz -C /destination/path`
