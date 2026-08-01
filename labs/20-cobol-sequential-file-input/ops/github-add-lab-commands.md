# Add Lab 20 to GitHub

Run from Git Bash:

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

ZIP="$HOME/Downloads/20-cobol-sequential-file-input.zip"
TMP="/tmp/20-cobol-sequential-file-input"
LAB="labs/20-cobol-sequential-file-input"

rm -rf "$TMP" "$LAB"
mkdir -p "$TMP"
unzip -q "$ZIP" -d "$TMP"

mkdir -p labs
cp -R "$TMP/20-cobol-sequential-file-input" "$LAB"

git status
git add "$LAB"
git commit -m "Add COBOL sequential file input lab"
git push origin main

git status
```
