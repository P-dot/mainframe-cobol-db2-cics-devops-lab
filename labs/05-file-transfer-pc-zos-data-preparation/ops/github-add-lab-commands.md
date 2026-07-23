# Comandos para añadir este lab al repo GitHub

Repo destino:

```bash
/c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab
```

Comandos:

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

mkdir -p labs/05-file-transfer-pc-zos-data-preparation

ZIP="$HOME/Downloads/05-file-transfer-pc-zos-data-preparation.zip"
TMP="/tmp/05-file-transfer-pc-zos-data-preparation"

rm -rf "$TMP"
mkdir -p "$TMP"

unzip -o "$ZIP" -d "$TMP"

cp -R "$TMP/05-file-transfer-pc-zos-data-preparation/." labs/05-file-transfer-pc-zos-data-preparation/

git status
git add labs/05-file-transfer-pc-zos-data-preparation
git commit -m "Add file transfer PC zOS data preparation lab"
git push
```
