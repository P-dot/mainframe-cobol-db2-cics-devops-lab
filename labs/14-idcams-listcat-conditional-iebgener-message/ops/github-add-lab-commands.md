# GitHub upload commands

Run from Git Bash after downloading the ZIP to `Downloads`.

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

ZIP="$HOME/Downloads/14-idcams-listcat-conditional-iebgener-message.zip"
TMP="/tmp/14-idcams-listcat-conditional-iebgener-message"
LAB="labs/14-idcams-listcat-conditional-iebgener-message"

rm -rf "$TMP"
rm -rf "$LAB"

mkdir -p "$TMP"
mkdir -p "$LAB"

unzip -o "$ZIP" -d "$TMP"
cp -R "$TMP/14-idcams-listcat-conditional-iebgener-message/." "$LAB/"

find "$LAB" -maxdepth 3 -type f

find "$LAB" -type f \( -iname "*.mp4" -o -iname "*video*" -o -iname "videoplayback*" -o -iname "image_*.png" \)

git status --untracked-files=all

git add "$LAB"
git commit -m "Add IDCAMS LISTCAT conditional IEBGENER message lab"
git push

git status
git log --oneline --decorate -5
```
