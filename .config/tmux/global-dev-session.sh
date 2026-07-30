#!/usr/bin/env bash

SESSION="home-dev"

TMUX="$(command -v tmux 2>/dev/null || true)"
if [[ -z "$TMUX" ]]; then
  for candidate in /opt/homebrew/bin/tmux /usr/local/bin/tmux /usr/bin/tmux; do
    if [[ -x "$candidate" ]]; then
      TMUX="$candidate"
      break
    fi
  done
fi

if [[ -z "$TMUX" ]]; then
  echo "tmux was not found. Install tmux or add it to PATH." >&2
  exit 127
fi

if "$TMUX" has-session -t "=$SESSION" 2>/dev/null; then
  exec "$TMUX" attach-session -t "$SESSION"
fi

"$TMUX" new-session -d -s "$SESSION" -n "local-dev"
"$TMUX" new-window -t "$SESSION" -n "training"
"$TMUX" new-window -t "$SESSION" -n "agent"
"$TMUX" new-window -t "$SESSION" -n "local-server"

"$TMUX" select-window -t "$SESSION:local-dev"
exec "$TMUX" attach-session -t "$SESSION"
