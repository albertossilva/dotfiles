curl -sSL https://get.haskellstack.org/ | sh
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

stack install hindent
stack install stylish-haskell
stack install hlint
stack build ghc-mod
