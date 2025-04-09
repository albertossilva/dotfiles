# curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-macos-x86_64.tar.gz
tar xzf nvim-macos-x86_64.tar.gz
rm nvim-macos-x86_64.tar.gz
rm -rf ~/.nvim
mv nvim-macos-x86_64/ ~/.nvim
