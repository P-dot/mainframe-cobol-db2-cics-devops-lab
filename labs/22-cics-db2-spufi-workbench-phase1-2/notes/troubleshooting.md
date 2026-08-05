# Troubleshooting del Lab 22 - Fases 1 y 2

## 1. Doble prefijo IBMUSER

Síntoma observado:

```text
BROWSE IBMUSER.IBMUSER.DB2LAB.SPUFO
```

Significado:

TSO ha aplicado el prefijo `IBMUSER` a un nombre que ya llevaba `IBMUSER.` delante.

Solución usada:

En el panel SPUFI se indicó el dataset de forma relativa:

```text
Input  ===> DB2LAB.SPUFI(SPU000)
Output ===> DB2LAB.SPUFO
```

Resultado deseado:

```text
BROWSE IBMUSER.DB2LAB.SPUFO
```

## 2. SQLCODE -204 con SYSIBM.SYSDUMMY1

Sentencia:

```sql
SELECT CURRENT DATE
FROM SYSIBM.SYSDUMMY1;
```

Resultado observado:

```text
SQLCODE = -204
SYSIBM.SYSDUMMY1 IS AN UNDEFINED NAME
```

Lectura correcta:

Db2 y SPUFI estaban respondiendo, pero el objeto usado en la consulta no estaba definido/resuelto en este entorno.

## 3. SQLCODE -142 con VALUES CURRENT DATE

Sentencia:

```sql
VALUES CURRENT DATE;
```

Resultado observado:

```text
SQLCODE = -142
THE SQL STATEMENT IS NOT SUPPORTED
```

Lectura correcta:

La forma de sentencia `VALUES ...` no estaba soportada por la combinación concreta de Db2/SPUFI del laboratorio.

## 4. SELECT correcto con SYSIBM.SYSTABLES

Sentencia final:

```sql
SELECT COUNT(*)
FROM SYSIBM.SYSTABLES;
```

Resultado observado:

```text
619
NUMBER OF ROWS DISPLAYED IS 1
STATEMENT EXECUTION WAS SUCCESSFUL, SQLCODE IS 100
COMMIT PERFORMED, SQLCODE IS 0
```

Interpretación:

El `SELECT COUNT(*)` devolvió una fila. En SPUFI, tras mostrar todas las filas, puede aparecer `SQLCODE 100` para indicar fin de datos en un SELECT. No es un fallo funcional del lab.
