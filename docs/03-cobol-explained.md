# COBOL explicado

## HELLO

`HELLO` valida el ciclo más simple:

1. Fuente COBOL.
2. Compilación.
3. Link-edit.
4. Ejecución.
5. Salida en SDSF.

Fuente: [`../cobol/HELLO.cbl`](../cobol/HELLO.cbl)

## PARMES

`PARMES` valida `SYSIN` y `SYSOUT`:

- `01 W-MES PIC X(80).`: buffer de entrada de 80 caracteres.
- `ACCEPT W-MES.`: lee una línea desde `SYSIN`.
- `DISPLAY W-MES.`: escribe la línea en `SYSOUT`.

Fuente: [`../cobol/PARMES.cbl`](../cobol/PARMES.cbl)

## Regla de columnas

COBOL clásico en mainframe usa formato fijo:

- Columnas 1-6: secuencia.
- Columna 7: indicador.
- Columnas 8-11: Área A.
- Columna 12 en adelante: Área B.

En este lab se detectó un error real de columna 7 y se corrigió respetando el formato fijo.
