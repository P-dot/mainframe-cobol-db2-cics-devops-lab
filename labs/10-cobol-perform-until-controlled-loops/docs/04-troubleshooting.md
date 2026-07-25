# Troubleshooting

## Program does not stop

Likely cause: the counter is not incremented.

Check that this line exists inside the repeated paragraph:

```cobol
ADD 1 TO W-CONTADOR.
```

Without it, `W-CONTADOR` never reaches the `UNTIL` condition.

## Program does not print five lines

Check the initial value and the termination condition:

```cobol
MOVE 0 TO W-CONTADOR.
PERFORM 2000-PROCESO UNTIL W-CONTADOR = 5.
```

This combination produces five executions of `2000-PROCESO`.

## Build fails

Check compiler output in SDSF, especially `SYSPRINT`, for `IGY...` messages. Common causes are missing periods, misspelled variable names, or incorrect COBOL column placement.

## Run step executes an old load

The JCL uses `COND=(0,NE)` to avoid running the program when the build step fails. Keep this protection in place.
