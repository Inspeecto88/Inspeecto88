#!/bin/sh
# SessionStart hook for task-observer (adapted from
# .claude/skills/task-observer/references/environments.md).
# The workspace is the repository root, so observations travel between
# devices (phone / MacBook / PC / cloud) through git.
OBS_WORKSPACE="${CLAUDE_PROJECT_DIR:-$(pwd)}"
d="$OBS_WORKSPACE/skill-observations"
open=$(find "$d/observation-log" -maxdepth 1 -name '*.md' -exec grep -l '^status: open$' {} + 2>/dev/null | wc -l | tr -d ' ')
last=$(tr -d '\r' 2>/dev/null < "$d/last-review-date.txt"); last=${last:-never}
msg="Make the first tool call of this session one batched call that both lists the task-observer workspace ($OBS_WORKSPACE) and invokes the task-observer skill; then run its Session Start Protocol. Use $OBS_WORKSPACE as the pinned workspace root (TASK_OBSERVER_WORKSPACE) for every task-observer script. Observation files are created only by scripts/new-observation.sh in the skill directory, never by copying a header."
msg="$msg $open open observations in $d; last review: $last."
if [ "$open" -gt 0 ]; then
  cutoff=$(date -d '7 days ago' +%F 2>/dev/null || date -v-7d +%F)
  case "$last" in
    (never) msg="$msg Offer the review." ;;
    (*) [ "$(printf '%s\n%s\n' "$last" "$cutoff" | sort | head -1)" = "$last" ] && msg="$msg Offer the review." ;;
  esac
fi
msg=$(printf '%s' "$msg" | sed 's/\\/\\\\/g; s/"/\\"/g' | tr -d '\000-\037')
printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$msg"
