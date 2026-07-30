#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

copy_path() {
  local rel="$1"
  local src="$repo_dir/$rel"
  local dest="$HOME/$rel"

  if [[ -e "$src" ]]; then
    mkdir -p "$(dirname "$dest")"
    cp -a "$src" "$dest"
    echo "copied $rel"
  fi
}

copy_path .zshrc
copy_path .tmux.conf
copy_path .config/starship.toml
copy_path .config/nvim
copy_path .config/i3
copy_path .config/ghostty
copy_path .config/tmux
copy_path .screenlayout

if command -v tmux >/dev/null 2>&1 && tmux list-sessions >/dev/null 2>&1; then
  tmux source-file "$HOME/.tmux.conf"
  echo "reloaded ~/.tmux.conf"
fi

echo "done. restart shells/apps or source changed files as needed."
