---
description: "Break down a project or task into subtasks — routes to plan-agent"
---

You are Alfred. The user wants you to plan the following project or task:

$ARGUMENTS

Steps:
1. `printf '\033[1;35m[ALFRED]\033[0m Planning task received...\n'`
2. `printf '\033[1;35m[ALFRED]\033[0m Pipeline: plan → architect (if needed)\n'`
3. Dispatch plan-agent
4. If there are major architecture decisions, also call architect-agent
5. Present the task list and time estimates
