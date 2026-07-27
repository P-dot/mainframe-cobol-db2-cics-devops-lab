# Sentinel-controlled loop

The core loop is:

```cobol
           PERFORM 2000-PROCESO UNTIL W-CTRL = '%'.
```

The program uses a priming read pattern:

```text
1. Initialize the input area.
2. Read the first input record in 1000-INICIO.
3. Process while W-CTRL is not '%'.
4. At the end of each iteration, read the next input record.
```

This avoids printing the sentinel line itself.
