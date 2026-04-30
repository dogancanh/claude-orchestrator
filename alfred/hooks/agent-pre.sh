#!/usr/bin/env bash
# alfred PreToolUse(Agent) — agent dispatch'i terminale ve trace.log'a yazar
set -euo pipefail

MEM="${HOME}/.claude/memories/alfred"
mkdir -p "$MEM"
TRACE="$MEM/trace.log"
ACTIVE="$MEM/.active.json"

INPUT="$(cat)"
TS="$(date '+%Y-%m-%d %H:%M:%S')"
EPOCH="$(date +%s)"

SUBAGENT=$(echo "$INPUT" | /usr/bin/grep -oE '"subagent_type"[[:space:]]*:[[:space:]]*"[^"]+"' | /usr/bin/sed 's/.*"\([^"]*\)"$/\1/' || echo "general-purpose")
DESC=$(echo "$INPUT" | /usr/bin/grep -oE '"description"[[:space:]]*:[[:space:]]*"[^"]+"' | /usr/bin/sed 's/.*"\([^"]*\)"$/\1/' | /usr/bin/head -c 80 || echo "")

printf '\033[36m[alfred]\033[0m → \033[33m%s\033[0m │ %s │ %s\n' "$SUBAGENT" "$DESC" "$TS" >&2
printf '%s ▶ DISPATCH %s │ %s\n' "$TS" "$SUBAGENT" "$DESC" >> "$TRACE"

printf '{"agent":"%s","desc":"%s","start":%s}\n' "$SUBAGENT" "$DESC" "$EPOCH" > "$ACTIVE"

exit 0
