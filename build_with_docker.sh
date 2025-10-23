#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
docker run --rm -t -v "$SCRIPT_DIR:/src" -w /src pspdev/psptoolchain:latest bash -lc '
  set -e
  if [ -d GePatch-0.2/GePatch-0.2 ]; then cd GePatch-0.2/GePatch-0.2; elif [ -f Makefile ]; then :; else cd GePatch-0.2 || true; fi
  make clean || true
  make
  echo
  echo "Built files:"; ls -l ge_patch.prx *.elf *.map 2>/dev/null || true
'
echo "✅ Finished. Check for ge_patch.prx in the folder above."
