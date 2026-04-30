#!/usr/bin/env bash
# UserPromptSubmit — kullanıcı "alfred" dediyse ana agent'a dispatch direktifi enjekte et
set -euo pipefail

INPUT="$(cat)"
PROMPT=$(echo "$INPUT" | /usr/bin/grep -oE '"prompt"[[:space:]]*:[[:space:]]*"[^"]*"' | /usr/bin/sed 's/^"prompt"[[:space:]]*:[[:space:]]*"//; s/"$//' || echo "")

# Boşsa veya alfred geçmiyorsa hiçbir şey yapma
[ -z "$PROMPT" ] && exit 0

# Kelime sınırlı, case-insensitive eşleşme: "alfred" tek başına bir kelime olarak geçmeli
if echo "$PROMPT" | /usr/bin/grep -qiE '(^|[^a-zA-Z0-9])alfred([^a-zA-Z0-9]|$)'; then
  cat <<'EOF'
[alfred-auto-route] Kullanıcı "alfred" dedi. Bu görevi DOĞRUDAN alfred ajanına yönlendir:

  Agent(subagent_type: "alfred:alfred", description: "[alfred] <kısa özet>", prompt: <kullanıcı isteği aynen>)

Kendin implement etme. alfred ajanı history/learnings'i okuyacak, doğru uzmana delege edecek, memory'i güncelleyecek. Sadece tek Agent çağrısı yap, sonucu kullanıcıya ilet.
EOF
fi

exit 0
