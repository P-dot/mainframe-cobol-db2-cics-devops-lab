# Build flow

## BMS map build

`CMPMAP` uses:

- `ASMA90` with `SYSPARM(MAP)` to assemble the physical map.
- `IEWL` to link-edit the mapset into `IBMUSER.CICS.LOAD(HOLAMP)`.
- `ASMA90` with `SYSPARM(DSECT)` to generate `IBMUSER.CICS.COPY(HOLAMP)`.

Expected result:

```text
MAPASM   COND CODE 0000
LINKMAP  COND CODE 0000
DSECT    COND CODE 0000
```

## COBOL CICS build

`CMPHOLA` uses:

- `DFHECP1$` to translate `EXEC CICS` commands.
- `IGYCRCTL` to compile the translated COBOL.
- `IEWL` to link-edit the final load module in `IBMUSER.CICS.LOAD(HOLA)`.

Expected result:

```text
TRN      COND CODE 0000
COBOL    COND CODE 0000
LKED     COND CODE 0000
```
