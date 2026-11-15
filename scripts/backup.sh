#!/usr/bin/env bash
# Back up documents/ (books + .sdr annotations) and fonts/ from a mounted
# Kindle into a dated folder. Safe to run at any time.
#
# Usage:  ./scripts/backup.sh [/path/to/kindle]
set -euo pipefail

KIN="${1:-}"

# Auto-detect the Kindle mount (Windows git-bash: /d; Linux: /media/*/; macOS: /Volumes/*/)
if [ -z "$KIN" ]; then
  for p in /d /e /f /g /media/*/ /Volumes/*/; do
    [ -f "$p/system/version.txt" ] && KIN="$p" && break
  done
fi

if [ -z "$KIN" ] || [ ! -f "$KIN/system/version.txt" ]; then
  echo "Kindle not found. Pass the mount point, e.g.: $0 /d" >&2
  exit 1
fi

BK="$HOME/kindle-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BK"

[ -d "$KIN/documents" ] && cp -r "$KIN/documents" "$BK/" && echo "documents -> $BK/documents"
[ -d "$KIN/fonts" ]     && cp -r "$KIN/fonts"     "$BK/" && echo "fonts -> $BK/fonts"

echo
echo "Backup complete: $BK"
echo "(This is what the factory reset in the jailbreak will wipe.)"
