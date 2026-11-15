#!/usr/bin/env bash
# Stage the post-jailbreak stack onto the Kindle: Universal Hotfix, MRPI,
# KUAL booklet, KOReader, and (optionally) the two small extensions.
#
# Prereq: run scripts/download.sh first. Run this AFTER the WatchThis hotfix
# (Krok C) is installed and the device shows the normal home screen.
#
# Usage:  ./scripts/stage-post.sh [/path/to/kindle]
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DL="$REPO/downloads"
KIN="${1:-}"

for p in /d /e /f /g /media/*/ /Volumes/*/; do
  [ -f "$p/system/version.txt" ] && [ -z "$KIN" ] && KIN="$p"
done
if [ -z "$KIN" ] || [ ! -f "$KIN/system/version.txt" ]; then
  echo "Kindle not found. Pass the mount point, e.g.: $0 /d" >&2
  exit 1
fi

# 1. Universal Hotfix -> root
cp "$REPO/files/Update_hotfix_universal.bin" "$KIN/"
echo "hotfix -> root"

# 2. MRPI -> extensions/ + mrpackages/
MRPI="$DL/kual-mrinstaller-1.7.N-r19303.zip"
[ -f "$MRPI" ] || { echo "Missing $MRPI — run download.sh first." >&2; exit 1; }
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
unzip -q "$MRPI" -d "$TMP"
cp -r "$TMP/extensions" "$KIN/"
cp -r "$TMP/mrpackages" "$KIN/"
echo "MRPI -> extensions/ + mrpackages/"

# 3. KUAL booklet .bin -> mrpackages/
cp "$REPO/files/Update_KUALBooklet_c6ac782_install.bin" "$KIN/mrpackages/"
echo "KUAL -> mrpackages/"

# 4. KOReader -> koreader/ + extensions/koreader/
KOR="$(ls "$DL"/koreader-kindlepw2-*.zip 2>/dev/null | head -1)"
[ -f "$KOR" ] || { echo "Missing KOReader zip in $DL — run download.sh first." >&2; exit 1; }
unzip -q "$KOR" -d "$TMP/koreader"
cp -r "$TMP/koreader/koreader" "$KIN/"
cp -r "$TMP/koreader/extensions/koreader" "$KIN/extensions/"
echo "KOReader -> koreader/ + extensions/koreader/"

# 5. (optional) small extensions
for x in kual-batterystatus-1.1.N-r18977.tar.xz kual-kual-plus-0.2.N-r13380.tar.xz; do
  tar -xJf "$REPO/files/$x" -C "$TMP"
done
cp -r "$TMP/extensions/BatteryStatus" "$KIN/extensions/" 2>/dev/null && echo "BatteryStatus -> extensions/"
cp -r "$TMP/extensions/KUAL-add-ons" "$KIN/extensions/" 2>/dev/null && echo "KUAL+ -> extensions/"

echo
echo "Staged on $KIN. Eject, then on the device:"
echo "  Update Your Kindle  (installs Universal Hotfix)"
echo "  Run Hotfix booklet  (in the library)"
echo "  ;log mrpi           (installs KUAL)"
echo "  KUAL -> KOReader -> Start KOReader (no framework)"
