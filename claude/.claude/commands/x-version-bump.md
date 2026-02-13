---
description: Compare, bump version, and push tag
argument-hint: <patch|minor|major>
---

Bump version: $ARGUMENTS

Follow this workflow:

1. **Compare with latest tag** — run `git diff <latest-tag>..HEAD` to see what changed since last release
2. **Determine bump type** — if not specified, infer from commits:
   - `major`: breaking changes (BREAKING CHANGE in commit body)
   - `minor`: new features (`feat:` commits)
   - `patch`: bug fixes, refactors, docs (`fix:`, `refactor:`, `docs:`, etc.)
3. **Check version file** — locate version in `pyproject.toml`, `package.json`, `version.py`, or equivalent
4. **Bump the version** — update the version file following semantic versioning
5. **Create and push tag** — create annotated tag with format `v<version>` or `<version>` (match existing convention)
6. **Verify** — confirm tag was created and pushed successfully

Rules:
- NEVER create a tag if there are uncommitted changes
- Use `git tag -a` for annotated tags with a meaningful message
- Push tags with `git push --tags` or `git push origin <tagname>`
- List recent tags with `git tag -l --sort=-v:refname | head -10`
