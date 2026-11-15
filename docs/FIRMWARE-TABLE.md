# Which jailbreak for which firmware

The firmware version decides everything; the model generation is secondary.
Read the version straight off the mounted drive: `system/version.txt`
(e.g. `Kindle 5.12.2.2 (379151 038)`), or Settings → Device Options → Device Info.

| Method | Firmware | Account/Wi-Fi? | Notes |
|---|---|---|---|
| KindleBreak | 5.10.3–5.13.3 | No (offline) | **NOT 5.12.2.2** — that version patches it. Browser JPEG-XR overflow. |
| **WatchThis** | **5.12.2.2 (PW2/KT2 only)**; 5.13.4–5.14.2 | **No (offline)** | Factory reset + demo-mode payload. Used in this guide. |
| LanguageBreak | 5.14.3–5.16.2.1.1 | No (offline) | Best around 5.16.2. |
| WinterBreak | all ≤5.18.x (K5+) | Yes (registered + Wi-Fi) | Universal but needs an Amazon account. |
| AdBreak | 5.18.1–5.18.5.x | Yes (registered + ads) | Abuses ad screensaver handling. |
| Nosebleed | 5.18.6 | Yes | |
| SpringBreak | 5.19+ | Yes | |

> Numbering trap: `5.12.2.2` is *newer* than `5.13.3` despite reading older —
> it is the PW2's final/EOL firmware and specifically patches KindleBreak.

## KOReader build selection

| Package | Use for |
|---|---|
| `kindle-legacy` | K2, DX, K3 |
| `kindle` | K4, K5, PW1 |
| `kindlepw2` | **PW2 and newer on firmware ≤5.16.2.1.1** |
| `kindlehf` | any Kindle on firmware ≥5.16.3 |

> The most common post-jailbreak failure is mixing `kindlehf` with old
> firmware — always use `kindlepw2` below 5.16.3.

Authoritative, always-current source: <https://kindlemodding.org/jailbreaking/>
