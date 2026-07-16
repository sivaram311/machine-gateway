# Machine Gateway — product idea

**Status:** Draft idea (captured 2026-07-16). Not implemented.  
**Working name:** Machine Gateway · **Product label:** Host Consciousness API  
**Folder:** `E:\MyWorkspace\machine-gateway`

## Problem

External AIs can already drive Agent Portal via [Agent API](../../agent-portal/docs/platform/AGENT-API.md): create sessions, prompt Cursor/Antigravity, use platform ports/tasks/memory. That contract is still **fragmented**.

Today an outsider must:

1. Read `ACCESS-PROTOCOLS`, `MACHINE-MAP`, indexes, and project READMEs.
2. Call many endpoints (`/api/sessions`, `/api/platform/*`, health, …).
3. Create a provider session and stuff context into the prompt by hand.

Agent Portal UI and AgentVerse already *feel* like “talk to the machine.” The missing piece is a **single machine-aware chat + context surface** for any external AI — the same mental model as Cursor CLI with **Auto** model, but scoped to this host’s control plane.

## Goal

One authenticated Gateway so an external AI:

- Knows what is happening on the machine (ports, sessions, pipelines, docs map).
- Can converse and (when allowed) act under role ACLs and sandbox rules.
- Does not invent a second IdP, second promote path, or second process-kill policy.

## Proposed surfaces

Hosted as a thin BFF on **Agent Portal** (same CORS / CSS JWT / `X-API-Key` story as Agent API), registered later in `ACTIONS.md` / OpenAPI.

| Surface | Role |
|---------|------|
| `GET /api/machine/context` | Read-only snapshot of live host/control-plane state. Cacheable ~5–30s. |
| `POST /api/machine/chat` | One-shot or streamed reply. Reuses/spawns Cursor (or Agy) via AgentBridge with **model=auto**, injects fresh context + guidance packs. |
| `WS /api/machine/events` (optional) | Push session/tool/pipeline ticks so clients stay synced without polling. |

### Chat flow (Cursor CLI Auto analogue)

```text
External AI (Grok / Claude / script / AgentVerse persona)
  → CSS auth (Bearer or X-API-Key)
  → POST /api/machine/chat { message, mode?, role? }
       → Portal builds MachineContext
       → AgentBridge: Cursor CLI, model=auto, auto-approve per existing flags
       → platformRole ACL (OPS / EM / QA / …)
       → Stream tokens + tool events back
```

Workspace default: dedicated `machine-gateway` (or control-plane) workspace under Agent Portal workspaces — not arbitrary prod trees.

## Modes (blast radius)

| Mode | Capabilities |
|------|----------------|
| `observe` | Context + docs pointers + list-style APIs only |
| `advise` | Observe + propose plans / write shared memory notes |
| `act` | Bound `platformRole` + sandbox/workspace tools (default for trusted keys) |
| `ops` | Narrow Ops role; still kill **by LocalPort PID only** — never mass-kill by process name |

## What it reuses (do not rebuild)

- AgentBridge (Cursor ACP / Antigravity)
- Guidance packs + `AGENTS.md` materialization
- Session `platformRole` + runtime ACL
- `AGENT_DEFAULT_AUTO_APPROVE` / permission gates
- Discovery pattern: extend `/api/agent/actions`
- Standing orders: `E:\MyAgent\workflow\`, platform handbook under `agent-portal/docs/platform/`

## Relationship to nearby work

| Piece | Relationship |
|-------|----------------|
| **Agent API** | Session verbs stay; Gateway is the machine-wide entry + context assembly |
| **AgentVerse** | Personas should call Gateway instead of hand-wiring session + prompt + context |
| **Dual-CLI subagent workflow** | Separate backlog — **jobs** (promote/incident). Gateway = **conversation + awareness**. Do not merge. |
| **Platform memory / messages / swarm** | Context snapshot and chat may read/write these under role ACL |

## First slice (when built)

1. Ship `GET /api/machine/context` only — prove external AIs stop guessing.
2. Ship `POST /api/machine/chat` → existing Cursor session + injected context (no new long-lived worker process).
3. Register in Agent API `ACTIONS.md` / OpenAPI; PowerShell client + AgentVerse “orchestrator” as first consumers.
4. Link from Agent Portal platform handbook (`AGENT-API.md` or a short `MACHINE-GATEWAY.md` pointer).

## Success criteria

- An external AI with one token can answer “what’s running / what’s blocked / what’s the next promote step” without scraping the UI.
- Chat with Auto feels like Cursor CLI in a well-documented repo, with **live** port/session/pipeline facts.
- ACCESS-PROTOCOLS remain binding; sandbox and promote gates unchanged.

## References

- [CONTEXT-SCHEMA.md](CONTEXT-SCHEMA.md) — draft context payload
- [NON-GOALS.md](NON-GOALS.md) — explicit boundaries
- [Agent API](../../agent-portal/docs/platform/AGENT-API.md)
- [Access protocols](../../agent-portal/docs/platform/ACCESS-PROTOCOLS.md)
- [Future implementation](../../agent-portal/docs/platform/FUTURE-IMPLEMENTATION.md) — Dual-CLI remains separate
- [Sub-agents roadmap](../../agent-portal/docs/platform/SUBAGENTS-ROADMAP.md)
- `E:\MyAgent\ideas\dual-cli-subagent-workflow.md`
