# 02 - Build flow

## BMS build

`CMPA2MP` processes the same BMS source twice:

```text
SYSPARM(MAP)   -> physical map load module
SYSPARM(DSECT) -> COBOL symbolic copybook
```

Outputs:

```text
IBMUSER.CICS.LOAD(ALL2MP)
IBMUSER.CICS.COPY(ALL2MP)
```

## COBOL CICS build

`CMPALL2` uses three steps:

```text
TRN    -> DFHECP1$ translates EXEC CICS commands
COBOL  -> IGYCRCTL compiles the translated COBOL
LKED   -> IEWL creates IBMUSER.CICS.LOAD(ALL2)
```

The link-edit includes:

```text
INCLUDE SYSLIB(DFHELII)
NAME ALL2(R)
```

`DFHELII` is the CICS interface stub required for the program to run under CICS.
