# GitHub upload commands

Run from Git Bash:

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

ZIP="$HOME/Downloads/19-cobol-cics-bms-transaction.zip"
TMP="/tmp/19-cobol-cics-bms-transaction"
LAB="labs/19-cobol-cics-bms-transaction"

rm -rf "$TMP" "$LAB"
mkdir -p "$TMP"
unzip -q "$ZIP" -d "$TMP"

mkdir -p labs
cp -R "$TMP/19-cobol-cics-bms-transaction" "$LAB"

git status
git add "$LAB"
git commit -m "Add COBOL CICS BMS transaction lab"
git push origin main
```
