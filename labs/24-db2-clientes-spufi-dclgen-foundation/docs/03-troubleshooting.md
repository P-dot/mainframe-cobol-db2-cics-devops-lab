# 03 - Troubleshooting documentado

## 1. SQLCODE -312 en SPUFI

Se intento usar una host variable COBOL en SPUFI:

```sql
WHERE DNI = :WS-DNI
```

En SPUFI eso no existe. Las host variables solo tienen sentido dentro de COBOL/Db2. En SPUFI se usa literal:

```sql
WHERE DNI = '23456789B'
```

## 2. UNBALANCED APOSTROPHES

El batch original de tres INSERT fallo por comillas desbalanceadas en el tercer INSERT.

El rollback dejo la tabla en 0 filas. La solucion fue insertar de uno en uno:

```text
SPU024A -> ANA
SPU024B -> LUIS
SPU024C -> HECTOR
```

## 3. Libreria JCL sin espacio de directorio

`IBMUSER.ML.JCL` dio `No space in directory`. No se forzo el PDS; se evito crear JCL adicional y se uso ISPF 3.2.

## 4. Doble prefijo IBMUSER

Al crear datasets desde ISPF hay que evitar:

```text
IBMUSER.IBMUSER.DB2LAB....
```

Forma correcta:

```text
DB2LAB.DCLSEQ.COBOL
```

o bien cualificado con comillas:

```text
'IBMUSER.DB2LAB.DCLSEQ.COBOL'
```

## 5. DCLGEN esperaba dataset secuencial

El intento con `IBMUSER.DB2LAB.DCLGEN.COBOL` como PDS fallo con:

```text
NOT SEQUENTIAL DATA SET
```

La solucion fue crear un dataset BASIC secuencial:

```text
IBMUSER.DB2LAB.DCLSEQ.COBOL
Directory blocks = 0
Data set name type = BASIC
RECFM=FB, LRECL=80
```

## 6. DCLGEN final correcto

Resultado final:

```text
DSNE901I EXECUTION COMPLETE
SYSTEM RETCODE=000
USER OR DSN RETCODE=0
```
