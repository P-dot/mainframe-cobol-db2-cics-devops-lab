# GitHub upload commands

Run from Git Bash on Windows.

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

ZIP="$HOME/Downloads/08-cobol-procedures-sysin-structured-program.zip"
TMP="/tmp/08-cobol-procedures-sysin-structured-program"
LAB="labs/08-cobol-procedures-sysin-structured-program"

rm -rf "$TMP"
rm -rf "$LAB"

mkdir -p "$TMP"
mkdir -p "$LAB"

unzip -o "$ZIP" -d "$TMP"
cp -R "$TMP/08-cobol-procedures-sysin-structured-program/." "$LAB/"

find "$LAB" -maxdepth 3 -type f
find "$LAB" -type f \( -iname "*.mp4" -o -iname "*video*" -o -iname "videoplayback*" -o -iname "image_*.png" \)

git status --untracked-files=all

git add "$LAB"
git commit -m "Add COBOL procedures SYSIN structured program lab"
git push

git status
git log --oneline --decorate -5
```
