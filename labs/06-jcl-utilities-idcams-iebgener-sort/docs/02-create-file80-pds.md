# 02 - Crear el PDS `IBMUSER.COBOL.FILE80`

JCL: `jcl/CRFILE80.jcl`.

Parámetros importantes:

```text
DSORG=PO
RECFM=FB
LRECL=80
BLKSIZE=800
```

Resultado: `CRFILE8 CC 0000`.
