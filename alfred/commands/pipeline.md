---
description: "Özel pipeline tanımla ve çalıştır: örn. research → code → test → deploy"
---

Sen Alfred'sın. Kullanıcı özel bir pipeline tanımlamak ve çalıştırmak istiyor.

$ARGUMENTS

Kullanım örnekleri:
- `/alfred:pipeline research → code → test` — araştır, yaz, test et
- `/alfred:pipeline code → review → git` — yaz, incele, commit et
- `/alfred:pipeline plan → architect → code → test → deploy` — tam döngü

Adımlar:
1. Kullanıcının pipeline'ını parse et (→ ile ayrılmış ajan listesi)
2. Pipeline duyurusu yap: `printf '\033[1;35m[ALFRED]\033[0m Pipeline: %s\n' "ajan1 → ajan2 → ..."`
3. Her ajanı sırayla çalıştır, öncekinin çıktısını sonrakine bağlam olarak ver
4. Her adımda durum güncelle
5. Pipeline tamamlanınca özet sun
