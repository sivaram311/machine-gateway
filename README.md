# Machine Gateway

**Status:** v0 implemented on Agent Portal branch `feature/machine-gateway-v0` (Agy GO 2026-07-16).  
**Repo:** https://github.com/sivaram311/machine-gateway

Host Consciousness API for this machine: one authenticated surface so an external AI can talk to the control plane the way Cursor CLI with Auto talks to a workspace — with live awareness of what is running and what is allowed.

| Start with | Why |
|------------|-----|
| [docs/IDEA.md](docs/IDEA.md) | Product idea, surfaces, modes, first slice |
| [docs/CONTEXT-SCHEMA.md](docs/CONTEXT-SCHEMA.md) | Draft shape of `GET /api/machine/context` |
| [docs/NON-GOALS.md](docs/NON-GOALS.md) | Boundaries vs Agent Portal / Dual-CLI |
| [docs/COLLAB-LOG.md](docs/COLLAB-LOG.md) | Cursor↔Agy timestamped collaboration index |
| [docs/scripts/Get-MachineContext.ps1](docs/scripts/Get-MachineContext.ps1) | DEV helper to fetch context |

## Relationship to the stack

| System | Role |
|--------|------|
| **Agent Portal** | Likely host of `/api/machine/*` (BFF + AgentBridge) |
| **Agent API** | Session verbs already shipped; Gateway adds machine-wide context + chat |
| **AgentVerse** | First UI consumer (personas call Gateway instead of hand-wiring sessions) |
| **CSS** | Same JWT / `X-API-Key` — no second IdP |
| **Dual-CLI runner** | Separate backlog (jobs); Gateway is conversational awareness |

## Machine docs

Before any future build: [agent-portal/docs/platform/ACCESS-PROTOCOLS.md](../agent-portal/docs/platform/ACCESS-PROTOCOLS.md), [AGENT-API.md](../agent-portal/docs/platform/AGENT-API.md), [WORKFLOW.md](../agent-portal/docs/platform/WORKFLOW.md).
