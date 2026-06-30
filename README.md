# dotfiles

Public dotfiles for my development environments.

## Branches

- `linux`: Linux desktop setup for i3, Ghostty, tmux, zsh, Starship, and Neovim.
- `macos`: macOS setup branch. Keep macOS-specific package/install choices there.

This branch is the Linux branch. It stores files using home-relative paths so they can be copied directly into `$HOME`.

## Included on Linux

- `.config/nvim/` - Neovim config and plugin specs, excluding generated plugin output
- `.config/i3/` - i3, i3blocks, and related desktop status config
- `.config/ghostty/` - Ghostty terminal config
- `.config/tmux/` - tmux helper scripts
- `.config/starship.toml` - Starship prompt config
- `.screenlayout/default-layout.sh` - monitor layout
- `.tmux.conf` - tmux config
- `.zshrc` - zsh shell config

## Intentionally Excluded

Do not add browser profiles, credentials, SSH/GPG material, API tokens, agent state, generated caches, local app databases, or plugin build output. Examples: `.ssh/`, `.aws/`, `.config/google-chrome/`, `.config/BraveSoftware/`, `.config/obsidian/`, `.codex/`, `.agents/`, Neovim `plugin/packer_compiled.lua`, and package caches.

## Sync From This Linux Machine

To update this repository from the curated Linux config files in `$HOME`, run:

```bash
./sync-linux-from-home.sh
```

The script only runs on the `linux` branch, aborts if the repo has uncommitted changes, syncs the Linux allowlist from `$HOME`, commits any detected changes, and pushes only `origin linux`.

## Install / Refresh

From this branch:

```bash
./reload-config.sh
```

The script copies the tracked home-relative files into `$HOME`. Review changes before running it on a new machine.

## Expected Linux Dependencies

Install these through your system package manager or existing bootstrap process:

- zsh and Oh My Zsh
- zsh-syntax-highlighting
- zsh-autosuggestions
- starship
- tmux
- ghostty
- i3, i3blocks, xrandr
- neovim
- git, ripgrep, fd/findutils, make, cargo
- MesloLGS NF or another Nerd Font

## Neovim Plugins

Packer is used for plugin management. If plugins are missing, bootstrap `packer.nvim`, then run:

```vim
:lua require("bwade.packer")
:PackerSync
```

Generated plugin files are intentionally not tracked.
