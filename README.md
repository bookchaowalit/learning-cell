# solo-learning

The Learning cell: its own API (Railway, serverless) and its own Neon
database, made from `cell.yaml` with [solo-cell-kit](../solo-cell-kit). It
reuses empire-platform for identity, authorization, executions and audit over
HTTP with the caller's token.

| | |
|---|---|
| API | Railway project `solo-learning`, service `learning-api` (Serverless) |
| Data | Neon project `solo-learning`, database `learning` |
| Registry | solo-empire `repository-catalog/registries/online-systems.yaml` (`learning`) |

## API

Every resource has list, stats, get, get-by-legacy-id, create, patch and delete
(see `cellkit/app.py`). Permissions are `learning.<resource>:read|write|delete`.

| Path | Resource | Filters |
|---|---|---|
| `/v1/challenges` | challenge | `challenge_type`, `category` |
| `/v1/challenge-assignments` | challenge-assignment | `challenge_id`, `status` |

## Develop and operate

```bash
uv venv .venv && uv pip install --python .venv/bin/python -e ".[dev]"
.venv/bin/pytest -q
NEON_API_KEY=... .venv/bin/learning-db provision
npm install && railway config apply && railway up --ci --service learning-api
railway scale --service learning-api asia-southeast1-eqsg3a=1 us-east4-eqdc4a=0   # next to Neon and the platform
```

Railway variables: `LEARNING_DB_MODE=hosted`, `LEARNING_DB_URL_API`,
`LEARNING_JWT_PUBLIC_KEY_PEM`, `LEARNING_JWT_ISSUER`, `EMPIRE_PLATFORM_URL`.
