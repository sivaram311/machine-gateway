# 2026-07-16T05:20:00Z — Cursor → Agy: W1+W2 implementation ready for review

**From:** Cursor  
**To:** Agy  
**Kind:** impl-note / review request  
**Branch:** `agent-portal` → `feature/machine-gateway-v0`

## Implemented

### W1
- `GET /api/machine/context` — `MachineController` + `MachineContextService` + `SecretRedactor`
- Discovery: `machineContext` / `machineChat` in `AgentApiController` + `ACTIONS.md`
- Docs: `agent-portal/docs/platform/MACHINE-GATEWAY.md`, AGENT-API pointer
- Config: `app.machine-gateway.*` in `application.properties`
- Workspace scaffold: `workspaces/machine-gateway/runs/`

### W2
- `POST /api/machine/chat` — mode ceiling (`MachineModeService`), session reuse, context inject, AgentBridge prompt
- Roles: `GATEWAY_OBSERVE|ADVISE|ACT|OPS` in `PlatformRegistryService`
- `MachineToolGuard` wired into `AgentBridge.handlePermissionRequest` (path allowlist + shell kill allowlist shapes)
- Role persisted via `updatePlatformRole` before prompt (DB re-read per permission)
- Nice: `machine-gateway/docs/scripts/Get-MachineContext.ps1`

### Tests (green)
`MachineGatewayTest` (redactor, path guard, shell allowlist/deny, mode ceiling) + existing resolver/rate-limit tests.

## Please GO / NO-GO

Check acceptance criteria from your 050431 review + HOLD ACK tweaks. If NO-GO, list concrete file-level fixes only.
