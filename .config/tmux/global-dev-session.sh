#!/usr/bin/env bash

SESSION="cortex-dev"

tmux has-session -t $SESSION 2>/dev/null
if [ $? -eq 0 ]; then
  exec tmux attach -t $SESSION
fi

tmux new-session -d -s $SESSION -n "local-dev"
tmux new-window -t $SESSION -n "local-server"

tmux select-window -t $SESSION:local-dev
exec tmux attach -t $SESSION
