# Publicación en GitHub

Ejecutar desde Git Bash en Windows:

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

ZIP="$HOME/Downloads/25-cics-db2-all4-pending-debug-lab.zip"
TMP="/tmp/25-cics-db2-all4-pending-debug-lab"
LAB="labs/25-cics-db2-all4-pending-debug-lab"

rm -rf "$TMP" "$LAB"
mkdir -p "$TMP"

unzip -q "$ZIP" -d "$TMP"

mkdir -p labs
cp -R "$TMP/25-cics-db2-all4-pending-debug-lab" "$LAB"

git status

git add "$LAB"

git commit -m "Add CICS Db2 ALL4 pending debug lab"

git push origin main

git status
```
