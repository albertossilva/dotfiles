#!/usr/bin/env bash

fc-list -f '%{family}\t%{style}\n' |
awk -F'\t' '
  $2 == "Regular" {
      split($1, families, ",")
      for (i in families) {
          font = families[i]

          # Trim whitespace
          gsub(/^[[:space:]]+|[[:space:]]+$/, "", font)

          # Normalize Mono/Propo variants
          sub(/[[:space:]]+Mono$/, "", font)
          sub(/[[:space:]]+Propo$/, "", font)

          if (!seen[font]++)
              print font
      }
  }
' |
sort -f |
while IFS= read -r font; do
    printf '<span font_desc="%s">%s</span>\n' "$font" "$font"
done |
rofi -dmenu -markup-rows -replace -i -p "󰛖" |
sed -E 's/<[^>]+>//g' |
wl-copy
