# Comandos para añadir el Lab 06 al repo

```bash
cd /c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab

ZIP="$HOME/Downloads/06-jcl-utilities-idcams-iebgener-sort.zip"
TMP="/tmp/06-jcl-utilities-idcams-iebgener-sort"
LAB="labs/06-jcl-utilities-idcams-iebgener-sort"

rm -rf "$TMP"
rm -rf "$LAB"
mkdir -p "$TMP" "$LAB"

unzip -o "$ZIP" -d "$TMP"
cp -R "$TMP/06-jcl-utilities-idcams-iebgener-sort/." "$LAB/"

find "$LAB" -maxdepth 3 -type f

git status
git add "$LAB"
git commit -m "Add JCL utilities IDCAMS IEBGENER SORT lab"
git push
```
