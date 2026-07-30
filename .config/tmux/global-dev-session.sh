#!/usr/bin/env bash

SESSION="home-dev"

if tmux has-session -t "=$SESSION" 2>/dev/null; then
  exec tmux attach-session -t "$SESSION"
fi

tmux new-session -d -s "$SESSION" -n "local-dev"
tmux new-window -t "$SESSION" -n "training"
tmux new-window -t "$SESSION" -n "agent"
tmux new-window -t "$SESSION" -n "local-server"

tmux select-window -t "$SESSION:local-dev"
exec tmux attach-session -t "$SESSION"
