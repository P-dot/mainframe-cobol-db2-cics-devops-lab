# GitHub upload commands

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

ZIP="$HOME/Downloads/10-cobol-perform-until-controlled-loops.zip"
TMP="/tmp/10-cobol-perform-until-controlled-loops"
LAB="labs/10-cobol-perform-until-controlled-loops"

rm -rf "$TMP"
rm -rf "$LAB"

mkdir -p "$TMP"
mkdir -p "$LAB"

unzip -o "$ZIP" -d "$TMP"
cp -R "$TMP/10-cobol-perform-until-controlled-loops/." "$LAB/"

find "$LAB" -maxdepth 3 -type f

find "$LAB" -type f \( -iname "*.mp4" -o -iname "*video*" -o -iname "videoplayback*" -o -iname "image_*.png" \)

git status --untracked-files=all

git add "$LAB"
git commit -m "Add COBOL PERFORM UNTIL controlled loops lab"
git push

git status
git log --oneline --decorate -5
```
