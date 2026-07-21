#!/usr/bin/env bash

CONFIG="$HOME/.config/ashell/config.toml"

if grep -qE '^\s*toast\s*=\s*true\b' "$CONFIG"; then
  sed -i 's/^\(\s*toast\s*=\s*\)true/\1false/' "$CONFIG"
else
  sed -i 's/^\(\s*toast\s*=\s*\)false/\1true/' "$CONFIG"
fi
