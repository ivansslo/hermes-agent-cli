# ⚡ Hermes CLI v4.0

**Full AI Agent CLI for Termux** — Unified CLI from all ivansslo projects.

## Install (Termux)

```bash
pkg install curl -y
curl -sL https://raw.githubusercontent.com/ivansslo/hermes-agent-cli/main/hermes -o $PREFIX/bin/hermes
chmod +x $PREFIX/bin/hermes
hermes setup
```

## Quick Start

```bash
hermes chat          # Interactive AI chat
hermes ask "question" # Quick AI answer
hermes crew "topic"  # CrewAI research crew
hermes crawl <url>   # Web crawl → markdown
hermes scan          # Health-check all AI models
hermes status        # Check all connections
hermes links         # Show all live URLs
```

## Commands

### 🤖 AI
| Command | Description |
|---------|-------------|
| `hermes chat [model]` | Interactive AI chat with conversation |
| `hermes ask <question>` | Quick single question |
| `hermes crew [topic]` | Run CrewAI research crew (Researcher→Analyst→Writer) |
| `hermes crawl <url>` | Crawl URL to markdown |
| `hermes models` | List 17+ available models |
| `hermes scan` | Health-check all models with latency |

### 🔧 Manage
| Command | Description |
|---------|-------------|
| `hermes setup` | First-time setup + connection test |
| `hermes config [key] [val]` | View/set configuration |
| `hermes status` | Check all connections (CF, Cloud Run, AI, GitHub) |
| `hermes links` | Show all live URLs |

### 📦 Git & Deploy
| Command | Description |
|---------|-------------|
| `hermes clone [repo]` | Clone/sync repos from GitHub |
| `hermes push [repo] [msg]` | Push changes |
| `hermes deploy cf` | Deploy to Cloudflare Workers |
| `hermes deploy firebase` | Deploy to Firebase Hosting |

### 📱 Termux
| Command | Description |
|---------|-------------|
| `hermes install-deps` | Install python, nodejs, wrangler, firebase-tools |
| `hermes update` | Update CLI to latest |

## AI Providers

| Provider | Models | Speed |
|----------|--------|-------|
| ⚡ Groq | Llama 3.3 70B, Qwen3, Scout, GPT-OSS, Compound | Ultra-fast |
| 🌐 OpenRouter | Gemini 2.5, GPT-4o, Claude, DeepSeek R1 | Fast |
| 💎 Gemini | 2.5 Flash, 2.5 Pro (direct) | Fast |
| ☁️ Gateway | All models via Hermes Gateway | Depends |

## Integrated Projects

- [Solace-Hermes-Project](https://github.com/ivansslo/Solace-Hermes-Project) — CF Workers Gateway
- [ai-vitality](https://github.com/ivansslo/ai-vitality) — AI Studio + Firebase
- [roadfx-full-stack](https://github.com/ivansslo/roadfx-full-stack) — Express + Firebase
- [roadfx-ai-stack](https://github.com/ivansslo/roadfx-ai-stack) — Worker UI
- [solace-crewai-cli](https://github.com/ivansslo/solace-crewai-cli) — CrewAI
- [Cloud Run](https://ai-vitality-819208434965.us-west1.run.app) — Live app

## Config

Keys stored in `~/.hermes/.keys`:
```
TOKEN=hk-rocspace-2026
GROQ_KEY=gsk_...
OR_KEY=sk-or-v1-...
GEMINI_KEY=AIzaSy...
GITHUB_PAT=github_pat_...
DEFAULT_MODEL=llama-3.3-70b-versatile
DEFAULT_PROVIDER=groq
```
