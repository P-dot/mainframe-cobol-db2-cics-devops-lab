# COBOL PERFORM VARYING

The central statement is:

```cobol
           PERFORM 2000-PROCESO
              VARYING W-CONTADOR FROM 1 BY 1
              UNTIL W-CONTADOR = 6.
```

It means:

```text
Execute paragraph 2000-PROCESO
using W-CONTADOR as a loop counter,
starting at 1,
incrementing by 1,
until W-CONTADOR equals 6.
```

The paragraph runs for counter values:

```text
1, 2, 3, 4, 5
```

When the counter reaches `6`, the loop stops.

This pattern avoids separate counter initialization and increment statements inside the program logic.
