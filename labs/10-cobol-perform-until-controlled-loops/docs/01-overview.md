# Overview

This lab introduces controlled repetition in COBOL batch programming.

Previous labs used COBOL paragraphs to organize a program into initialization, processing and finalization sections. This lab extends that pattern by executing the processing paragraph multiple times.

The core pattern is:

```cobol
PERFORM 2000-PROCESO UNTIL W-CONTADOR = 5.
```

The program reads one line from `SYSIN`, stores it in `W-MES`, and displays it five times in `SYSOUT`.
