## Code style
- Simplicity first: implement the simplest working solution. Do not add speculative edge cases. List possible edge cases separately and ask before implementing.
- Think first: check constraints, prerequisites, and order of operations; prefer simple, low-risk steps and ask only when missing info blocks progress.
- Change impact: consider broader context and unintended behavior changes; call out risks before implementing.
- Minimal impact: changes should only touch what's necessary. Avoid introducing bugs.
- No laziness: find root causes. No temporary fixes. Senior developer standards.
- For non-trivial changes: pause and ask "is there a more elegant way?" Skip this for simple, obvious fixes.
- Challenge your own work before presenting it. Ask: "Would a staff engineer approve this?"
## Error handling
- Keep `try` blocks as small as possible.
- Avoid `except Exception` or bare `except`; catch specific exceptions.
- Keep non-failing logic outside the `try`.
## Comments and docs
- Minimal comments only when necessary.
- No multi-line docstrings, no file header comment blocks, no redundant comments.
- No emojis in error logs or console messages.
## Verification
- Never mark a task complete without proving it works.
- Run tests, check logs, demonstrate correctness.
- Diff behavior between main and your changes when relevant.
- Bugs: add regression test when it fits.
## Research
- Check online for current version numbers and official docs when using external packages, version-specific behavior, or unfamiliar errors.
- Otherwise keep research light.
## Obsidian Journal
After completing significant work (new features, bug fixes, architecture changes), **always** update the dev journal in Obsidian before committing.
- **Vault name:** `Obsidian Vault`
- **Progress file:** `Progress.md` — summary-level entries only. Short bullet points with date, what changed, commit ref, and a `[[wikilink]]` to the detailed session note. Keep this file scannable.
- **Session notes:** Create a separate file per work session, named like `2026-02-16 Phase 1 Foundation.md`. These contain the full details: what was built, design decisions, files changed, verification steps. Conversational tone.
- **Ideas section:** Update "Ideas & Future Work" in `Progress.md` when new ideas come up or items are completed (strikethrough done items).
- Write in markdown. No frontmatter needed.
