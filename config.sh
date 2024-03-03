rm -rf ~/.fzf
rm -rf ~/.zshrc
rm -rf ~/.tmux.conf
rm -rf ~/.gitconfig
rm -rf ~/.config

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

ln -s ~/.dotfiles/config/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/config/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/config/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/config ~/.config
