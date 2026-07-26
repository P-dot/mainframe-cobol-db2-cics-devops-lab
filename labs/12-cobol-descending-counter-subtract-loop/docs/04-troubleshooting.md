# Troubleshooting

## Wrong SUBTRACT syntax

Incorrect:

```cobol
           SUBTRACT 1 TO W-CONTADOR.
```

Correct:

```cobol
           SUBTRACT 1 FROM W-CONTADOR.
```

`ADD` uses `TO`; `SUBTRACT` uses `FROM`.

## Infinite loop risk

A controlled loop must update the counter. If the `SUBTRACT` line is missing or commented out, the stop condition may never become true.

Symptoms:

- Job remains active.
- `SYSOUT` grows continuously.
- SDSF output lines increase rapidly.

Operational response:

- Identify the active job in SDSF.
- Purge/cancel the job if it is looping.
- Fix the counter update before rerunning.

## Truncated input

The input field is declared as:

```cobol
       01  W-MES                 PIC X(80).
```

If the `SYSIN` line is longer than 80 characters, the program will only retain the first 80 characters.
