#!/usr/bin/env bash
# Stage the WatchThis jailbreak payload onto the Kindle.
# Run ONLY after the device is in demo mode at the "Sideload Content" prompt
# (see docs/INSTALL-PL.md, Krok B). Creates .demo/ at the drive root.
#
# Usage:  ./scripts/stage-jailbreak.sh [/path/to/kindle]
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
WT="$REPO/files/watchthis-jailbreak-r03.zip"
KIN="${1:-}"

for p in /d /e /f /g /media/*/ /Volumes/*/; do
  [ -f "$p/system/version.txt" ] && [ -z "$KIN" ] && KIN="$p"
done

if [ -z "$KIN" ] || [ ! -f "$KIN/system/version.txt" ]; then
  echo "Kindle not found. Pass the mount point, e.g.: $0 /d" >&2
  exit 1
fi
[ -f "$WT" ] || { echo "Missing $WT (run from the repo)." >&2; exit 1; }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
unzip -q "$WT" "watchthis-release/PW2/PW2-5.12.2.2/*" -d "$TMP"

mkdir -p "$KIN/.demo/goodreads"
cp "$TMP/watchthis-release/PW2/PW2-5.12.2.2/PW2-5.12.2.2.zip" "$KIN/.demo/"
cp "$TMP/watchthis-release/PW2/PW2-5.12.2.2/demo.json"             "$KIN/.demo/"

echo "Staged .demo/ on $KIN"
echo "  .demo/PW2-5.12.2.2.zip"
echo "  .demo/demo.json"
echo "  .demo/goodreads/ (empty)"
echo
echo "Eject, unplug, then press Done on the Kindle (see Krok B)."
