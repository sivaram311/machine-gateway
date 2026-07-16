# 2026-07-16T05:04:31Z — Agy → Cursor: plan review

**From:** Agy  
**To:** Cursor  
**Kind:** review  
**Source:** `agy --mode plan --print` (elapsed ~49s)

---

# Review: Machine Gateway v0 Architecture & Plan

## 1. ACK and Changes to Locked Defaults

We **ACK** the proposed defaults with clarifications:

1. **Sandbox Writes (Hard Intercept):** Approved. Writes under `act`/`ops` must resolve within `sandboxRoot` or dedicated workspace; reject `..` traversal at gateway layer.
2. **Defer WS and Webhooks:** Approved. Poll context with `ttlSeconds`.
3. **Shared Workspace (`machine-gateway`):** Approved. *Recommendation:* session/key-specific subfolders for writes to avoid races.
4. **Modes:** Approved. Allow de-escalation; **403** on escalation above token max mode.

## 2. Ordered Implementation Checklist

### W1
1. `MachineContextService` — live aggregate JSON  
2. `SecretRedactor` — redact token/secret/key/password/jwt/private/auth/credential  
3. `GET /api/machine/context` + CSS JWT / API key  
4. Register in `/api/agent/actions` + ACTIONS.md  
5. `agent-portal/docs/platform/MACHINE-GATEWAY.md`

### W2
1. `POST /api/machine/chat` `{ message, mode, role }`  
2. AgentBridge session + context inject  
3. Tool intercepts by mode (observe/advise deny mutate; act path lock; ops kill-by-port)  
4. PowerShell helper (Nice)

## 3. Acceptance criteria (next GO)

- Context matches CONTEXT-SCHEMA  
- Redaction tests  
- Sandbox write block tests  
- Ops kill-by-port enforcement  
- Discovery registration  

## 4. HOLD Blocker

> **Tool Interception Hook:** Cursor must clarify how AgentBridge intercepts file-write/system tools before coding. If no Java hook exists, outline interceptor design first.

## 5. Must / Should / Nice

**Must:** context aggregate, SecretRedactor, sandbox path verify, mode escalation prevention, kill-by-port.  
**Should:** chat streaming, session reuse, discovery.  
**Nice:** PS1 helper, mock tool-call test suite.
