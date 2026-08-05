# GitHub Add Lab Commands

Run from Git Bash on Windows.

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

ZIP="$HOME/Downloads/23-db2-infrastructure-storage-database-tablespace-clientes.zip"
TMP="/tmp/23-db2-infrastructure-storage-database-tablespace-clientes"
LAB="labs/23-db2-infrastructure-storage-database-tablespace-clientes"

rm -rf "$TMP" "$LAB"
mkdir -p "$TMP"
unzip -q "$ZIP" -d "$TMP"
mkdir -p labs
cp -R "$TMP/23-db2-infrastructure-storage-database-tablespace-clientes" "$LAB"

git status
git add "$LAB"
git commit -m "Add Db2 infrastructure provisioning lab"
git push origin main
git status
```
