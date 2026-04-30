#!/usr/bin/env bash
# alfred PostToolUse(Agent) — bitiş süresi ve token tahmini
set -euo pipefail

MEM="${HOME}/.claude/memories/alfred"
mkdir -p "$MEM"
TRACE="$MEM/trace.log"
TOKENS="$MEM/tokens.csv"
ACTIVE="$MEM/.active.json"

[ -f "$TOKENS" ] || echo "timestamp,agent,duration_s,output_chars,approx_tokens" > "$TOKENS"

INPUT="$(cat)"
TS="$(date '+%Y-%m-%d %H:%M:%S')"
EPOCH="$(date +%s)"

AGENT="unknown"
START="$EPOCH"
if [ -f "$ACTIVE" ]; then
  AGENT=$(/usr/bin/grep -oE '"agent":"[^"]+"' "$ACTIVE" | /usr/bin/sed 's/.*"\([^"]*\)"$/\1/' || echo "unknown")
  START=$(/usr/bin/grep -oE '"start":[0-9]+' "$ACTIVE" | /usr/bin/sed 's/[^0-9]//g' || echo "$EPOCH")
fi
DUR=$(( EPOCH - START ))

OUT_LEN=$(echo -n "$INPUT" | /usr/bin/wc -c | /usr/bin/tr -d ' ')
APPROX_TOK=$(( OUT_LEN / 4 ))

printf '\033[36m[alfred]\033[0m ← \033[32m%s done\033[0m │ %ss │ ~%s tok │ %s\n' "$AGENT" "$DUR" "$APPROX_TOK" "$TS" >&2
printf '%s ◀ DONE     %s │ %ss │ ~%s tok\n' "$TS" "$AGENT" "$DUR" "$APPROX_TOK" >> "$TRACE"
printf '%s,%s,%s,%s,%s\n' "$TS" "$AGENT" "$DUR" "$OUT_LEN" "$APPROX_TOK" >> "$TOKENS"

rm -f "$ACTIVE"
exit 0
