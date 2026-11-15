# Jailbreak a Kindle Paperwhite 2 (5.12.2.2) + KOReader — step-by-step

Tested on a PW2 (6th gen), firmware **5.12.2.2**. Method: **WatchThis**
(offline, no Amazon account). After the jailbreak: Universal Hotfix → MRPI →
KUAL → KOReader.

> Read the WHOLE guide before you start. The factory reset wipes everything,
> so the backup (Step 0) is mandatory.

## Table of contents

1. [Step 0 — Backup](#step-0--backup)
2. [Step A — Reset and demo mode](#step-a--reset-and-demo-mode)
3. [Step B — Install the jailbreak](#step-b--install-the-jailbreak)
4. [Step C — WatchThis hotfix](#step-c--watchthis-hotfix)
5. [Step D — Universal Hotfix](#step-d--universal-hotfix)
6. [Step E — MRPI + KUAL](#step-e--mrpi--kual)
7. [Step F — KOReader](#step-f--koreader)
8. [What next](#what-next)

---

## Step 0 — Backup

WatchThis factory-resets the device. Copy off the Kindle drive:

- the `documents/` folder (books + `.sdr` folders with annotations/progress),
- the `fonts/` folder (custom fonts).

Automatic: `./scripts/backup.sh /d` (or wherever the Kindle mounts).

## Step A — Reset and demo mode

The whole UI will be in English; you can switch back to your language at the end.

1. On the Kindle: Settings → Menu → **Reset device** (factory reset).
2. At first-run setup set the language to **English (United Kingdom)**.
3. At the Wi-Fi screen: pick any network and **back out** (skip registration).
4. In the search bar type `;enter_demo` and confirm.
   - *Typing it does NOT reboot* — it only sets a flag.
5. Reboot manually: hold the power button ~15 s (or Settings → Restart).
6. After the reboot the Kindle enters demo mode.
7. Skip Wi-Fi; at "store registration" enter anything (e.g. `aaa`).
8. Skip searching for a "demo payload".
9. Pick the **standard** demo type.
10. Press **Done** at the sideload prompt (do NOT sideload anything yet).
11. Bypass the "misconfiguration" lockout with the secret gesture: **two
    fingers on the bottom-right, then swipe left** (may take a few tries;
    video: youtube.com/watch?v=JzuIGbGPpig).
12. In the search bar type `;demo` → demo menu → **Sideload Content**.

## Step B — Install the jailbreak

1. Connect the Kindle to the PC. *If the drive doesn't show up, type `;uzb`
   (enables USB mode in demo mode).*
2. At the Kindle root create a `.demo` folder.
3. Copy `PW2-5.12.2.2.zip` (**do not extract**) and `demo.json` into `.demo`.
4. Inside `.demo` create an **empty** folder named `goodreads` (no files).
5. Safely eject, unplug, then press **Done** on the Kindle.

> `Application Error` at Done/Exit is **EXPECTED** — the jailbreak script is
> installing and crashes the demo app. Do NOT re-copy the files. Recover:
> hold power 15+ s (hard reboot), then `;demo` → Sideload Content → **Done**
> again (WITHOUT USB, without re-copying).

6. Exit the demo menu.
7. **On the PW2 press the STORE button** (other models use `;dsts`).
   - *"updating" is a demo/content update, NOT a firmware update (no Wi-Fi).*
8. **Help & User Guides** → **Get Started**.
9. The Kindle reboots and the script runs (scrolling text on the boot screen).
10. After the script the device is jailbroken but **STILL in demo mode** — that
    is correct; it only exits demo mode via the hotfix in Step C.

## Step C — WatchThis hotfix

1. In the search bar type `;uzb` (USB mode).
2. Connect, copy `Update_hotfix_watchthis_custom.bin` to the Kindle **root**.
3. Eject, unplug.
4. Type `;dsts` → Settings → ⋮ menu → **Update Your Kindle**.
5. Installs the hotfix, **exits demo mode**, cleans up. Reboot.

After the reboot you're on the normal home screen. The jailbreak is done.

## Step D — Universal Hotfix

KUAL and homebrew will NOT work without the Universal Hotfix (a different file
from the Step C hotfix).

1. Copy `Update_hotfix_universal.bin` to the Kindle **root**.
2. Eject, unplug.
3. Settings → ⋮ menu → **Update Your Kindle**. Reboot.
4. In the Library a **Run Hotfix** item appears — tap it (runs the hotfix).

## Step E — MRPI + KUAL

1. Copy the `extensions/` and `mrpackages/` folders (from MRPI) to the **root**.
2. Copy `Update_KUALBooklet_c6ac782_install.bin` into `mrpackages/`.
3. Eject, unplug.
4. In the search bar type `;log mrpi` and confirm.
   - You'll see "Hush, little baby..." at the bottom → it installs KUAL.
5. **KUAL** appears in the Library — tap it to open the menu.

> Don't use PEKI (archived; `KUAL.sh` silently fails on PW2).
> Don't use the `HDRepack` or `khf` variants (they target hard-float ≥5.16.3).

## Step F — KOReader

1. Copy the `koreader/` and `extensions/koreader/` folders to the **root**.
2. Eject, unplug.
3. KUAL → **KOReader** → **Start KOReader (no framework)** (best on PW2, low RAM).

## What next

- **Language**: KOReader → top menu → gear → Language → your language.
- **Books**: drop EPUBs into a `books/` folder (KOReader reads them natively).
  KOReader does not do USB transfer while running — close it first.
- **Extensions** (BatteryStatus, KUAL+, USBNetwork/SSH, ScreenSavers):
  see [EXTENSIONS.md](EXTENSIONS.md) and [SSH.md](SSH.md).

## Command cheat sheet

| Command | Does |
|---|---|
| `;enter_demo` | sets the demo-mode flag (then reboot manually) |
| `;demo` | opens the demo menu |
| `;uzb` | enables USB mode (demo mode) |
| `;dsts` | jumps to Settings |
| `;log mrpi` | runs the package installer (MRPI) |
| `;exit_demo` | exits demo mode when stuck |

## If something goes wrong

- Reset from demo mode: `;uzb`, create an empty `DO_FACTORY_RESTORE` file at the
  root, reboot.
- Official source: kindlemodding.org/jailbreaking/Legacy/WatchThis/
- Help: KindleModding Discord, reddit r/kindlejailbreak, MobileRead.
