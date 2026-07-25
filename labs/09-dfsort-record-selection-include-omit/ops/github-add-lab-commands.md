# Add Lab 09 to GitHub

Run from Git Bash after downloading `09-dfsort-record-selection-include-omit.zip` to `Downloads`.

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

ZIP="$HOME/Downloads/09-dfsort-record-selection-include-omit.zip"
TMP="/tmp/09-dfsort-record-selection-include-omit"
LAB="labs/09-dfsort-record-selection-include-omit"

rm -rf "$TMP"
rm -rf "$LAB"

mkdir -p "$TMP"
mkdir -p "$LAB"

unzip -o "$ZIP" -d "$TMP"
cp -R "$TMP/09-dfsort-record-selection-include-omit/." "$LAB/"

find "$LAB" -maxdepth 3 -type f
find "$LAB" -type f \( -iname "*.mp4" -o -iname "*video*" -o -iname "videoplayback*" -o -iname "image_*.png" \)

git status --untracked-files=all

git add "$LAB"
git commit -m "Add DFSORT INCLUDE OMIT record selection lab"
git push

git status
git log --oneline --decorate -5
```
