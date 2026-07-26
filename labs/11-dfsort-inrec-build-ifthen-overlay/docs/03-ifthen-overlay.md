# IFTHEN and OVERLAY

`IFTHEN` applies conditional logic to a record. `OVERLAY` writes content into a specific position while keeping the rest of the record intact.

Control statements:

```text
SORT FIELDS=(1,7,ZD,A)
INREC IFTHEN=(WHEN=(36,8,ZD,LT,400),
              OVERLAY=(47:C'MENOR')),
      IFTHEN=(WHEN=NONE,
              OVERLAY=(47:C'MAYOR'))
```

Logic:

- If the amount at position 36, length 8, is lower than 400, write `MENOR` from position 47.
- Otherwise, `WHEN=NONE` applies and writes `MAYOR` from position 47.

This is similar to an IF/ELSE structure, but performed directly in DFSORT.
