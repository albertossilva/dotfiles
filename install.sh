#!/bin/bash
brew install tmux the_silver_searcher ripgrep fd bat reattach-to-user-namespace urlview extract_url todo-txt graphviz java pinentry asciinema

cp -n /usr/local/opt/todo-txt/todo.cfg ~/.todo.cfg

brew upgrade
brew install --cask macvim
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

sh ~/.dotfiles/installLatestDelta.sh
sh ~/.dotfiles/installLatestVim.sh

curl -sSLO git.io/forgit
mv forgit ~/.dotfiles

rm -rf ~/.zshrc
rm -rf ~/.tmux.conf
rm -rf ~/.tmux.conf.local
rm -rf ~/.gitconfig
rm -rf ~/.config/nvim
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
