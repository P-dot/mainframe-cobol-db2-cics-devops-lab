# GitHub upload commands

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

ZIP="$HOME/Downloads/16-cobol-multiline-sysin-sentinel-control.zip"
TMP="/tmp/16-cobol-multiline-sysin-sentinel-control"
LAB="labs/16-cobol-multiline-sysin-sentinel-control"

rm -rf "$TMP"
rm -rf "$LAB"

mkdir -p "$TMP"
mkdir -p "$LAB"

unzip -o "$ZIP" -d "$TMP"
cp -R "$TMP/16-cobol-multiline-sysin-sentinel-control/." "$LAB/"

find "$LAB" -maxdepth 3 -type f

find "$LAB" -type f \( -iname "*.mp4" -o -iname "*video*" -o -iname "videoplayback*" -o -iname "image_*.png" \)

git status --untracked-files=all

git add "$LAB"
git commit -m "Add COBOL multiline SYSIN sentinel control lab"
git push

git status
git log --oneline --decorate -5
```
