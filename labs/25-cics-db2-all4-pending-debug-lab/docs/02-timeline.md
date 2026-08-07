# Línea temporal técnica

## 1. Recursos Db2/CICS

1. `CEDA DISPLAY GROUP(ALL4)` mostró que `CICSDB2` ya existía como `DB2CONN`.
2. `CEDA VIEW DB2CONN(CICSDB2) GROUP(ALL4)` confirmó `DB2ID DB9G`.
3. Se definió `DB2ENTRY(ALL4)` con `PLAN ALL4P`.
4. Se definió `DB2TRAN(ALL4TRAN)` con `TRANSID ALL4`.
5. Se verificó el grupo con `CEDA DISPLAY GROUP(ALL4)`.

## 2. BMS

1. Se creó `IBMUSER.CICS.MAPS(ALL4MP)`.
2. Primer intento con continuaciones BMS produjo errores de assembler.
3. Se simplificó el mapa para evitar continuaciones conflictivas.
4. `CMPA4MP` produjo mapa físico y copy COBOL.
5. Se definió `MAPSET(ALL4MP)`.

## 3. COBOL + Db2 + CICS

1. Se creó `IBMUSER.CICS.SRC(ALL4)`.
2. Se creó `IBMUSER.DB2LAB.DBRMLIB`.
3. `CMPA4DB` se ajustó por errores sucesivos.
4. Problemas corregidos:
   - faltaban `SYSUT1` y `SYSUT2` en `PCDB2`,
   - `SQLCA` no estaba disponible para COBOL,
   - el link-edit no encontraba rutinas LE,
   - se añadió `CEE.SCEELKED` al `SYSLIB` del `LKED`.
5. Resultado final: `COBOL RC 0`, `LKED RC 0`.

## 4. BIND

`BNDA4DB` ejecutó correctamente `BIND PLAN(ALL4P)`.

## 5. CICS runtime

1. Se definieron `LIBRARY`, `PROGRAM` y `TRANSACTION`.
2. `CEDA INSTALL GROUP(ALL4)` falló parcialmente porque `DB2CONN CICSDB2` ya estaba instalada y en uso.
3. Se instalaron individualmente las piezas nuevas.
4. `CEMT SET PROGRAM(ALL4) NEWCOPY` devolvió `RESPONSE NORMAL`.
5. `ALL4` mostró pantalla inicial.
6. `CEDF` confirmó `RECEIVE MAP` con `RESPONSE NORMAL` e input `23456789B`.
7. El output final no se pintó como se esperaba.
