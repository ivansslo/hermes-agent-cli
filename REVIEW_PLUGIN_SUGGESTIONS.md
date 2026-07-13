# Review Plugin Suggestions Hermes — `/` dan `#`

Tanggal: 2026-07-13
Versi: `Hermes v5.6.0 Omni`

## Tujuan

Menambahkan plugin/suggestion system agar saat chat interaktif atau multi-agent chat, user bisa mengetik `/` atau `#` dan mendapatkan suggestion command/tag seperti di agent CLI modern.

## Fitur yang ditambahkan

### 1. Command baru

```bash
hermes plugins init
hermes plugins list
hermes plugins add /custom-command
hermes plugins add '#custom-tag'
hermes plugins path
```

Alias:

```bash
hermes plugin ...
```

### 2. Prompt interaktif dengan suggestion

Input interaktif sekarang memakai `prompt_toolkit` jika tersedia di `python3_venv`.

Aktif di mode:

```bash
hermes chat
hermes coding
hermes studio
hermes studio chat
```

Saat user mengetik:

```text
/
```

akan muncul suggestion seperti:

```text
/model
/provider
/system
/clear
/save
/agent
/crew
/research
/plan
/file
/run
/fix
/debug
/refactor
/test
```

Saat user mengetik:

```text
#
```

akan muncul suggestion tag seperti:

```text
#multi-agent
#researcher
#planner
#coder
#reviewer
#tester
#debug
#fix
#security
#performance
```

### 3. Plugin file system

Plugin suggestion disimpan di:

```text
~/.hermes/plugins/*.commands
```

Contoh file:

```text
~/.hermes/plugins/multi-agent.commands
~/.hermes/plugins/code.commands
~/.hermes/plugins/custom.commands
```

Format isi file:

```text
/agent
/research
/plan
#multi-agent
#coder
#reviewer
```

### 4. Installer update

`install.sh` sekarang:

- membuat `~/.hermes/plugins`,
- membuat plugin default `multi-agent.commands`,
- tetap membuat `~/.hermes/python3_venv`,
- install `prompt_toolkit`, `rich`, `pygments`, `requests`.

## Cara pakai

Setup sekali:

```bash
hermes venv init
hermes plugins init
```

Mulai chat:

```bash
hermes chat
```

Lalu ketik `/` atau `#` dan gunakan Tab/arrow untuk memilih suggestion.

Untuk multi-agent style:

```text
/agent buatkan rencana refactor repo ini
#planner susun langkah
#coder implementasikan
#reviewer cek bug dan security
#tester jalankan test
```

## Test yang sudah dilakukan

```bash
bash -n hermes
bash -n install.sh
DISABLE_OWNER_CHECK=true bash hermes version
DISABLE_OWNER_CHECK=true HERMES_DIR=/home/user/.test_suggest bash hermes plugins init
DISABLE_OWNER_CHECK=true HERMES_DIR=/home/user/.test_suggest bash hermes plugins list
```

Hasil:

```text
Hermes v5.6.0 (Omni)
Installed suggestion plugins
Built-in suggestions tampil
Plugin files tampil
Syntax OK
```

## Catatan teknis

Jika terminal tidak interaktif atau `prompt_toolkit` belum terinstall, Hermes otomatis fallback ke `read -r` biasa, jadi script tetap kompatibel dengan pipeline/non-interactive mode.

Untuk memastikan suggestion aktif:

```bash
hermes venv status
```

Pastikan `prompt_toolkit` statusnya OK.

## Status

Selesai dan siap dicoba.
