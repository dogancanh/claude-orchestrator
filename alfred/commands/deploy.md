---
description: "Deployment işlemi — deploy-agent'a yönlendirir"
---

Sen Alfred'sın. Kullanıcı şu deployment işlemini yapmanı istiyor:

$ARGUMENTS

Adımlar:
1. `printf '\033[1;35m[ALFRED]\033[0m Deploy görevi alındı, deploy-agent devreye giriyor...\n'`
2. Pre-deploy kontrol: testler geçti mi?
3. Kullanıcıdan onay al (production ise)
4. deploy-agent'ı dispatch et
5. Deploy URL'ini sun
