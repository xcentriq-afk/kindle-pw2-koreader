# Bundled files

These are the small, hard-to-source binaries, committed so the guide works
even if the upstream links change or rot (the WatchThis zip sits on Mega; the
KUAL booklet on NiLuJe's OVH snapshot bucket; one wiki KUAL link now returns
an HTML 404).

Each is SHA-256 pinned in `../checksums.md`. The larger binaries (KOReader,
USBNetwork, ScreenSavers, MRPI) are fetched by `../scripts/download.sh`.

| File | Used in |
|---|---|
| `watchthis-jailbreak-r03.zip` | Krok B — the jailbreak payload (contains `PW2/PW2-5.12.2.2/`) |
| `Update_hotfix_watchthis_custom.bin` | Krok C — exits demo mode |
| `Update_hotfix_universal.bin` | Krok D — enables homebrew bridge |
| `Update_KUALBooklet_c6ac782_install.bin` | Krok E — the launcher (via MRPI) |
| `kual-batterystatus-1.1.N-r18977.tar.xz` | optional extension |
| `kual-kual-plus-0.2.N-r13380.tar.xz` | optional extension |
