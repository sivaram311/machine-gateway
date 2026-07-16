# Non-goals

**Status:** Binding for the idea phase. Update if product scope changes.

## Not this project

| Non-goal | Why |
|----------|-----|
| Replace Agent API session verbs | Gateway *assembles* and *chats*; Keep/Restore, files, permissions stay on existing routes |
| Replace Dual-CLI promote/incident job runner | Jobs ≠ conversation; keep `dual-cli-subagent-workflow` separate |
| New identity provider | CSS only (`clientId` + JWT / API key) |
| Unbounded host shell as default | `act` / `ops` go through AgentBridge + role ACL + sandbox |
| Mass process kill helpers | ACCESS-PROTOCOLS: kill by LocalPort PID only |
| Silent prod promote | Still VERSIONING-PROMOTE + evidence; Gateway may *advise* or *trigger pipelines*, not skip gates |
| Move machine markdown out of git repos | Indexes stay; no mass-move of docs |
| Long-lived second agent daemon (v0) | First slice reuses Portal AgentBridge; dedicated workers are a later decision |

## Explicitly deferred

- Full event bus beyond optional `WS /api/machine/events`
- Dedicated Postgres `machine_context` tables (compose from live APIs first)
- Multi-host federation (this idea is **this** Windows control plane)

## Doc ownership

Idea docs live in this folder (`machine-gateway/docs/`). When implementation starts on Agent Portal, add a short pointer under `agent-portal/docs/platform/` and keep this repo/folder as the product home unless merged by explicit decision.
