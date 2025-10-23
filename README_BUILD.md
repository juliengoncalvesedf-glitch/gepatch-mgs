# Build GePatch — no toolchain on your Mac needed

## Option A — GitHub Actions (1-click online build)
1. Create a new GitHub repository and upload all these files (keep `.github/workflows/build.yml`).
2. Go to the **Actions** tab → run **build-prx** (or push a commit).
3. Download the artifact **ge_patch_build** → inside is `ge_patch.prx`.

## Option B — Local build with Docker Desktop
1. Install Docker Desktop for macOS.
2. In Terminal, from this folder:
   ```
   ./build_with_docker.sh
   ```
3. The script runs `pspdev/psptoolchain:latest` and compiles inside the container.
4. The compiled `ge_patch.prx` will be in the same subfolder as the Makefile (look for it after the run).

## Install on Vita (Adrenaline)
Copy `ge_patch.prx` to `ux0:/pspemu/seplugins/` and add to `game.txt`:
```
ux0:/pspemu/seplugins/ge_patch.prx 1
```
(Optional) `ms0:/seplugins/GePatch.cfg`:
```
MGS_PO=1
SCALE_TEXTURES=1
```
