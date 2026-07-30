# dotfiles

Public dotfiles for my development environments.

## Branches

- `linux`: Linux desktop setup for i3, Ghostty, tmux, zsh, Starship, and Neovim.
- `macos`: macOS setup for Ghostty, tmux, zsh, Starship, Neovim, and Git.

This is the macOS branch. It stores files using home-relative paths so they can be copied directly into `$HOME`.

## Included on macOS

- `.config/nvim/` - Neovim config and plugin specs, excluding generated plugin output
- `.config/ghostty/` - Ghostty terminal config
- `.config/tmux/` - tmux helper scripts
- `.config/starship.toml` - Starship prompt config
- `.config/git/ignore` - global Git ignore rules
- `.gitconfig` - public Git identity and settings
- `.tmux.conf` - tmux config
- `.zshrc` - zsh shell config with Homebrew paths

## Intentionally Excluded

Do not add browser profiles, credentials, SSH/GPG material, API tokens, agent state, generated caches, local app databases, or plugin build output. Examples: `.ssh/`, `.aws/`, browser profiles, `.codex/`, `.agents/`, Neovim `plugin/packer_compiled.lua`, and package caches.

Linux-only desktop configuration such as i3 and `.screenlayout/` stays on the `linux` branch.

## Sync From a Mac

To update this repository from the curated macOS config files in `$HOME`, run:

```bash
./sync-macos-from-home.sh
```

The script only runs on the `macos` branch, aborts if the repo has uncommitted changes, syncs the macOS allowlist from `$HOME`, checks for likely secrets, commits detected changes, and pushes only `origin macos`.

## Install / Refresh

From this branch:

```bash
./reload-config.sh
```

The script replaces the curated config paths in `$HOME`. Review changes before running it on a new machine.

## Expected macOS Dependencies

- Homebrew
- zsh and Oh My Zsh
- zsh-syntax-highlighting and zsh-autosuggestions
- Starship
- tmux
- Ghostty
- Neovim
- Git, ripgrep, fd, make, Cargo, and Node.js
- MesloLGS NF or another Nerd Font

## Neovim Plugins

Packer is used for plugin management. If plugins are missing, bootstrap `packer.nvim`, then run:

```vim
:lua require("bwade.packer")
:PackerSync
```

Generated plugin files are intentionally not tracked.
