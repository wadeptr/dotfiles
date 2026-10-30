#!/usr/bin/env bash

SESSION="prep-mode"
COACH_ROOT="$HOME/.config/tmux/coaches"

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

"$TMUX" new-session -d -s "$SESSION" -n "local"
"$TMUX" new-window -t "$SESSION" -n "local-editor"
"$TMUX" new-window -t "$SESSION" -n "hl-coach" -c "$COACH_ROOT/hl-coach"
"$TMUX" new-window -t "$SESSION" -n "coding-coach" -c "$COACH_ROOT/coding-coach"
"$TMUX" new-window -t "$SESSION" -n "sd-coach" -c "$COACH_ROOT/sd-coach"
"$TMUX" new-window -t "$SESSION" -n "lship-coach" -c "$COACH_ROOT/lship-coach"

"$TMUX" select-window -t "$SESSION:local"
exec "$TMUX" attach-session -t "$SESSION"
