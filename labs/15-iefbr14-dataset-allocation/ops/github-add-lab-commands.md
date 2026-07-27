# GitHub upload commands

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

ZIP="$HOME/Downloads/15-iefbr14-dataset-allocation.zip"
TMP="/tmp/15-iefbr14-dataset-allocation"
LAB="labs/15-iefbr14-dataset-allocation"

rm -rf "$TMP"
rm -rf "$LAB"

mkdir -p "$TMP"
mkdir -p "$LAB"

unzip -o "$ZIP" -d "$TMP"
cp -R "$TMP/15-iefbr14-dataset-allocation/." "$LAB/"

find "$LAB" -maxdepth 3 -type f
find "$LAB" -type f \( -iname "*.mp4" -o -iname "*video*" -o -iname "videoplayback*" -o -iname "image_*.png" \)

git status --untracked-files=all
git add "$LAB"
git commit -m "Add IEFBR14 dataset allocation lab"
git push
git status
git log --oneline --decorate -5
```
