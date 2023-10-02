# curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
curl -LO https://github.com/neovim/neovim/releases/download/v0.9.2/nvim-macos.tar.gz
tar xzf nvim-macos.tar.gz
rm nvim-macos.tar.gz
rm -rf ~/.nvim
mv nvim-macos/ ~/.nvim
