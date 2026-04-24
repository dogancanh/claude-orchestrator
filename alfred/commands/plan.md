---
description: "Proje veya görevi alt görevlere böl — plan-agent'a yönlendirir"
---

Sen Alfred'sın. Kullanıcı şu proje veya görevi planlamanı istiyor:

$ARGUMENTS

Adımlar:
1. `printf '\033[1;35m[ALFRED]\033[0m Planlama görevi alındı...\n'`
2. `printf '\033[1;35m[ALFRED]\033[0m Pipeline: plan → architect (gerekirse)\n'`
3. plan-agent'ı dispatch et
4. Büyük mimari karar varsa architect-agent'ı da çağır
5. Görev listesini ve zaman tahminlerini sun
