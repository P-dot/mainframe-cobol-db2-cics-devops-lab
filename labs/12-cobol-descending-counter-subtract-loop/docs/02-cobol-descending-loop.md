# COBOL descending loop structure

The loop is controlled by this statement:

```cobol
           PERFORM 2000-PROCESO UNTIL W-CONTADOR < 15.
```

The counter is initialized in the start paragraph:

```cobol
           MOVE 20 TO W-CONTADOR.
```

The counter is decremented inside the process paragraph:

```cobol
           SUBTRACT 1 FROM W-CONTADOR.
```

The pattern is:

```text
initialize counter
execute paragraph until condition is true
decrement counter in every iteration
stop cleanly
```

This is the descending counterpart of an ascending loop using `ADD 1 TO`.
