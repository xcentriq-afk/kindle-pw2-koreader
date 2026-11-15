# Kindle Paperwhite 2 — Jailbreak + KOReader (WatchThis)

A complete, tested guide and toolkit for jailbreaking an Amazon Kindle
Paperwhite 2 (6th generation, firmware **5.12.2.2**) offline — no Amazon
account required — and installing KOReader, KUAL, and useful extensions.

This is the exact procedure that was executed end-to-end on a real device,
with every file checksum-verified and every step that needs your hands on the
e-ink screen spelled out.

## What you get

- **Jailbreak** via *WatchThis* (offline, no Amazon account, no Wi-Fi).
- **KOReader** — an open-source e-reader: EPUB/PDF natively, folder-based
  library, custom fonts, no Amazon telemetry.
- **KUAL** — the launcher that runs homebrew.
- Optional extensions: BatteryStatus, KUAL+, **USBNetwork (SSH)**,
  **ScreenSavers** (custom lock screens).

## Why this guide exists

The "easy" methods people recommend have traps that are not obvious:

- `KindleBreak` does **not** work on PW2/5.12.2.2 — that exact firmware
  version patches its exploit (the version number reads "older" than 5.13.3
  but is actually newer). You must use **WatchThis**.
- The WatchThis hotfix only exits demo mode; **KUAL/KOReader will not launch
  until you also install the Universal Hotfix.**
- The **PEKI** launcher is archived and its `KUAL.sh` fails silently on PW2 —
  use the classic KUAL booklet via MRPI instead.

## Prerequisites

- A PC (Windows/macOS/Linux). You cannot jailbreak from the device alone.
- A USB data cable.
- The ability to copy files and type short commands into the Kindle's search bar.
- ~20 minutes of tapping on the device.

## Files

| Directory / file | Purpose |
|---|---|
| `docs/INSTALL-EN.md` | Step-by-step guide (English) |
| `docs/INSTALL-PL.md` | Step-by-step guide (Polish) |
| `docs/FIRMWARE-TABLE.md` | Which jailbreak for which firmware |
| `docs/EXTENSIONS.md` | Optional KUAL extensions |
| `docs/SSH.md` | USBNetwork + KOReader SSH setup |
| `scripts/download.sh` | Download every file and verify checksums |
| `scripts/backup.sh` | Back up `documents/` + `fonts/` before the wipe |
| `scripts/stage-jailbreak.sh` | Stage WatchThis payload onto the Kindle |
| `scripts/stage-post.sh` | Stage hotfix + MRPI + KUAL + KOReader |
| `checksums.md` | SHA-256 of every file |
| `files/` | Small, hard-to-source binaries (bundled) |

## Quick start

```sh
# 1. Read the guide end-to-end first
# 2. Back up your books
./scripts/backup.sh /d          # or wherever the Kindle mounts

# 3. Jailbreak (WatchThis) — follow docs/INSTALL-PL.md on the device

# 4. Stage the post-jailbreak stack
./scripts/stage-post.sh /d

# 5. On the device: Update Your Kindle -> Run Hotfix -> ;log mrpi -> KUAL -> KOReader
```

## Disclaimer

Jailbreaking voids your warranty and can, in theory, brick the device if you
deviate from the steps. This guide was tested on one PW2/5.12.2.2 device and
follows the community-maintained [KindleModding wiki](https://kindlemodding.org).
No warranty. You own your device; you own the risk.

## Credits

The real work was done by the Kindle modding community — this repo only
documents it. See [NOTICE.md](NOTICE.md) for full attribution.
