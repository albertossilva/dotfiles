#!/usr/bin/env bash

CONFIG="$HOME/.config/ashell/config.toml"

grep -qE '^[[:space:]]*toast[[:space:]]*=[[:space:]]*false\b' "$CONFIG"
