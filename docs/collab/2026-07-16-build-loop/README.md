# Build loop 2026-07-16 — Machine Gateway v0

**Status:** Agy GO (2026-07-16) — see [collab/2026-07-16-build-loop/](collab/2026-07-16-build-loop/)  
**Started:** 2026-07-16T04:33:00Z  
**Actors:** Cursor (implementer) · Agy (reviewer / recommender)

## Goal

Ship Machine Gateway v0 on Agent Portal:

1. `GET /api/machine/context` (live snapshot + secret redaction)
2. `POST /api/machine/chat` (AgentBridge + Auto + injected context + modes)
3. Discoverable via `/api/agent/actions` + docs
4. Must security: redaction, sandbox write lock, kill-by-port-only, mode scoping

## Locked defaults (Cursor, pending Agy confirm)

| Question | Decision for v0 |
|----------|-----------------|
| Sandbox writes | **Hard intercept** — reject writes outside sandbox/workspace |
| WS vs webhooks | **Defer** both; polling + context TTL for v0 |
| Chat workspace | Dedicated **`machine-gateway`** workspace under portal workspaces (shared, not per-chat worktree) |
| Dual-CLI | Out of scope |
| New IdP | No — CSS JWT / X-API-Key only |
| New ports | None — reuse portal `:8080` |

## Wave hire map

| Wave | Lanes | Notes |
|------|-------|-------|
| W0 | Architect contract | This loop with Agy |
| W1 | Context ∥ Security ∥ Docs | Parallel after Agy plan ACK |
| W2 | Chat ∥ Client | After W1 green |
| W3 | AV / UI tester | Nice; after W2 |

## Exchange index

| Time (UTC) | File | Summary |
|------------|------|---------|
| 2026-07-16T04:33:00Z | [043300Z-cursor-plan.md](043300Z-cursor-plan.md) | Initial plan to Agy |
| 2026-07-16T05:04:31Z | [050431Z-agy-review.md](050431Z-agy-review.md) | ACK defaults; W1/W2 checklist; HOLD on tool hook |
| 2026-07-16T05:06:00Z | [050600Z-cursor-hold-resolution.md](050600Z-cursor-hold-resolution.md) | AgentBridge + GATEWAY_* + MachineToolGuard design |
| 2026-07-16T05:06:30Z | [050630Z-agy-hold-ack.md](050630Z-agy-hold-ack.md) | ACK HOLD; must-fix path/shell allowlist tweaks |
| 2026-07-16T05:07:00Z | (impl) | Cursor implements W1+W2 on `feature/machine-gateway-v0` |
| 2026-07-16T05:20:00Z | [052000Z-cursor-impl-ready.md](052000Z-cursor-impl-ready.md) | Impl ready for review |
| 2026-07-16T05:14:50Z | [051450Z-agy-go.md](051450Z-agy-go.md) | **GO** (+ Should path keys / recentMessages / MVC tests) |
| 2026-07-16T05:16:00Z | (impl) | Cursor applied Should path keys + recentMessages |

| 2026-07-16T05:20:00Z | [052000Z-cursor-compliance-check.md](052000Z-cursor-compliance-check.md) | Ports/CF/promote compliance ask |
| 2026-07-16T05:21:46Z | [052146Z-agy-compliance-go.md](052146Z-agy-compliance-go.md) | **Compliance GO**; PR next gate |

**Status:** Agy **GO** (impl + compliance) — open PR for Reviewer.
