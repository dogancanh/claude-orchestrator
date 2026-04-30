#!/usr/bin/env bash
# alfred PreToolUse(Agent) — agent dispatch'i terminale renkli kutu olarak yazar
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=/dev/null
. "$SCRIPT_DIR/lib-color.sh"

MEM="${HOME}/.claude/memories/alfred"
mkdir -p "$MEM"
TRACE="$MEM/trace.log"
ACTIVE="$MEM/.active.json"

INPUT="$(cat)"
TS="$(date '+%Y-%m-%d %H:%M:%S')"
EPOCH="$(date +%s)"

SUBAGENT=$(echo "$INPUT" | /usr/bin/grep -oE '"subagent_type"[[:space:]]*:[[:space:]]*"[^"]+"' | /usr/bin/sed 's/.*"\([^"]*\)"$/\1/' || echo "general-purpose")
DESC=$(echo "$INPUT" | /usr/bin/grep -oE '"description"[[:space:]]*:[[:space:]]*"[^"]+"' | /usr/bin/sed 's/.*"\([^"]*\)"$/\1/' | /usr/bin/head -c 80 || echo "")

# Renkli kutular: [ alfred ][ DISPATCH ][ code-agent ]  desc  ts
{
  alfred_header_box
  status_box "DISPATCH" 178
  agent_box "$SUBAGENT"
  printf '  \033[2m%s\033[0m  \033[2m%s\033[0m\n' "$DESC" "$TS"
} >&2

printf '%s ▶ DISPATCH %s │ %s\n' "$TS" "$SUBAGENT" "$DESC" >> "$TRACE"
printf '{"agent":"%s","desc":"%s","start":%s}\n' "$SUBAGENT" "$DESC" "$EPOCH" > "$ACTIVE"

exit 0
