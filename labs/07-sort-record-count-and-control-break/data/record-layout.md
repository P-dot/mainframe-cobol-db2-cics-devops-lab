# Layout de registros usados en el Lab 07

## Entrada: `IBMUSER.COBOL.FILE80(CLIENTE)`

Dataset:

```text
IBMUSER.COBOL.FILE80
DSORG=PO
RECFM=FB
LRECL=80
BLKSIZE=800
```

Layout de entrada:

| Posiciones | Campo | Longitud | Ejemplo |
|---:|---|---:|---|
| 1-7 | Código / número de cliente | 7 | `0000010` |
| 8-19 | Apellido | 12 | `FERNANDEZ   ` |
| 20-27 | Nombre | 8 | `CARLOS  ` |
| 28-35 | Ciudad | 8 | `MADRID  ` |
| 36-43 | Importe | 8 | `00000300` |
| 44-80 | Relleno | 37 | espacios |

## Salida: `IBMUSER.COBOL.FILE80(CLISUM)`

Layout lógico generado con:

```text
OUTREC FIELDS=(8,28,36,8)
```

| Posiciones salida | Origen | Campo |
|---:|---|---|
| 1-28 | entrada 8-35 | Apellido + nombre + ciudad |
| 29-36 | entrada 36-43, sumarizado | Importe total |
| 37-80 | relleno | espacios |

## Clave de corte

```text
SORT FIELDS=(8,12,CH,A)
```

Agrupa por apellido.

## Campo sumarizado

```text
SUM FIELDS=(36,8,ZD)
```

Suma el importe numérico zoned decimal.
