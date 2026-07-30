# Lab 19 - COBOL CICS BMS Transaction

## Objective

Build and execute a first custom CICS transaction in the ADCD z/OS 1.11 lab environment.

This lab creates a BMS map, builds it, creates a COBOL CICS program that sends the map, compiles and link-edits the program, defines the required CICS resources, exposes the private load library to the running region, installs the group, and verifies the transaction from a real 3270 CICS session.

## Environment

- Platform: z/OS ADCD 1.11 on Hercules
- CICS region: `CICSA`
- CICS product libraries: `DFH410.CICS.*`
- User datasets: `IBMUSER.CICS.*`
- CICS group used for this lab: `LAB19`
- Load library exposed to CICS: `IBMUSER.CICS.LOAD`
- Existing DB2 connectivity baseline visible in region: `GROUP(ALL4)` / `DB2CONN(CICSDB2)`

## Resources created

| Resource | Type | Purpose |
|---|---|---|
| `IBMUSER.CICS.MAPS(HOLAMP)` | BMS source | 3270 screen definition |
| `IBMUSER.CICS.LOAD(HOLAMP)` | BMS load module | Mapset loadable by CICS |
| `IBMUSER.CICS.COPY(HOLAMP)` | COBOL copybook | BMS symbolic map used by COBOL |
| `IBMUSER.CICS.SRC(HOLA)` | COBOL CICS source | Program that sends the BMS map |
| `IBMUSER.CICS.LOAD(HOLA)` | COBOL load module | CICS program module |
| `PROGRAM(HOLA)` | CICS resource | Logical program definition |
| `MAPSET(HOLAMP)` | CICS resource | Logical mapset definition |
| `TRANSACTION(HOLA)` | CICS resource | Transaction code executed by user |
| `LIBRARY(LAB19LIB)` | CICS resource | Dynamic access to `IBMUSER.CICS.LOAD` |

## Final result

The transaction `HOLA` executed successfully and displayed the BMS screen in CICS.

## What this lab demonstrates

1. How a BMS map source becomes both a CICS mapset load module and a COBOL symbolic copybook.
2. How a COBOL CICS source program is translated, compiled, and link-edited.
3. Why CICS resource definition alone is not enough if the runtime region cannot see the private load library.
4. How `LIBRARY(LAB19LIB)` solves the classic runtime error **program not available**.
5. The end-to-end path from source members to a working custom CICS transaction.

## Evidence

Important evidence is stored under:

- `evidence/screenshots/` - expanded visual evidence of the full step-by-step workflow
- `evidence/raw/` - Word notes and debug captures used during the build
- `evidence/output/final-screen.txt` - text capture of the final success screen

## Visual step-by-step summary

1. Confirm the region already has the expected DB2 baseline (`01-cics-all4-db2conn-baseline.png`).
2. Create and correct the BMS source member `HOLAMP` (`02-holamp-bms-source-corrected.png`).
3. Review and submit the BMS build JCL `CMPMAP` (`03-cmpmap-jcl-build-map.png`).
4. Observe the first failed `CMPMAP` run and inspect the MAPASM diagnostics (`04` to `06`).
5. Create the COBOL program `HOLA` that sends map `HOLAMP` (`07-hola-cobol-source.png`).
6. Fix early `CMPHOLA` JCL and build issues (`08` and `09`).
7. Verify the final successful COBOL translate/compile/link-edit sequence (`10` and `11`).
8. Define `PROGRAM`, `MAPSET`, and `TRANSACTION` resources in `CEDA` (`12` to `14`).
9. Install the resource group (`15-ceda-install-group-lab19.png`).
10. Hit the expected runtime error **program not available** before the CICS library is exposed (`16-runtime-program-not-available.png`).
11. Confirm that simply typing `CEDA HOLA` is not a valid command path (`17-ceda-invalid-hola-command.png`).
12. Define `LIBRARY(LAB19LIB)` pointing to `IBMUSER.CICS.LOAD` (`18-ceda-define-library-lab19lib.png`).
13. Re-run transaction `HOLA` and confirm the final BMS screen appears (`19-final-transaction-screen-hola.png`).

## Build sequence

1. Create private CICS lab datasets with `CRCICS`.
2. Create BMS map source `HOLAMP`.
3. Build the BMS map with `CMPMAP`:
   - `MAPASM` creates the map object.
   - `LINKMAP` creates the mapset load module.
   - `DSECT` creates the symbolic COBOL copybook.
4. Create COBOL CICS source `HOLA`.
5. Build `HOLA` with `CMPHOLA`:
   - `TRN` translates `EXEC CICS` commands.
   - `COBOL` compiles the translated COBOL.
   - `LKED` creates the executable load module.
6. Define CICS resources with `CEDA`.
7. Define and install `LIBRARY(LAB19LIB)` so CICS can find `IBMUSER.CICS.LOAD`.
8. Execute transaction `HOLA`.

## Notes

- The final screen shows `TANSACCION` instead of `TRANSACCION`. That is only a text typo in the BMS map and does not affect the technical result. A corrected reference version is included in `bms/HOLAMP-corrected-typo-reference.bms`.
- The evidence set intentionally keeps both failure and success screenshots. For this lab, the troubleshooting path is part of the learning value.
