# 04 - Troubleshooting CC 0012

`COND CODE 0012` was produced during the first `THRALL` attempts. The error was diagnosed from the COBOL compiler listing in SDSF.

Representative diagnostics observed:

```text
IGYDS1089-S "PIC" was invalid.
IGYDS1159-E A "PICTURE" clause was not found for elementary item "W-MES".
IGYPA3007-S "2000-PROCESO" was not defined as a procedure-name.
IGYPS2008-E A period was required before procedure-name "1000-INICIO".
```

Corrective actions:

```text
01  W-MES                 PIC X(80).
```

The variable declaration must end with a period, not a comma or semicolon, and must not place a period immediately after the data-name.

Procedure names must match exactly:

```cobol
PERFORM 2000-PROCESO THRU 2000-PROCESO-F.

2000-PROCESO.
    ACCEPT W-MES.
```

The main `PERFORM` sequence must be closed before the first paragraph definition starts.
