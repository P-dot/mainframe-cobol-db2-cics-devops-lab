# 03 - CEDA runtime resources

CICS must know the program, the mapset, the transaction, and the library containing the private load modules.

Commands used:

```text
DEFINE PROGRAM(ALL2) GROUP(LAB21) LANGUAGE(COBOL)
DEFINE MAPSET(ALL2MP) GROUP(LAB21)
DEFINE TRANSACTION(ALL2) GROUP(LAB21) PROGRAM(ALL2)
DEFINE LIBRARY(LAB21LIB) GROUP(LAB21) DSNAME01(IBMUSER.CICS.LOAD)
INSTALL GROUP(LAB21)
```

The dynamic `LIBRARY(LAB21LIB)` is important because the modules are in `IBMUSER.CICS.LOAD`, not in a standard CICS system load library.
