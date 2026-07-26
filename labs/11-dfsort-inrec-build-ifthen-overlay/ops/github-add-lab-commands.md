# GitHub upload commands

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

ZIP="$HOME/Downloads/11-dfsort-inrec-build-ifthen-overlay.zip"
TMP="/tmp/11-dfsort-inrec-build-ifthen-overlay"
LAB="labs/11-dfsort-inrec-build-ifthen-overlay"

rm -rf "$TMP"
rm -rf "$LAB"

mkdir -p "$TMP"
mkdir -p "$LAB"

unzip -o "$ZIP" -d "$TMP"
cp -R "$TMP/11-dfsort-inrec-build-ifthen-overlay/." "$LAB/"

find "$LAB" -maxdepth 3 -type f

find "$LAB" -type f \( -iname "*.mp4" -o -iname "*video*" -o -iname "videoplayback*" -o -iname "image_*.png" \)

git status --untracked-files=all

git add "$LAB"
git commit -m "Add DFSORT INREC BUILD IFTHEN OVERLAY lab"
git push

git status
git log --oneline --decorate -5
```
