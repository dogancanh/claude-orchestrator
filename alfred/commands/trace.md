---
description: Son session'daki agent çağrı zincirini ASCII tree olarak göster
allowed-tools: ["Bash", "Read"]
---

`~/.claude/memories/alfred/trace.log` dosyasını oku, son `=== session start ===` markerından sonrasını parse et, agent dispatch zincirini ağaç yapısında bas. Token toplamını ve duration'ı göster.

Format:
```
session: 2026-04-30 23:05:12
├─ research-agent  (4s, ~4.2k tok)
├─ code-agent      (18s, ~12k tok)
└─ test-agent      (6s, ~3.1k tok)
total: 28s, ~19.3k tok
```

`tokens.csv` dosyasını da özetle: bu hafta toplam token, en pahalı 3 agent.
