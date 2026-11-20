#!/bin/bash
# Keep local repos up to date without ever touching work in progress.
# Per repo: fetch --all --prune, fast-forward the checked-out branch when the
# working tree is clean, and fast-forward main/master/development when they
# are not checked out anywhere. Anything else is skipped and logged.
# Repos are updated in parallel, UPDATE_REPOS_JOBS at a time (default 8).
#
# Usage: update-repos.sh [repo-dir...]
# Without arguments: every repo in ~/dev, plus the dirs listed one per line in
# ~/.config/update-repos/repos (kept out of the dotfiles; "~/" is expanded).

export GIT_TERMINAL_PROMPT=0
export GIT_SSH_COMMAND="ssh -o BatchMode=yes -o ConnectTimeout=15"

EXTRA_REPOS_FILE=${XDG_CONFIG_HOME:-$HOME/.config}/update-repos/repos

if [ $# -gt 0 ]; then
  REPOS=("$@")
else
  REPOS=(~/dev/*/)
  if [ -f "$EXTRA_REPOS_FILE" ]; then
    while IFS= read -r dir; do
      [ -n "$dir" ] && REPOS+=("${dir/#\~/$HOME}")
    done < "$EXTRA_REPOS_FILE"
  fi
fi
BASE_BRANCHES=(main master development)

log() { printf '%s %-38s %s\n' "$(date '+%F %T')" "$1" "$2"; }

checked_out_anywhere() {
  git worktree list --porcelain | grep -qx "branch refs/heads/$1"
}

update_current_branch() {
  local name=$1 branch upstream before
  branch=$(git symbolic-ref --short -q HEAD) || { log "$name" "skip: detached HEAD"; return; }
  upstream=$(git rev-parse --abbrev-ref -q "$branch@{u}" 2>/dev/null) || { log "$name" "skip $branch: no upstream"; return; }
  if ! git diff --quiet || ! git diff --cached --quiet; then
    log "$name" "skip $branch: uncommitted changes"
    return
  fi
  before=$(git rev-parse HEAD)
  if ! git merge --ff-only --quiet "$upstream" >/dev/null 2>&1; then
    log "$name" "skip $branch: diverged from $upstream"
  elif [ "$before" != "$(git rev-parse HEAD)" ]; then
    log "$name" "updated $branch ($(git rev-list --count "$before..HEAD") commits)"
  fi
}

update_base_branches() {
  local name=$1 current branch upstream
  current=$(git symbolic-ref --short -q HEAD)
  for branch in "${BASE_BRANCHES[@]}"; do
    [ "$branch" = "$current" ] && continue
    git show-ref --verify -q "refs/heads/$branch" || continue
    upstream=$(git rev-parse -q --verify "$branch@{u}" 2>/dev/null) || continue
    [ "$(git rev-parse "$branch")" = "$upstream" ] && continue
    if checked_out_anywhere "$branch"; then
      log "$name" "skip $branch: checked out in another worktree"
    elif git merge-base --is-ancestor "$branch" "$upstream"; then
      git update-ref "refs/heads/$branch" "$upstream" "$(git rev-parse "$branch")"
      log "$name" "updated $branch (not checked out)"
    else
      log "$name" "skip $branch: diverged from upstream"
    fi
  done
}

update_repo() {
  local repo=$1 name
  [ -d "$repo/.git" ] || return
  name=$(basename "$repo")
  cd "$repo" || return
  [ -n "$(git remote)" ] || return
  if ! git fetch --all --prune --quiet 2>/dev/null; then
    log "$name" "FETCH FAILED"
    return
  fi
  update_current_branch "$name"
  update_base_branches "$name"
}

if [ "$1" = --one ]; then
  update_repo "$2"
  exit 0
fi

log "-" "start"
printf '%s\0' "${REPOS[@]}" | xargs -0 -n1 -P "${UPDATE_REPOS_JOBS:-8}" "$0" --one
log "-" "done"
