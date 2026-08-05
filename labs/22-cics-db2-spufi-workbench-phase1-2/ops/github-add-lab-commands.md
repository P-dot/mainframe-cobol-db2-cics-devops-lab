# Subida a GitHub

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

ZIP="$HOME/Downloads/22-cics-db2-spufi-workbench-phase1-2.zip"
TMP="/tmp/22-cics-db2-spufi-workbench-phase1-2"
LAB="labs/22-cics-db2-spufi-workbench-phase1-2"

rm -rf "$TMP" "$LAB"
mkdir -p "$TMP"
unzip -q "$ZIP" -d "$TMP"
mkdir -p labs
cp -R "$TMP/22-cics-db2-spufi-workbench-phase1-2" "$LAB"

git status
git add "$LAB"
git commit -m "Add Db2 SPUFI workbench validation lab"
git push origin main
git status
```
