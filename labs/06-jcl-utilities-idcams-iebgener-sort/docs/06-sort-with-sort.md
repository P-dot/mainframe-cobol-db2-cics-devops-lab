# 06 - Ordenación con SORT

Job: `jcl/SORTCLI.jcl`.

Objetivo:

```text
CLIENTE3 → CLIENTE
```

JCL clave:

```jcl
//SORTIN  DD DSN=IBMUSER.COBOL.FILE80(CLIENTE3),DISP=SHR
//SORTOUT DD DSN=IBMUSER.COBOL.FILE80(CLIENTE),DISP=SHR
//SYSIN   DD *
  SORT FIELDS=(8,12,CH,A)
/*
```

Campo: posición 8, longitud 12, carácter, ascendente. Ordena por apellido.
