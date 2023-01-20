curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar xzf nvim-macos.tar.gz
rm nvim-macos.tar.gz
rm -rf ~/.nvim
mv nvim-macos/ ~/.nvim
