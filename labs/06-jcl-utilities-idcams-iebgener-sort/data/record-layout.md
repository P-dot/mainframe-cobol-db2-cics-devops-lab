# Layout de registro CLIENTE

Dataset de trabajo:

```text
IBMUSER.COBOL.FILE80
DSORG=PO
RECFM=FB
LRECL=80
BLKSIZE=800
```

Cada registro contiene datos hasta la posición 43 y espacios hasta la posición 80.

| Posiciones | Campo | Longitud | Ejemplo |
|---:|---|---:|---|
| 1-7 | Código / número de cliente | 7 | `0000010` |
| 8-19 | Apellido | 12 | `FERNANDEZ   ` |
| 20-27 | Nombre | 8 | `CARLOS  ` |
| 28-35 | Ciudad | 8 | `MADRID  ` |
| 36-43 | Importe | 8 | `00000190` |
| 44-80 | Relleno | 37 | espacios |

Clave de ordenación usada por SORT:

```text
SORT FIELDS=(8,12,CH,A)
```
