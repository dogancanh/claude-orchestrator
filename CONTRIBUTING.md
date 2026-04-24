# Contributing to Alfred

## Ways to Contribute

- Add a new agent
- Add a new slash command
- Improve an existing agent's instructions
- Fix bugs or improve documentation

## Agent File Format

Agents live in `agents/<name>.md` with this structure:

```markdown
---
name: my-agent
description: Use this agent when... Examples:

<example>
Context: When to use
user: "User message example"
assistant: "How Alfred would respond"
<commentary>
Why this example triggers the agent.
</commentary>
</example>

model: sonnet        # haiku | sonnet | opus
color: green         # terminal color name
tools: ["Read", "Write", "Edit", "Bash"]
---

Agent system prompt here.
```

**Model selection guide:**
- `haiku` — simple, fast, mechanical tasks (file ops, git, API calls)
- `sonnet` — moderate complexity (research, DB, testing, data)
- `opus` — deep reasoning required (code architecture, debugging, review)

**Color reference:**

| Color | ANSI |
|-------|------|
| magenta bold | `\033[1;35m` |
| green bold | `\033[1;32m` |
| cyan bold | `\033[1;36m` |
| yellow bold | `\033[1;33m` |
| blue bold | `\033[1;34m` |
| red bold | `\033[1;31m` |
| white bold | `\033[1;37m` |
| red | `\033[0;31m` |
| green | `\033[0;32m` |
| yellow | `\033[0;33m` |
| blue | `\033[0;34m` |
| magenta | `\033[0;35m` |
| cyan | `\033[0;36m` |

## Command File Format

Commands live in `commands/<name>.md`:

```markdown
---
description: "One-line description of what the command does"
---

Sen Alfred'sın. [Context about what user wants]

$ARGUMENTS

Adımlar:
1. `printf '\033[1;35m[ALFRED]\033[0m Görev alındı, <agent-name> devreye giriyor...\n'`
2. <agent-name>'ı dispatch et
3. Sonuçları sun
```

- `$ARGUMENTS` is replaced with whatever the user types after the command
- The printf banner must use Alfred's magenta bold color: `\033[1;35m`
- Always end with a "sun" (present/display) step

## Adding a New Agent

1. Create `agents/<your-agent>.md` following the format above
2. Add the agent to the routing table in `agents/alfred.md`
3. Add the ANSI color entry to the color table in `agents/alfred.md`
4. Optionally add a slash command in `commands/<your-agent>.md`
5. Update `README.md` agent table

## Adding a New Command

1. Create `commands/<name>.md` following the format above
2. Update `README.md` command table

## Pull Request Checklist

- [ ] Agent/command file follows the format above
- [ ] `description` examples are realistic and helpful
- [ ] Model choice matches task complexity
- [ ] No hardcoded user-specific paths (use `$HOME` or document as configurable)
- [ ] README updated if adding a new agent or command
