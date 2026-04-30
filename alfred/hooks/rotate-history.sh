#!/usr/bin/env bash
# Stop hook — history.md 200 satırı geçtiyse archive'a taşı
set -euo pipefail

MEM="${HOME}/.claude/memories/alfred"
HIST="$MEM/history.md"
ARCH="$MEM/history-archive.md"

[ -f "$HIST" ] || exit 0

LINES=$(/usr/bin/wc -l < "$HIST" | /usr/bin/tr -d ' ')
[ "$LINES" -gt 200 ] || exit 0

KEEP=80
TOTAL="$LINES"
MOVE=$(( TOTAL - KEEP ))

[ -f "$ARCH" ] || echo "# history archive" > "$ARCH"
echo "" >> "$ARCH"
echo "## archived $(date '+%Y-%m-%d')" >> "$ARCH"
/usr/bin/head -n "$MOVE" "$HIST" >> "$ARCH"

TMP="$(mktemp)"
/usr/bin/tail -n "$KEEP" "$HIST" > "$TMP"
mv "$TMP" "$HIST"

printf '\033[36m[alfred]\033[0m history.md rotated: kept %s lines, archived %s\n' "$KEEP" "$MOVE" >&2
exit 0
