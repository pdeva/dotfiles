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
alias git-cleanup='git switch main && git branch | grep -v "main" | xargs git branch -D'
[ -d "$HOME/.local/bin" ] && case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;              # already there → do nothing
  *) PATH="$HOME/.local/bin:$PATH" ;;     # otherwise prepend
esac
alias clauded='claude --dangerously-skip-permissions'
alias codexd='codex --dangerously-bypass-approvals-and-sandbox -m gpt-5.1-codex -c model_reasoning_effort="high" --enable web_search_request'
