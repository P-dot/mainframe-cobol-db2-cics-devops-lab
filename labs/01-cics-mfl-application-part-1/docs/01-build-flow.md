# Build Flow

## Proven Local Pattern

The MFL BMS build was not designed from scratch. It was adapted from the previous CICS Lab 04 build that already worked on the same ADCD z/OS 1.11 system.

```text
BMS source
IBMUSER.CICS.MAPS(MFLSET)
        |
        | ASMA90
        | SYSPARM(MAP)
        v
temporary object
&&MAPOBJ
        |
        | IEWL
        v
physical map
IBMUSER.CICS.LOAD(MFLSET)
```

The same source is then processed again:

```text
IBMUSER.CICS.MAPS(MFLSET)
        |
        | ASMA90
        | SYSPARM(DSECT)
        v
symbolic map / copy
IBMUSER.CICS.COPY(MFLSET)
```

## JCL Condition Logic

`LINKMAP` is executed only when `MAPASM` returns zero.

`DSECT` is executed only when `LINKMAP` returns zero.

This means a non-zero return code from the first assembler step intentionally prevents downstream generation and avoids treating invalid output as a valid map.
