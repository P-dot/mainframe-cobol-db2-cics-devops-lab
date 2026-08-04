# Lab 21 - CICS Pseudoconversational BMS COMMAREA with CEDF

## Objective

Build, install, execute and debug a complete CICS pseudoconversational transaction in the ADCD z/OS 1.11 lab environment.

This lab creates a BMS map, generates the physical map and COBOL symbolic map, builds a COBOL CICS program using `SEND MAP`, `RETURN TRANSID`, `COMMAREA`, `RECEIVE MAP`, `DFHRESP(NORMAL)` and `DFHRESP(MAPFAIL)`, defines the runtime resources in CEDA, and validates the internal flow with CEDF.

## Environment

- Platform: z/OS ADCD 1.11 on Hercules
- CICS region: `CICSA`
- CICS libraries observed: `DFH410.CICS.*`
- COBOL compiler observed: IBM Enterprise COBOL for z/OS 4.2.0
- User datasets: `IBMUSER.CICS.*`
- CICS group: `LAB21`
- Transaction: `ALL2`
- Program: `ALL2`
- Mapset/map: `ALL2MP`
- Runtime load library: `IBMUSER.CICS.LOAD`

## Resources created

| Resource | Type | Purpose |
|---|---|---|
| `IBMUSER.CICS.MAPS(ALL2MP)` | BMS source | Defines the 3270 screen with `CAMPO1`, `CAMPO2` and `MSG` |
| `IBMUSER.CICS.LOAD(ALL2MP)` | BMS load module | Physical map used by CICS `SEND MAP` |
| `IBMUSER.CICS.COPY(ALL2MP)` | COBOL copybook | Symbolic map with `ALL2MPI`, `ALL2MPO`, `CAMPO1I`, `CAMPO1O`, `CAMPO2O`, `MSGO` |
| `IBMUSER.CICS.SRC(ALL2)` | COBOL CICS source | Pseudoconversational program |
| `IBMUSER.CICS.LOAD(ALL2)` | COBOL load module | Executable CICS program |
| `PROGRAM(ALL2)` | CICS resource | Program definition |
| `MAPSET(ALL2MP)` | CICS resource | Mapset definition |
| `TRANSACTION(ALL2)` | CICS resource | Transaction code for the user |
| `LIBRARY(LAB21LIB)` | CICS resource | Dynamic access to `IBMUSER.CICS.LOAD` |

## Final result

The transaction `ALL2` runs successfully in CICS and demonstrates both controlled branches:

```text
MAPFAIL branch:
MENSAJE: NO ME HAGAS TRABAJAR EN BALDE
```

```text
NORMAL branch:
CAMPO1: OK
CAMPO2: HOLA
MENSAJE: ESTOY PSEUDOCONVERSANDO DESDE CICS
```

## What this lab demonstrates

1. A BMS map source becoming both a CICS mapset load module and a COBOL symbolic map.
2. A COBOL CICS program using `EIBCALEN` to separate first invocation from later invocations.
3. The pseudoconversational pattern: `SEND MAP -> RETURN -> RECEIVE MAP -> SEND MAP -> RETURN`.
4. How `RETURN TRANSID('ALL2') COMMAREA(...) LENGTH(8)` ends the task but preserves enough context for the next entry.
5. How CEDF proves the flow internally: `EIBCALEN = 0` first, then `EIBCALEN = 8` after COMMAREA.
6. How `MAPFAIL` is handled as a normal CICS condition rather than an uncontrolled failure.
7. How `CEDA` resources expose private lab load modules to the running CICS region.

## Build sequence

1. Create BMS source `ALL2MP` in `IBMUSER.CICS.MAPS`.
2. Build `ALL2MP` with `CMPA2MP`:
   - `MAPASM` creates the map object.
   - `LINKMAP` creates `IBMUSER.CICS.LOAD(ALL2MP)`.
   - `DSECT` creates `IBMUSER.CICS.COPY(ALL2MP)`.
3. Validate the symbolic map and field names.
4. Create COBOL CICS source `ALL2`.
5. Build `ALL2` with `CMPALL2`:
   - `TRN` translates `EXEC CICS` commands.
   - `COBOL` compiles the translated source.
   - `LKED` link-edits with `DFHELII`.
6. Define and install CICS resources in CEDA.
7. Execute `ALL2` normally.
8. Debug with CEDF and capture the pseudoconversational lifecycle.

## CEDF proof points

The CEDF evidence shows:

```text
First invocation:
EIBCALEN = 0
EXEC CICS SEND MAP
EXEC CICS RETURN TRANSID('ALL2') COMMAREA('ALL2CTX') LENGTH(8)

Second invocation:
COMMAREA = 'ALL2CTX'
EIBCALEN = 8
EXEC CICS RECEIVE MAP
```

The `MAPFAIL` test shows:

```text
RESPONSE: MAPFAIL
EIBRESP = 36
```

The `NORMAL` test shows:

```text
EXEC CICS SEND MAP
RESPONSE: NORMAL
EIBRESP = 0
```

## Evidence

Evidence is organized under:

```text
evidence/screenshots/
evidence/raw/
evidence/output/
```

The screenshot set intentionally preserves both mistakes and final success, because the troubleshooting path is part of the professional value of the lab.

## Notes

- `MAPFAIL` is expected when the user presses Enter without modified map data.
- In CEDF, several Enter presses may be required because Enter advances the debugger one command at a time; it does not always mean “submit user data”.
- The BMS continuation `X` must be in column 72. This lab includes that as a documented troubleshooting item.
