# GitHub upload commands

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

ZIP="$HOME/Downloads/18-adcd-loaddb-db2-cics-startup-verification.zip"
TMP="/tmp/18-adcd-loaddb-db2-cics-startup-verification"
LAB="labs/18-adcd-loaddb-db2-cics-startup-verification"

rm -rf "$TMP"
rm -rf "$LAB"

mkdir -p "$TMP"
mkdir -p "$LAB"

unzip -o "$ZIP" -d "$TMP"
cp -R "$TMP/18-adcd-loaddb-db2-cics-startup-verification/." "$LAB/"

find "$LAB" -maxdepth 3 -type f

find "$LAB" -type f \( -iname "*.mp4" -o -iname "*video*" -o -iname "videoplayback*" -o -iname "image_*.png" \)

git status --untracked-files=all

git add "$LAB"
git commit -m "Add ADCD LOADDB DB2 CICS startup verification lab"
git push

git status
git log --oneline --decorate -5
```
