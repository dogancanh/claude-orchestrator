# Alfred — AI Orchestrator for Claude Code

Alfred is a multi-agent plugin for [Claude Code](https://claude.ai/code) that manages the full software development lifecycle. It acts as a central orchestrator, routing tasks to specialized expert agents.

## Installation

```bash
claude plugin install dogancanh/alfred
```

Or manually clone and install:

```bash
git clone https://github.com/dogancanh/alfred.git ~/.claude/plugins/marketplaces/dogancanh/alfred
claude plugin install dogancanh/alfred
```

## Usage

Just talk to Alfred naturally, or use slash commands for direct dispatch:

```
/alfred:code Add authentication to the user service
/alfred:test Write unit tests for AuthService
/alfred:debug Login returns 401 after password change
/alfred:review Review src/auth for security issues
/alfred:deploy Deploy to Railway production
```

## Agents (15)

| Agent | Model | Responsibility |
|-------|-------|----------------|
| **alfred** | sonnet | Central orchestrator, routes all tasks |
| **code-agent** | sonnet | Writing, refactoring, implementing features |
| **research-agent** | haiku | Web research + library documentation (context7) |
| **api-agent** | haiku | External API calls with retry & auth support |
| **file-agent** | haiku | File read/write/organize with project awareness |
| **report-agent** | haiku | Format output as markdown, JSON, or tables |
| **plan-agent** | haiku | Task breakdown, sprint planning, roadmaps |
| **architect-agent** | opus | System design, tech stack decisions, ADRs |
| **data-agent** | sonnet | Data processing, CSV/JSON analysis, transforms |
| **db-agent** | sonnet | DB schema, migrations, query optimization |
| **test-agent** | sonnet | Unit/integration/e2e test writing and running |
| **review-agent** | sonnet | Code review, PR review, best practice checks |
| **debug-agent** | sonnet | Systematic debugging and root cause analysis |
| **git-agent** | haiku | Git operations, branch management, PRs |
| **deploy-agent** | sonnet | Railway, Vercel, Docker, Fly.io deployments |

Sadece architect-agent opus. Default sonnet, basit ajanlar haiku — token maliyeti %60-70 düşük.

## Slash Commands (15)

### Agent Commands
| Command | Routes To |
|---------|-----------|
| `/alfred:code` | code-agent |
| `/alfred:test` | test-agent |
| `/alfred:debug` | debug-agent |
| `/alfred:research` | research-agent |
| `/alfred:api` | api-agent |
| `/alfred:db` | db-agent |
| `/alfred:deploy` | deploy-agent |
| `/alfred:git` | git-agent |
| `/alfred:review` | review-agent |
| `/alfred:architect` | architect-agent |

### Project Management
| Command | Description |
|---------|-------------|
| `/alfred:plan` | Break a project into tasks |
| `/alfred:status` | Current project status from memory |
| `/alfred:standup` | Yesterday / today / blockers report |
| `/alfred:sprint` | Sprint planning with estimates |
| `/alfred:pipeline` | Run a custom agent chain (parallel-aware): `[research, file] → code → test` |

### Observability
| Command | Description |
|---------|-------------|
| `/alfred:watch` | Live tail of agent dispatches (`trace.log`) |
| `/alfred:trace` | ASCII tree of last session's agent calls |
| `/alfred:tokens` | 7-day token usage report per agent |

Hooks otomatik çalışır: her Agent dispatch terminale renkli yazar, `trace.log` ve `tokens.csv`'ye kaydeder.

## Stack-Agnostic

Works with TypeScript, Python, Go, Rust, React, Next.js, and any other stack. Agents detect project type automatically from config files (`package.json`, `go.mod`, `Cargo.toml`, etc.).

## Memory

Alfred maintains persistent memory across sessions:

```
~/.claude/memories/alfred/
├── history.md          # Past tasks (auto-rotates >200 lines)
├── history-archive.md  # Older entries
├── learnings.md        # Accumulated learnings
├── errors.md           # Error log
├── trace.log           # Live agent dispatch trace
└── tokens.csv          # Per-call token metrics

~/.claude/memories/agents/
├── shared.md       # Shared project context
├── code-agent.md   # Per-agent memory
└── ...             # One file per agent
```

## Persona

Alfred persona'sı `alfred/references/persona.md` dosyasında — sahip bilgisi, stack, ses tonu ve anti-AI style kuralları (yasak kelimeler, em-dash yasağı, Türkçe konuş kod İngilizce). Kişiselleştirmek için bu dosyayı düzenle.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see [LICENSE](LICENSE).
