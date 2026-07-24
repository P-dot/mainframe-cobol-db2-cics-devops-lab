# 04 - Verificación con IDCAMS + IEBGENER

Job: `jcl/VERCLI1.jcl`.

Objetivo:

```text
Comprobar IBMUSER.COBOL.FILE80 y leer IBMUSER.COBOL.FILE80(CLIENTE1)
```

Pasos:

```text
CHKCAT  → IDCAMS LISTCAT
CHKMBR  → IEBGENER lee CLIENTE1 y manda salida a DUMMY
MSGOK   → si CHKMBR.RC = 0, emite mensaje en SYSOUT
```

Resultado: `VERCLI1 CC 0000`.
