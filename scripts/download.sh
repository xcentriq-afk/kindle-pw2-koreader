#!/usr/bin/env bash
# Download every non-bundled file and verify its SHA-256.
# Requires: curl, tar (with xz), sha256sum. Run from anywhere.
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DL="$REPO/downloads"
mkdir -p "$DL"

OVH="https://storage.gra.cloud.ovh.net/v1/AUTH_2ac4bfee353948ec8ea7fd1710574097/mr-public"
KOR_VER="v2026.07.1"

sha() { sha256sum "$1" | awk '{print $1}'; }

# download_and_verify <url> <out-name> <expected-sha256>
download_and_verify() {
  local url="$1" out="$2" want="$3" got
  echo ">> $out"
  curl -sSL -o "$DL/$out" "$url"
  got="$(sha "$DL/$out")"
  if [ "$got" != "$want" ]; then
    echo "   CHECKSUM FAIL for $out" >&2
    echo "   expected: $want" >&2
    echo "   got:      $got" >&2
    exit 1
  fi
  echo "   OK"
}

# KOReader — kindlepw2 build (firmware <= 5.16.2.1.1)
download_and_verify \
  "https://github.com/koreader/koreader/releases/download/$KOR_VER/koreader-kindlepw2-$KOR_VER.zip" \
  "koreader-kindlepw2-$KOR_VER.zip" \
  "ea1f575c54492a2c679d128b7f3210fd7d6a87e5f5a1ff1f7a7fe2080ff68f86"

# MRPI — classic soft-float (NOT khf)
download_and_verify \
  "https://kindlemodding.org/jailbreaking/Legacy/post-jailbreak/installing-kual-mrpi/kual-mrinstaller-1.7.N-r19303.zip" \
  "kual-mrinstaller-1.7.N-r19303.zip" \
  "aa564dd3988bf5c94c093ebe63bc59e9d66f6c19684984225a02bcc75848e996"

# USBNetwork — K5 build, extract the PW2 .bin
echo ">> Update_usbnet_0.22.N_install_pw2_and_up.bin"
curl -sSL -o "$DL/kindle-usbnet-0.22.N-r18981.tar.xz" \
  "$OVH/Touch/kindle-usbnet-0.22.N-r18981.tar.xz"
tar -xJf "$DL/kindle-usbnet-0.22.N-r18981.tar.xz" -C "$DL" \
  USBNetwork/Update_usbnet_0.22.N_install_pw2_and_up.bin
mv "$DL/USBNetwork/Update_usbnet_0.22.N_install_pw2_and_up.bin" "$DL/"
rmdir "$DL/USBNetwork"
got="$(sha "$DL/Update_usbnet_0.22.N_install_pw2_and_up.bin")"
[ "$got" = "b2376b05b6c99bc5035acd35853d369338ce71716444f224f5b7adb076d957ea" ] \
  && echo "   OK" || { echo "   CHECKSUM FAIL for usbnet .bin"; exit 1; }

# ScreenSavers (linkss) — K5 build, extract the PW2 .bin
echo ">> Update_linkss_0.25.N_install_pw2_and_up.bin"
curl -sSL -o "$DL/kindle-linkss-0.25.N-r18981.tar.xz" \
  "$OVH/Touch/kindle-linkss-0.25.N-r18981.tar.xz"
tar -xJf "$DL/kindle-linkss-0.25.N-r18981.tar.xz" -C "$DL" \
  ScreenSavers/Update_linkss_0.25.N_install_pw2_and_up.bin
mv "$DL/ScreenSavers/Update_linkss_0.25.N_install_pw2_and_up.bin" "$DL/"
rmdir "$DL/ScreenSavers"
got="$(sha "$DL/Update_linkss_0.25.N_install_pw2_and_up.bin")"
[ "$got" = "65a23dd71a2c4f41e4733e3290b38ab1706a265eb14cd170b1ff0ea72148a804" ] \
  && echo "   OK" || { echo "   CHECKSUM FAIL for linkss .bin"; exit 1; }

echo
echo "All downloads verified. Next: run scripts/stage-post.sh <kindle>."
