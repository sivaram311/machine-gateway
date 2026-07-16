# Machine context — draft schema

**Status:** Draft for `GET /api/machine/context`. Subject to change when implemented.

Purpose: one JSON snapshot an external AI (or chat bootstrap) can trust as “what this host knows right now.”

## Response sketch

```json
{
  "generatedAt": "2026-07-16T04:24:00Z",
  "ttlSeconds": 15,
  "host": {
    "controlPlane": "E:\\MyWorkspace",
    "standingOrders": "E:\\MyAgent\\workflow",
    "publicZone": "delena.buzz"
  },
  "env": {
    "default": "DEV",
    "urls": {
      "devUi": "https://delena.buzz",
      "devApi": "https://delena.buzz/api",
      "css": "https://css-next.delena.buzz"
    }
  },
  "docs": {
    "agentsEntry": "E:\\MyWorkspace\\AGENTS.md",
    "platformHandbook": "agent-portal/docs/platform/",
    "indexes": [
      "agent-portal/docs/platform/indexes/INDEX-MYWORKSPACE.md",
      "agent-portal/docs/platform/indexes/INDEX-SOURCE.md"
    ]
  },
  "ports": {
    "source": "/api/platform/ports",
    "leases": []
  },
  "sessions": {
    "activeCount": 0,
    "items": []
  },
  "platform": {
    "openTasks": [],
    "runningPipelines": [],
    "recentMessages": [],
    "orgSummary": null
  },
  "health": {
    "portalApi": "unknown",
    "css": "unknown"
  },
  "rules": {
    "killByPortOnly": true,
    "sandboxRoot": "E:\\MyWorkspace\\sandbox",
    "noSecondIdp": true
  }
}
```

## Field notes

| Block | Source of truth (today) |
|-------|-------------------------|
| `host` / `docs` | MACHINE-MAP, ACCESS-PROTOCOLS, MyWorkspace README |
| `ports` | `/api/platform/ports` (+ doc registry) |
| `sessions` | `/api/sessions` (non-archived, recent) |
| `platform` | tasks, pipelines/runs, messages, org home |
| `health` | `/api/health` + CSS reachability if cheap |
| `rules` | Hard-coded echoes of ACCESS-PROTOCOLS — not optional hints |

## Auth

Same as Agent API mutating/read platform routes: CSS Bearer and/or `X-API-Key`. Prefer redacting secrets and env file contents always.

## Chat injection

`POST /api/machine/chat` should refresh (or reuse a fresh) context blob and prepend a compact form to the provider prompt together with guidance packs — same pattern as Portal guidance materialization, not a second prompt system.
