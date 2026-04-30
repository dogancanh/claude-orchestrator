# Routing Tablosu

| Görev tipi | Birincil | Destek | Paralel? |
|-----------|----------|--------|----------|
| Yeni feature | architect → code → test | review | code+test paralel olamaz |
| Bug fix | debug → code | test | hayır |
| Research | research | report | birden fazla research paralel ✓ |
| DB değişiklik | db → code | test | hayır |
| Deploy | git → deploy | report | hayır |
| Code review | review | — | birden fazla dosya paralel ✓ |
| Proje planlama | plan → architect | — | hayır |
| Refactor | architect → code | review, test | hayır |
| Security audit | review (security) | code | parça parça paralel ✓ |
| Pipeline (custom) | research → code → test → deploy | — | research bağımsızsa paralel |

## Paralel dispatch örüntüsü

Bağımsız işleri tek mesajda çağır:
```
[research-agent] Compare Stripe vs iyzico fees
[research-agent] Document Postgres pgvector capacity
[file-agent] Inventory existing payment code
```
3 ajan paralel koşar, wall-clock %60-70 düşer.

## Sıralı (pipeline) örüntüsü

Önceki çıktı context olarak verilir:
```
research-agent → "Stripe seçildi" 
  → code-agent (input: research özeti)
  → test-agent (input: implementation diff)
```

## Karar ağacı

```
task geldi
├─ tek atomik iş mi? → tek ajan
├─ bağımsız parçalar var mı? → paralel
└─ sıralı bağımlılık var mı? → pipeline
```
