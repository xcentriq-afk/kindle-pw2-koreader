# Checksums

Every file is SHA-256 verified. Bundled files live in `files/`; the rest are
fetched by `scripts/download.sh`.

## Bundled (`files/`)

| File | SHA-256 |
|---|---|
| `watchthis-jailbreak-r03.zip` | `38ed5dadd0f98b1ac846967fbde14aa0543fc824207ee1889159993c87a2bfa3` |
| `Update_hotfix_universal.bin` (v2.3.7) | `2f895b2c96a6f8232c2648b500e09463738d6e117323199f5f67d523730c9779` |
| `Update_hotfix_watchthis_custom.bin` | `2102e30fb2fb645c32e03bda8144903484d564e6934824a8797089779c063284` |
| `Update_KUALBooklet_c6ac782_install.bin` | `1cc7bd5d8744e48c390b310717311d513a8c05547101791880af6fd4f241a765` |
| `kual-batterystatus-1.1.N-r18977.tar.xz` | `b8aceb88ebf108a291428ba793985c23d18a3698a48374b3b9c05f90e2c8ec0d` |
| `kual-kual-plus-0.2.N-r13380.tar.xz` | `b6aa870e968df16757227dfd25ed034cb61d82e569e92d4a9698539aa10c5afe` |

Published MD5 for `watchthis-jailbreak-r03.zip` (MobileRead thread t=346037):
`d73a76dab7824840972ad51f377dede1`.

## Fetched by `scripts/download.sh`

| File | Source | SHA-256 |
|---|---|---|
| `koreader-kindlepw2-v2026.07.1.zip` | GitHub koreader/koreader releases | `ea1f575c54492a2c679d128b7f3210fd7d6a87e5f5a1ff1f7a7fe2080ff68f86` |
| `kual-mrinstaller-1.7.N-r19303.zip` | kindlemodding.org | `aa564dd3988bf5c94c093ebe63bc59e9d66f6c19684984225a02bcc75848e996` |
| `Update_usbnet_0.22.N_install_pw2_and_up.bin` | NiLuJe OVH snapshot | `b2376b05b6c99bc5035acd35853d369338ce71716444f224f5b7adb076d957ea` |
| `Update_linkss_0.25.N_install_pw2_and_up.bin` | NiLuJe OVH snapshot | `65a23dd71a2c4f41e4733e3290b38ab1706a265eb14cd170b1ff0ea72148a804` |

> KOReader releases roll forward; when a newer `kindlepw2` build is out, update
> the version and re-check the checksum. The checksum above is pinned to
> v2026.07.1, which is what this guide was tested against.

## Verify a `.bin` is a real package

Kindle update packages start with the 4-byte magic `SP01`. Before trusting any
download, check it:

```sh
head -c 4 file.bin | od -An -c   # must print  S   P   0   1
```

If `file file.bin` reports "HTML document", the URL silently served an error
page — find another mirror.
