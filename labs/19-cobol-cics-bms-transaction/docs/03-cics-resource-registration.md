# CICS resource registration

The load modules alone are not enough. CICS needs logical resource definitions.

This lab uses a separate group:

```text
GROUP(LAB19)
```

Resources:

```text
PROGRAM(HOLA)
MAPSET(HOLAMP)
TRANSACTION(HOLA)
LIBRARY(LAB19LIB)
```

`DEFINE` stores the resource definitions. `INSTALL` activates them in the running CICS region.

`LIBRARY(LAB19LIB)` was necessary because the program initially failed with:

```text
DFHAC2016 CICS Transaction HOLA cannot run because program HOLA is not available.
```

The root cause was that CICS could not load the module from `IBMUSER.CICS.LOAD` until that library was exposed through a CICS `LIBRARY` resource.
