#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$repo_dir"

branch="$(git branch --show-current)"
if [[ "$branch" != "linux" ]]; then
  echo "error: sync-linux-from-home.sh only runs on the linux branch (current: $branch)" >&2
  exit 1
fi

if ! git diff --quiet || ! git diff --cached --quiet; then
  echo "error: working tree has uncommitted changes. Commit, stash, or discard them before syncing." >&2
  git status --short
  exit 1
fi

paths=(
  ".zshrc"
  ".tmux.conf"
  ".config/starship.toml"
  ".config/nvim"
  ".config/i3"
  ".config/ghostty"
  ".config/tmux"
  ".screenlayout"
)

sync_path() {
  local rel="$1"
  local src="$HOME/$rel"
  local dest="$repo_dir/$rel"

  if [[ ! -e "$src" ]]; then
    echo "warning: $src does not exist; leaving repo copy unchanged" >&2
    return
  fi

  rm -rf "$dest"
  mkdir -p "$(dirname "$dest")"
  cp -a "$src" "$dest"
  echo "synced $rel"
}

for rel in "${paths[@]}"; do
  sync_path "$rel"
done

# Generated/local files that should never be committed to this public repo.
rm -f .config/nvim/plugin/packer_compiled.lua
rm -f nvim/plugin/packer_compiled.lua
find . -name ".DS_Store" -delete
find . -name "*.swp" -delete
find . -name "*.swo" -delete

git add -A -- "${paths[@]}" .gitignore README.md reload-config.sh sync-linux-from-home.sh

if git diff --cached --quiet; then
  echo "No Linux dotfile updates found."
  exit 0
fi

if command -v rg >/dev/null 2>&1; then
  secret_pattern="(password|passwd|api[_-]?key|private[_-]?key|BEGIN .*PRIVATE|github_pat|ghp_|sk-[A-Za-z0-9]|client_secret|access[_-]?key)"
  if git diff --cached --name-only -z | xargs -0 rg -n -i "$secret_pattern"; then
    echo "error: possible secret found in synced dotfiles; aborting before commit." >&2
    exit 1
  fi
fi

changed_files="$(git diff --cached --name-only)"
commit_msg_file="$(mktemp)"
trap "rm -f \"$commit_msg_file\"" EXIT

{
  echo "Synced Linux dotfiles from $HOME."
  echo
  echo "Changed files:"
  printf "%s\n" "$changed_files" | sed "s/^/- /"
} > "$commit_msg_file"

git commit -F "$commit_msg_file"
git push origin linux
