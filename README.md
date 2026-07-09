# ⚡ Hermes Agent CLI v5.0.0 "Omni"

**Full AI Agent CLI for Termux** — integrates 100 repositories into one unified command-line tool.

## 🚀 Quick Install (Termux)

```bash
curl -s https://raw.githubusercontent.com/ivansslo/hermes-agent-cli/main/install.sh | bash
```

## 📖 Commands

```
hermes setup              # Interactive API key setup
hermes chat [model]       # Interactive AI chat (Groq/OpenRouter/Gemini/CF AI)
hermes ask <question>     # Quick question (non-interactive)
hermes code <desc>        # Generate code from description
hermes crew [topic]       # CrewAI multi-agent research
hermes embed <text>       # Voyage AI embedding
hermes crawl <url>        # Crawl URL to markdown
hermes firebase [action]  # Firebase Firestore operations
hermes models             # List all AI models
hermes status             # Full system health check
hermes deploy [worker]    # Deploy to existing CF Workers
hermes clone [repo|all]   # Clone repositories
hermes push [dir] [msg]   # Push to GitHub
hermes termux [action]    # Termux system tools
hermes links              # Show all URLs
hermes update             # Update CLI
```

## 🏗️ Projects Integrated

| Project | Description |
|---------|-------------|
| Solace-Hermes-Project | CF Workers Gateway (25+ endpoints) |
| ai-vitality | AI Studio + Firebase |
| roadfx-full-stack | Express + Firebase Hosting |
| roadfx-ai-stack | Worker UI (158KB) |
| solace-crewai-cli | CrewAI multi-agent |
| codex-master-ai-api | 15+ models API |
| hermes-agent | Python agent framework |
| droid-ai-toolkit | Android AI toolkit |
| crawl4ai | Web crawler |
| Cloud Run App | ai-vitality on GCP |

## 🔑 Supported Providers

- ⚡ **Groq** — Free, ultra-fast (Llama 3.3 70B, Qwen3 32B, etc.)
- 🌐 **OpenRouter** — 100+ models (GPT-4o, Claude, Gemini, DeepSeek)
- 💎 **Gemini** — Direct Google AI (2.5 Flash/Pro)
- ☁️ **CF AI** — Cloudflare AI Factory (60 models)
- 🔗 **Gateway** — Hermes Gateway proxy
- 🖥️ **Cloud Run** — GCP Cloud Run app

## 🌐 Endpoints

- Dashboard: `hermes-cloudflare.certveis.workers.dev/dashboard`
- Chat: `hermes-cloudflare.certveis.workers.dev/chat`
- Cloud Run: `ai-vitality-819208434965.us-west1.run.app`
- Firebase: `planning-with-ai-36675.web.app`

## 📱 Install on Termux

```bash
pkg install curl
curl -s https://raw.githubusercontent.com/ivansslo/hermes-agent-cli/main/install.sh | bash
hermes setup
hermes status
```

---

by Ivan Ssl (ivansslo) — v5.0.0 "Omni"
