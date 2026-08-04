# Add Lab 21 to GitHub repository

Run from Git Bash on Windows:

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

ZIP="$HOME/Downloads/21-cics-pseudoconversational-bms-commarea-cedf.zip"
TMP="/tmp/21-cics-pseudoconversational-bms-commarea-cedf"
LAB="labs/21-cics-pseudoconversational-bms-commarea-cedf"

rm -rf "$TMP" "$LAB"
mkdir -p "$TMP"
unzip -q "$ZIP" -d "$TMP"
mkdir -p labs
cp -R "$TMP/21-cics-pseudoconversational-bms-commarea-cedf" "$LAB"

git status
git add "$LAB"
git commit -m "Add CICS pseudoconversational BMS COMMAREA CEDF lab"
git push origin main
git status
```
