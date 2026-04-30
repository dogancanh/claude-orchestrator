#!/usr/bin/env bash
# SessionStart — memory dizinini ve trace dosyasını hazırlar
set -euo pipefail

MEM="${HOME}/.claude/memories/alfred"
mkdir -p "$MEM"
[ -f "$MEM/trace.log" ] || : > "$MEM/trace.log"
[ -f "$MEM/history.md" ] || echo "# alfred history" > "$MEM/history.md"
[ -f "$MEM/learnings.md" ] || echo "# alfred learnings" > "$MEM/learnings.md"
[ -f "$MEM/errors.md" ] || echo "# alfred errors" > "$MEM/errors.md"

TS="$(date '+%Y-%m-%d %H:%M:%S')"
echo "" >> "$MEM/trace.log"
echo "=== session start $TS ===" >> "$MEM/trace.log"
exit 0
