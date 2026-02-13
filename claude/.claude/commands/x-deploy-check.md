---
description: Check deployment status across environments
argument-hint: <service-name>
---

Check deployment for: $ARGUMENTS

Follow this workflow:

1. **Discover available environments** — look for kubectl wrapper binaries:
   ```
   ls ~/.my-binaries/k* 2>/dev/null || ls /usr/local/bin/k* 2>/dev/null
   ```
   Common patterns: `k<env-name>` (e.g., `ktest`, `kprod`, `kstaging`)
2. **Ask which environments to check** — let user specify or default to common ones like test/staging/prod
3. **Check deployed versions** — for each environment:
   ```
   k<env> get deployment <service> -o jsonpath='{.spec.template.spec.containers[0].image}'
   ```
   If no wrapper binaries, fall back to standard kubectl
4. **Get available tags** — `git tag -l --sort=-v:refname | head -10`
5. **Compare versions** — show a clear table:
   ```
   Environment  | Version  | Image Tag | Status
   -------------|----------|-----------|-------
   test         | 0.8.1    | latest    | ✓
   staging      | 0.8.0    | -1        | ⚠
   prod         | 0.7.5    | -3        | ⚠
   ```
6. **Highlight drift** — flag environments behind or ahead of latest tag

Rules:
- Discover environments dynamically (don't hardcode)
- Use kubectl wrapper binaries if available for cleaner commands
- If deployment not found, try listing all deployments to help find the right name
- Parse image tags to extract version numbers (handle formats like `v0.8.1`, `0.8.1`, `sha-abc123`)
- If kubectl fails due to auth, provide the command for user to run manually
