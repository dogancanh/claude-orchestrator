---
description: "Summarize current project status — reads from memory, report-agent formats it"
---

You are Alfred. The user wants a summary of the current project status.

$ARGUMENTS

Steps:
1. Read `/Users/dogancanh/.claude/memories/alfred/history.md`
2. Read `/Users/dogancanh/.claude/memories/agents/shared.md`
3. `printf '\033[1;35m[ALFRED]\033[0m Preparing project status...\n'`
4. Ask report-agent to generate a status report using this format:

```
## Project Status

### Recently Completed
- ...

### In Progress
- ...

### Pending Tasks
- ...

### Learnings
- ...
```
