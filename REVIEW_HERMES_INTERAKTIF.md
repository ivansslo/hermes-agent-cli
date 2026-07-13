# Review Hermes Interaktif — Code Commands + Active Agent

Tanggal review: 2026-07-13
Repo: `roc-agentsroute`
Versi hasil update: `v5.5.0 Omni`

## Ringkasan

Hermes CLI sekarang sudah punya mode interaktif coding yang lebih dekat dengan pengalaman `hermes-agent`, tapi tetap ringan untuk Termux/bash CLI. Fokus utama update ini adalah:

- command interaktif untuk coding,
- active AI agent untuk complex task,
- runtime `python3_venv`,
- syntax highlighting responsif memakai `pygments`,
- render markdown memakai `rich`,
- dukungan run/debug/fix/refactor/test dari satu mode.

## File yang berubah

```text
README.md   | dokumentasi command baru
hermes      | fitur utama interactive code commands
install.sh  | setup python3_venv otomatis
```

Stat perubahan terakhir:

```text
3 files changed, 527 insertions(+), 166 deletions(-)
```

## Command baru di level CLI

```bash
hermes coding
hermes agent <complex coding task>
hermes code-agent <complex coding task>
hermes venv init
hermes venv status
hermes venv pip <package>
hermes python3_venv status
```

## Tampilan help setelah update

```text
AI & Chat:
  chat [model] [provider]    Interactive AI chat
  coding                     Interactive code commands (/run /agent /venv /sh)
  agent <task>                Active multi-step code agent (read/write/run)
  venv [init|status|pip]      Manage Hermes python3_venv for responsive syntax
  studio [open|chat|status]   AI Studio (projects + Gemini chat)
  ask <question>              Quick question (non-interactive)
  code <description>          Generate code from description
```

## Mode `hermes coding`

Saat menjalankan:

```bash
hermes coding
```

Hermes menampilkan workspace aktif, path venv, dan daftar slash commands.

### Core commands

```text
/agent <task>     Active multi-step AI coding agent
/run              Run current code; Python memakai python3_venv
/debug            AI debug current code
/refactor         AI refactor current code
/fix              AI fix current code
/test             AI generate tests
/explain          Explain current code
```

### File dan shell commands

```text
/file <path>      Load file ke context
/save [path]      Save context saat ini
/apply [path]     Save last AI code block
/preview          Syntax-highlight current code
/sh <command>     Run shell command di workspace
/cd <dir>         Change workspace
/ls [dir]         List files
/tree             Find tree sederhana
```

### Runtime commands

```text
/venv init|status|pip <pkg>  Manage python3_venv
/lang <lang>                 Set language
/clear                       Clear context
/exit                        Exit
```

## Active Agent Review

Command:

```bash
hermes agent "audit repo ini, cari bug, perbaiki, lalu jalankan test"
```

atau dari interactive mode:

```text
/agent audit repo ini, cari bug, perbaiki, lalu jalankan test
```

Agent bekerja dalam loop beberapa langkah:

1. scan file workspace,
2. minta AI menentukan aksi berikutnya dalam JSON,
3. mendukung action:
   - `shell`
   - `read`
   - `write`
   - `done`
4. menjalankan command/test,
5. menulis file jika perlu,
6. berhenti saat task selesai atau max step tercapai.

Environment yang bisa diatur:

```bash
export HERMES_CODE_WORKSPACE=$PWD
export HERMES_AGENT_STEPS=10
export HERMES_AGENT_CMD_TIMEOUT=120
export HERMES_RUN_TIMEOUT=120
```

## python3_venv Review

Venv default:

```text
~/.hermes/python3_venv
```

Command setup:

```bash
hermes venv init
```

Package yang diinstall:

```text
rich
pygments
prompt_toolkit
requests
```

Fungsi:

- Python `/run` memakai interpreter dari venv.
- `/preview` memakai Pygments jika tersedia.
- output AI markdown dirender memakai Rich jika tersedia.
- package tambahan bisa dipasang dengan:

```bash
hermes venv pip numpy pandas pytest
```

## Hasil test lokal

Sudah dites:

```bash
bash -n roc-agentsroute/hermes
bash -n roc-agentsroute/install.sh
DISABLE_OWNER_CHECK=true bash roc-agentsroute/hermes version
DISABLE_OWNER_CHECK=true bash roc-agentsroute/hermes venv init
DISABLE_OWNER_CHECK=true bash roc-agentsroute/hermes venv status
DISABLE_OWNER_CHECK=true bash roc-agentsroute/hermes coding
```

Hasil:

```text
Hermes v5.5.0 (Omni)
venv created successfully
rich OK
pygments OK
prompt_toolkit OK
requests OK
/run Python OK
/preview syntax highlight OK
```

## Contoh workflow

```bash
hermes venv init
hermes coding
```

Di dalam Hermes:

```text
/cd ~/project
/file app.py
/preview
/run
/fix
/apply app.py
/run
/agent tambah fitur login sederhana dan jalankan test
```

## Catatan penting sebelum push publik

Ada beberapa value credential/API key yang terlihat hardcoded di file `hermes` dari versi sebelumnya. Sebelum publish ke GitHub public, sebaiknya:

1. pindahkan secret ke `~/.hermes/.keys`,
2. hapus default token dari script,
3. pakai placeholder seperti `${GITHUB_PAT:-}` saja,
4. rotate token yang pernah ter-commit.

## Status akhir

Fitur Hermes interaktif sudah siap untuk dicoba dan dipush setelah security cleanup.

Recommended commit:

```bash
cd /home/user/roc-agentsroute
git add hermes install.sh README.md REVIEW_HERMES_INTERAKTIF.md
git commit -m "add interactive code commands and python3_venv runtime"
git push
```
