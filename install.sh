#!/bin/bash
brew install --cask macvim
brew bundle

cp -n /usr/local/opt/todo-txt/todo.cfg ~/.todo.cfg

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

sh ~/.dotfiles/installLatestDelta.sh
sh ~/.dotfiles/installLatestVim.sh

curl -sSLO git.io/forgit
mv forgit ~/.dotfiles

rm -rf ~/.zshrc
rm -rf ~/.tmux.conf
rm -rf ~/.tmux.conf.local
rm -rf ~/.gitconfig
rm -rf ~/.config/nvim
rm -rf ~/.config/starship.toml
rm -rf ~/.config/alacritty/alacritty.yml
rm -rf ~/.config/bat/config
rm -rf ~/.vim

rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.tmux.conf.local ~/.tmux.conf.local
ln -s ~/.dotfiles/.mygitconfig ~/.gitconfig
mkdir -p ~/.config
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/bat
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/nvim/vimrc.vim ~/.vimrc
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/config/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/.dotfiles/config/bat ~/.config/bat/config
ln -s ~/.dotfiles/config/starship.toml ~/.config/starship.toml
