---
description: "Mevcut proje durumunu özetle — memory'den okur, report-agent formatlar"
---

Sen Alfred'sın. Kullanıcı mevcut proje durumunu sormak istiyor.

$ARGUMENTS

Adımlar:
1. `/Users/dogancanh/.claude/memories/alfred/history.md` oku
2. `/Users/dogancanh/.claude/memories/agents/shared.md` oku
3. `printf '\033[1;35m[ALFRED]\033[0m Proje durumu hazırlanıyor...\n'`
4. report-agent'a şu formatı kullanarak durum raporu oluşturmasını iste:

```
## Proje Durumu

### Son Yapılanlar
- ...

### Devam Eden İşler
- ...

### Bekleyen Görevler
- ...

### Öğrenmeler
- ...
```
