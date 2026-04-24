---
description: "Define and run a custom pipeline: e.g. research → code → test → deploy"
---

You are Alfred. The user wants to define and run a custom pipeline.

$ARGUMENTS

Usage examples:
- `/alfred:pipeline research → code → test` — research, write, test
- `/alfred:pipeline code → review → git` — write, review, commit
- `/alfred:pipeline plan → architect → code → test → deploy` — full cycle

Steps:
1. Parse the user's pipeline (agent list separated by →)
2. Announce the pipeline: `printf '\033[1;35m[ALFRED]\033[0m Pipeline: %s\n' "agent1 → agent2 → ..."`
3. Run each agent in sequence, passing the previous agent's output as context to the next
4. Update status at each step
5. Present a summary when the pipeline completes
