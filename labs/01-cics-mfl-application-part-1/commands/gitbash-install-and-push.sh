#!/usr/bin/env bash
set -euo pipefail

REPO="/c/Carrera_Ciberseguridad/06_Portfolio_GitHub/mainframe-cobol-db2-cics-devops-lab"
ZIP="$HOME/Downloads/mainframe-cobol-db2-cics-devops-lab-lab01-part1.zip"

cd "$REPO"

echo "=== Installing Lab 01 Part 1 ==="
unzip -o "$ZIP" -d "$REPO"

echo
echo "=== Installed structure ==="
find labs/01-cics-mfl-application-part-1 -maxdepth 4 -type f | sort

echo
echo "=== Security scan: private IPv4 patterns ==="
grep -RniE \
'(^|[^0-9])(10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}|192\.168\.[0-9]{1,3}\.[0-9]{1,3}|172\.(1[6-9]|2[0-9]|3[01])\.[0-9]{1,3}\.[0-9]{1,3})([^0-9]|$)' \
labs/01-cics-mfl-application-part-1 || true

echo
echo "=== Security scan: MAC-address patterns ==="
grep -RniE \
'([0-9A-Fa-f]{2}[:-]){5}[0-9A-Fa-f]{2}' \
labs/01-cics-mfl-application-part-1 || true

echo
echo "=== Git status ==="
git status --short

echo
echo "=== Stage Lab 01 Part 1 ==="
git add labs/01-cics-mfl-application-part-1

echo
git status --short

echo
echo "=== Commit ==="
git commit -m "Add Lab 01 Part 1 MFL CICS BMS foundation and diagnostics"

echo
echo "=== Push ==="
git push origin main
