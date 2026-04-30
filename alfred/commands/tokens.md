---
description: Token kullanım raporu — agent başına toplam ve trend
allowed-tools: ["Bash"]
---

`~/.claude/memories/alfred/tokens.csv` dosyasını oku, son 7 gün için:
- Toplam token kullanımı
- Agent başına toplam (sıralı)
- Ortalama duration
- En pahalı 5 çağrı

```bash
python3 -c "
import csv, sys, time
from collections import defaultdict
from pathlib import Path

p = Path.home()/'.claude/memories/alfred/tokens.csv'
if not p.exists(): print('no data'); sys.exit()

cutoff = time.time() - 7*86400
by_agent = defaultdict(lambda: {'tok':0,'dur':0,'n':0})
top = []
with p.open() as f:
    r = csv.DictReader(f)
    for row in r:
        try:
            t = time.mktime(time.strptime(row['timestamp'], '%Y-%m-%d %H:%M:%S'))
            if t < cutoff: continue
            tok = int(row['approx_tokens']); dur = int(row['duration_s'])
            by_agent[row['agent']]['tok'] += tok
            by_agent[row['agent']]['dur'] += dur
            by_agent[row['agent']]['n'] += 1
            top.append((tok, row['agent'], dur, row['timestamp']))
        except Exception: pass

total = sum(d['tok'] for d in by_agent.values())
print(f'7-day total: ~{total:,} tok')
print()
print('per agent:')
for a, d in sorted(by_agent.items(), key=lambda x:-x[1]['tok']):
    avg = d['dur']/max(d['n'],1)
    print(f'  {a:20s} {d[\"tok\"]:>8,} tok  {d[\"n\"]:>3} calls  avg {avg:.1f}s')
print()
print('top 5 calls:')
for tok,a,dur,ts in sorted(top, reverse=True)[:5]:
    print(f'  {ts}  {a:20s} {tok:>6,} tok  {dur}s')
"
```
