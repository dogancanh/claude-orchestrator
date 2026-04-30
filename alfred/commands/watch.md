---
description: Canlı agent dispatch izleme — trace.log'u tail'ler
allowed-tools: ["Bash"]
---

`~/.claude/memories/alfred/trace.log` dosyasını canlı tail et. Renkli çıktı, son 20 satır + akış.

```bash
tail -n 20 -f "$HOME/.claude/memories/alfred/trace.log"
```

Çıkmak için Ctrl+C.
