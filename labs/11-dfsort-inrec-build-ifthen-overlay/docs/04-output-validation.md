# Output validation

The lab validates two outputs.

## `CLIINR`

Expected format:

```text
customer-number surname -$-amount city-date
```

Example:

```text
0000010 FERNANDEZ   -$-00000190 MADRID -20260726
```

## `CLIFLG`

Expected format: original-style customer record plus a conditional flag.

Examples:

```text
0000010FERNANDEZ   CARLOS   MADRID  00000190  MENOR
0000030VAZQUEZ     MONICA   ALMERIA 00000456  MAYOR
0000040GARCIA      SILVIA   BURGOS  00000400  MAYOR
```

`00000400` is classified as `MAYOR` because the condition is strictly lower than 400: `LT,400`.
