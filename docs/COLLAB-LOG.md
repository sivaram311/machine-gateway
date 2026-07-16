# Cursor ↔ Agy collaboration log

**Project:** machine-gateway  
**Rule:** Every Cursor↔agy exchange is logged here (or linked from `docs/collab/`) with ISO timestamps. Newest sessions at top of index.

| Session | Started (UTC) | Status | Index |
|---------|---------------|--------|-------|
| `2026-07-16-build-loop` | 2026-07-16T04:33:00Z | **Agy GO** | [collab/2026-07-16-build-loop/](collab/2026-07-16-build-loop/) |

## Conventions

1. One folder per build/review loop: `docs/collab/YYYY-MM-DD-<slug>/`
2. Files use timestamps in names: `HHMMSSZ-<actor>-<kind>.md` (actor = `cursor` | `agy`)
3. Kinds: `plan`, `prompt`, `response`, `decision`, `impl-note`, `review`, `go-nogo`
4. Do not wait for human confirmation; iterate until agy GO (or explicit HOLD with reason).
