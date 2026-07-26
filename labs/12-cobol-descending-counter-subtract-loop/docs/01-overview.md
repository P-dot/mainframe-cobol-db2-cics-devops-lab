# Overview

This lab implements a COBOL batch program with a descending controlled loop.

The program follows a simple paragraph structure:

```text
1000-INICIO
2000-PROCESO
3000-FIN
```

The loop is controlled by a numeric counter initialized to `20`. The process paragraph is executed until the counter becomes lower than `15`.

The message is read once from `SYSIN` and displayed repeatedly through `SYSOUT`.
