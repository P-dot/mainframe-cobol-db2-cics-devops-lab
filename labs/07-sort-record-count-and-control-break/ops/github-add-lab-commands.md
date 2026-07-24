# Comandos para añadir el Lab 07 al repo

Repo destino:

```bash
/c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab
```

## Comandos

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

ZIP="$HOME/Downloads/07-sort-record-count-and-control-break.zip"
TMP="/tmp/07-sort-record-count-and-control-break"
LAB="labs/07-sort-record-count-and-control-break"

rm -rf "$TMP"
rm -rf "$LAB"

mkdir -p "$TMP"
mkdir -p "$LAB"

unzip -o "$ZIP" -d "$TMP"

cp -R "$TMP/07-sort-record-count-and-control-break/." "$LAB/"

find "$LAB" -maxdepth 3 -type f

git status
git add "$LAB"
git commit -m "Add SORT record count and control break lab"
git push
git status
git log --oneline --decorate -5
```
