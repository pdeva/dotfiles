alias k='kubectl'
alias cb='cargo build'
alias ce='cargo check'
alias cet='cargo check --tests'
alias cct='cargo clippy --tests --benches'
alias cf='cargo fmt'
alias glog2='git log --pretty=format:"%C(auto)%h %C(blue)%ad %C(red)%d %C(reset)%s %C(green)[%an]" --date=short --graph'
alias ls='eza'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias glog='git log --oneline --decorate --graph'
alias gcam='git commit --all --message'
alias gsw='git switch'
alias gd='git diff'
alias git-cleanup='git switch main && git_cleanup_delete_branches'
alias gdp='git-cleanup && { echo "running git pull..."; git pull; }'
alias clauded='claude --dangerously-skip-permissions'
alias codexd='codex --dangerously-bypass-approvals-and-sandbox -m gpt-5.1-codex-max -c model_reasoning_effort="high" --enable web_search_request'

[ -d "$HOME/.local/bin" ] && case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;              # already there → do nothing
  *) PATH="$HOME/.local/bin:$PATH" ;;     # otherwise prepend
esac
git_cleanup_delete_branches() {
  local branches branch cleanup_status=0

  branches=$(
    git for-each-ref --format='%(refname:short) %(worktreepath)' refs/heads |
      awk '$1 != "main" && $2 == "" { print $1 }'
  )

  if [ -z "$branches" ]; then
    return 0
  fi

  while IFS= read -r branch; do
    [ -n "$branch" ] || continue
    git branch -D "$branch" || cleanup_status=$?
  done <<< "$branches"

  return "$cleanup_status"
}
