# sudo add-apt-repository ppa:danielrichter2007/grub-customizer
# sudo apt update
# sudo apt install shutter gimp vlc synaptic i3 cargo vim neovim zsh git grub-customizer ripgrep rofi thefuck jq lxappearance pulseaudio arandr feh tmux rofi jq silversearch-ag
# # dependencies to build allacritty
# sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

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
