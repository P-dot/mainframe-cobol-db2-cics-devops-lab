# COBOL loop structure

## Working-storage variables

```cobol
01  W-MES                 PIC X(80).
01  W-CONTADOR            PIC 9(02).
```

`W-MES` is an alphanumeric field used for the message read from `SYSIN`.

`W-CONTADOR` is a numeric two-digit field used to control the number of loop iterations.

## Initialization

```cobol
MOVE 0 TO W-CONTADOR.
ACCEPT W-MES.
```

The counter is explicitly initialized before the loop. The message is read once before repeated processing begins.

## Controlled loop

```cobol
PERFORM 2000-PROCESO UNTIL W-CONTADOR = 5.
```

The processing paragraph runs until the counter reaches 5.

## Increment

```cobol
ADD 1 TO W-CONTADOR.
```

This statement prevents an uncontrolled loop by moving the counter toward the termination condition.
