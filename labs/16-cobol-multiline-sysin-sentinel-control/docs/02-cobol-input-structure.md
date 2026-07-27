# COBOL input structure

The program uses a group item:

```cobol
       01  W-ENTRADA.
           05 W-CTRL             PIC X.
           05 W-TEXTO            PIC X(50).
```

This means each input line is split into:

```text
W-CTRL  -> first character
W-TEXTO -> following 50 characters
```

Only `W-TEXTO` is displayed.
