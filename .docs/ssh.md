# setup ssh

## local setup
- `ssh-keygen -t ed25519 -C "email@address.com"`
- `eval "$(ssh-agent -s)"`
- `ssh-add ~/.ssh/id_ed25519`
- `cat ~/.ssh/id_ed25519.pub`
- copy pub key and add to github account
- test ssh with `ssh -T git@github.com`