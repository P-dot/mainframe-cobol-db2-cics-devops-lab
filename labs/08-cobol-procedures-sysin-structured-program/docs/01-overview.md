# 01 - Overview

This lab documents the evolution from a simple COBOL batch program to a structured program using COBOL paragraph procedures.

The first program, `PARMPRC`, uses direct paragraph calls:

```cobol
PERFORM 1000-INICIO.
PERFORM 2000-PROCESO.
PERFORM 3000-FIN.
```

The second program, `PARMTHR`, uses explicit start/end paragraph ranges:

```cobol
PERFORM 1000-INICIO THRU 1000-INICIO-F.
PERFORM 2000-PROCESO THRU 2000-PROCESO-F.
PERFORM 3000-FIN THRU 3000-FIN-F.
```

Both programs read one input line from `SYSIN` and print the result through `DISPLAY` to `SYSOUT`.
