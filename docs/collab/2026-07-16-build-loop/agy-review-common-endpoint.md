# Review request for Agy — Machine Gateway common endpoint

**From:** Cursor (session machine-gateway)
**Need:** GO / HOLD / improvements. Do not implement — review only.
**If GO:** confirm we may implement POST /api/machine + MACHINE-GATEWAY-USAGE.md (no CORS section in the guide).

## Proposal

### Canonical endpoint
`POST /api/machine`

- Always returns redacted live `context` (same shape as `GET /api/machine/context`).
- If `message` present → also start chat via existing MachineChatService; return `chat: { sessionId, status: accepted, mode, platformRole, userMessage }`.
- If message omitted/blank → `chat: null` (context-only).

### Keep aliases (no break)
- `GET /api/machine/context`
- `POST /api/machine/chat`

### Auth (unchanged)
CSS JWT or X-API-Key. Mode ceiling / SecretRedactor / MachineToolGuard unchanged.

### Docs
New `agent-portal/docs/platform/MACHINE-GATEWAY-USAGE.md`:
- Base URLs, auth, POST /api/machine examples, poll messages/events or /ws, modes, aliases, ACCESS-PROTOCOLS pointer.
- **Explicitly NO CORS section** in this guide (auth is the gate; platform CORS already `*`).

### Constraints
- No new ports / DNS / Cloudflare subdomain
- REST only (no gRPC / no new WS in this change)
- Reuse existing services; thin facade on MachineController
- Ship as patch 0.1.13 Q1 after DEV smoke + reviewer GO

### Out of scope
Removing old routes; changing CORS config; Q2 PROD.

## Ask Agy
1. Verdict: **GO** or **HOLD** (with reasons)
2. Any further improvements to fold in before Cursor implements
3. Any confirmation you need from the human before Cursor proceeds
