# 05 - Publicacion en GitHub

Comandos sugeridos desde Git Bash:

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab
ZIP="$HOME/Downloads/24-db2-clientes-spufi-dclgen-foundation.zip"
TMP="/tmp/24-db2-clientes-spufi-dclgen-foundation"
LAB="labs/24-db2-clientes-spufi-dclgen-foundation"

rm -rf "$TMP" "$LAB"
mkdir -p "$TMP"
unzip -q "$ZIP" -d "$TMP"
mkdir -p labs
cp -R "$TMP/24-db2-clientes-spufi-dclgen-foundation" "$LAB"

git status
git add "$LAB"
git commit -m "Add Db2 CLIENTES SPUFI and DCLGEN foundation lab"
git push origin main
git status
```
