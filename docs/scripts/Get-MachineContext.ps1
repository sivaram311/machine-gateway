# Get Machine Gateway context (DEV)

Requires Agent Portal API on :8080 and auth (CSS JWT or X-API-Key).

```powershell
param(
  [string]$BaseUrl = "http://127.0.0.1:8080",
  [string]$ApiKey = $env:AGENT_PORTAL_API_KEY,
  [string]$Bearer = $env:AGENT_PORTAL_TOKEN
)

$headers = @{}
if ($Bearer) { $headers["Authorization"] = "Bearer $Bearer" }
if ($ApiKey) { $headers["X-API-Key"] = $ApiKey }

Invoke-RestMethod -Uri "$BaseUrl/api/machine/context" -Headers $headers | ConvertTo-Json -Depth 8
```
