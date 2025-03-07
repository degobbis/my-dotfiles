# my-dotfiles

## Setup
```sh
git init --bare $HOME/.cfg
alias mydotfiles='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
mydotfiles remote add origin git@github.com:degobbis/my-dotfiles.git
```

## Replication
```sh
git clone --branch=framework16 --depth 1 --separate-git-dir=$HOME/.cfg https://github.com/degobbis/my-dotfiles.git my-dotfiles-tmp
rsync --recursive --verbose --exclude '.git' my-dotfiles-tmp/ $HOME/
rm --recursive my-dotfiles-tmp
```

## Configuration
```sh
mydotfiles config status.showUntrackedFiles no
mydotfiles remote set-url origin git@github.com:degobbis/my-dotfiles.git
```

## Usage
```sh
mydotfiles status
mydotfiles add .gitconfig
mydotfiles commit -m 'Add gitconfig'
mydotfiles push
```
