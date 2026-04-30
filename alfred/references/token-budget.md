# Token Bütçesi ve Optimizasyon

## Model seçim heuristic

Token maliyeti: opus ~5x sonnet ~5x haiku. Sonnet 4.6 çoğu kod işi için yeter.

| İş | Model | Sebep |
|----|-------|-------|
| Routing/karar | haiku | alfred kendi düşüncesi yeterli |
| Research özet | haiku | uzun bağlam ama basit özet |
| Code implementation | sonnet | dengeli, çoğu CRUD/refactor için yeter |
| Architecture decision | opus | ADR seviyesi düşünme |
| Security audit | opus | hatadan dönülmez |
| Karmaşık debug (>3 dosya, race condition) | opus | hipotez kurma |

## Disiplin kuralları

1. **Kod okuma → Explore** subagent'ı zorunlu. code-agent kendi `Read`'ları yapmasın.
2. **Bağımsız iş → paralel dispatch.** Tek mesajda multi-Agent block.
3. **Memory rotate.** `history.md` 200 satırı geçince Stop hook archive'a taşır.
4. **System prompt cache.** Ajan tanım dosyaları (alfred.md, *-agent.md) tekrar çağrıda cache'den okunur — değiştirme sıklığını düşür.
5. **Pipeline'da sadece özet geçir.** research-agent çıktısını code-agent'a verirken full transcript değil 5 satırlık karar özeti.

## Metrik

`~/.claude/memories/alfred/tokens.csv` → her Agent çağrısı için timestamp/agent/duration/output_chars/approx_tokens.

`/alfred:tokens` komutu son 7 günü raporlar.

## Hedefler

- Ortalama task: <30k token toplam (karmaşık feature dahil)
- Opus payı: <%20
- Cache hit rate: >%70 (tekrarlı routing'lerde)
