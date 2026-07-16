# Agy FINAL GO — common Machine Gateway endpoint

| Field | Value |
|-------|-------|
| When | 2026-07-16 |
| Agy verdict | **FINAL GO** |
| Confirmations | USAGE at `docs/platform/`; ship as **0.1.13** with `H:\releases\agent-portal-0.1.13\evidence\` |

## Improvements folded in

1. Separate `MachineGatewayRequest` — optional `message` (not `@NotBlank` / not reuse of `MachineChatRequest` + `@Valid`)
2. `@RequestBody(required = false)` for context-only
3. Structured `{ context, chat }` response (not flat-merge into context map)
4. Register `POST /api/machine` in `AgentApiController` discovery

## Implemented

- `POST /api/machine` facade on `MachineController`
- `MACHINE-GATEWAY-USAGE.md` (no CORS section)
- Docs + discovery updates
- DEV smoke: context-only + with-message + discovery PASS
