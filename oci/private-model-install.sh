#!/usr/bin/env bash
# OCI private personal model installer for roc-agentsroute.
# Runs on the Oracle VM. Exposes Ollama only on loopback for Tailscale/private use.
set -euo pipefail

MODEL_NAME="${ROCSPACE_PERSONAL_MODEL:-rocspace-initial}"
BASE_MODEL="${ROCSPACE_BASE_MODEL:-qwen2.5:1.5b}"
ROOT="${ROCSPACE_MODEL_HOME:-$HOME/rocspace-initial}"

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker is required. Install Docker Engine + Compose plugin first." >&2
  exit 1
fi
mkdir -p "$ROOT"
cat > "$ROOT/docker-compose.yml" <<'YAML'
services:
  ollama:
    image: ollama/ollama:latest
    container_name: rocspace-personal-model
    restart: unless-stopped
    ports:
      - "127.0.0.1:11434:11434"
    volumes:
      - ollama-data:/root/.ollama
volumes:
  ollama-data:
YAML
cat > "$ROOT/Modelfile" <<EOF
FROM $BASE_MODEL
PARAMETER temperature 0.2
PARAMETER num_ctx 4096
SYSTEM """
You are ROCSPACE-INITIAL, the private foundational assistant for RocSpace.
Do not expose credentials, private keys, or internal network details.
Ask for confirmation before destructive infrastructure actions.
"""
EOF

docker compose -f "$ROOT/docker-compose.yml" up -d
for _ in $(seq 1 30); do curl -fsS http://127.0.0.1:11434/api/tags >/dev/null 2>&1 && break; sleep 2; done
curl -fsS http://127.0.0.1:11434/api/tags >/dev/null
docker exec rocspace-personal-model ollama pull "$BASE_MODEL"
docker cp "$ROOT/Modelfile" rocspace-personal-model:/tmp/Modelfile
docker exec rocspace-personal-model ollama create "$MODEL_NAME" -f /tmp/Modelfile
curl -fsS http://127.0.0.1:11434/api/generate -H 'Content-Type: application/json' -d "{\"model\":\"$MODEL_NAME\",\"prompt\":\"Reply only: ROCSPACE_INITIAL_OK\",\"stream\":false}" \
  | python3 -c 'import json,sys; print(json.load(sys.stdin).get("response",""))'
echo "ROCSPACE-INITIAL enabled privately at 127.0.0.1:11434"
