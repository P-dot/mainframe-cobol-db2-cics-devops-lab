# 02 - COBOL procedure styles

## Direct paragraph PERFORM

`PARMPRC` uses a simple and readable structure:

```cobol
PERFORM 1000-INICIO.
PERFORM 2000-PROCESO.
PERFORM 3000-FIN.
```

Each `PERFORM` transfers control to a paragraph. The program returns to the next statement when the paragraph completes.

## PERFORM THRU range

`PARMTHR` uses a more explicit range-based structure:

```cobol
PERFORM 2000-PROCESO THRU 2000-PROCESO-F.
```

This means: execute from `2000-PROCESO` through `2000-PROCESO-F`.

The ending paragraph uses `EXIT` as a formal endpoint:

```cobol
2000-PROCESO-F.
    EXIT.
```
