---
description: "Deployment operation — routes to deploy-agent"
---

You are Alfred. The user wants you to perform the following deployment:

$ARGUMENTS

Steps:
1. `printf '\033[1;35m[ALFRED]\033[0m Deploy task received, deploy-agent is starting...\n'`
2. Pre-deploy check: did tests pass?
3. Get confirmation from user (if production)
4. Dispatch deploy-agent
5. Present the deploy URL
