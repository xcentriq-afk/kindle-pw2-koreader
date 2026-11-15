# Optional KUAL extensions

After KUAL is installed, homebrew lives in the `extensions/` folder at the
Kindle root — each subfolder with a `menu.json` becomes a KUAL menu entry.
Do **not** delete `MRInstaller` or `koreader`; they are required.

## Recommended

| Extension | What it does | Install |
|---|---|---|
| **BatteryStatus** | Battery percentage on the status bar | copy `extensions/BatteryStatus/` to root |
| **KUAL+** (`KUAL-add-ons`) | Extra KUAL menu helpers | copy `extensions/KUAL-add-ons/` to root |
| **USBNetwork** | System-level SSH over USB/Wi-Fi | `.bin` into `mrpackages/`, run `;log mrpi` |
| **ScreenSavers** (`linkss`) | Custom lock-screen images | `.bin` into `mrpackages/`, run `;log mrpi` |

## ScreenSavers (linkss) — usage

1. Install `Update_linkss_0.25.N_install_pw2_and_up.bin` via `;log mrpi`.
2. Put your PNG images (758×1024 for PW2) into `linkss/screensavers/` on the drive.
3. KUAL → **Screen Savers** → **Restart framework now**.

> Python (104 MB) is required **only** for the "book cover as screensaver"
> feature (`cover` blank file in `linkss/`). Plain custom images work without it.

## USBNetwork (SSH) — see SSH.md

Power-user tool. Read `docs/SSH.md` before installing; KOReader already ships
a simpler built-in SSH server for file transfer.
