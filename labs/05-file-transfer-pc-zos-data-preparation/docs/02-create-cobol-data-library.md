# 02 - Crear `IBMUSER.COBOL.DATA`

## Dataset objetivo

```text
IBMUSER.COBOL.DATA
```

## JCL usado

El JCL está en:

```text
jcl/CRDATA.jcl
```

Contenido principal:

```jcl
//STEP01  EXEC PGM=IEFBR14
//COBDATA DD DSN=IBMUSER.COBOL.DATA,
//           DISP=(NEW,CATLG,DELETE),
//           SPACE=(TRK,(1,1,5)),
//           DCB=(DSORG=PO,RECFM=FB,LRECL=43,BLKSIZE=430)
```

## Por qué estos atributos

```text
DSORG=PO    → PDS con miembros.
RECFM=FB    → registros fijos bloqueados.
LRECL=43    → cada registro de ARCHI.txt mide 43 caracteres.
BLKSIZE=430 → 10 registros por bloque.
```

## Verificación en ISPF

En `3.4`, buscar:

```text
IBMUSER.COBOL.*
```

Resultado esperado:

```text
IBMUSER.COBOL.DATA
IBMUSER.COBOL.LOAD
IBMUSER.COBOL.SRC
```

## Creación del miembro destino

Crear el miembro vacío:

```text
IBMUSER.COBOL.DATA(ARCHI)
```

No crearlo en:

```text
IBMUSER.ML.JCL(ARCHI)
```

porque `ML.JCL` es para JCL, no para datos.
