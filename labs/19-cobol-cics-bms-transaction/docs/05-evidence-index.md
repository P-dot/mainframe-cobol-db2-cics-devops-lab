# Evidence index

## Expanded screenshot set

### Baseline and source creation
- `01-cics-all4-db2conn-baseline.png` - Existing `GROUP(ALL4)` showing `DB2CONN(CICSDB2)` in the region.
- `02-holamp-bms-source-corrected.png` - Corrected BMS source member `IBMUSER.CICS.MAPS(HOLAMP)`.
- `03-cmpmap-jcl-build-map.png` - JCL used to assemble, link, and DSECT the BMS map.
- `07-hola-cobol-source.png` - COBOL source `IBMUSER.CICS.SRC(HOLA)` with `EXEC CICS SEND MAP`.

### BMS build troubleshooting and success
- `04-cmpmap-first-run-rc12.png` - First `CMPMAP` run failing with `COND CODE 0012` and `LINKMAP` skipped.
- `05-mapasm-summary-rc12.png` - MAPASM summary screen confirming return code 012.
- `06-mapasm-error-detail-dfh.png` - Detailed assembler diagnostics for the incorrect BMS source.

### COBOL build troubleshooting and success
- `08-cmphola-jcl-error-disp-apostrophe.png` - Early JCL syntax error during `CMPHOLA` preparation.
- `09-cmphola-cobol-step-sysin-not-found.png` - `CMPHOLA COBOL` failing because the translated SYSIN data set was not found.
- `10-cmphola-success-page1.png` - Final successful `CMPHOLA` build, first SDSF page.
- `11-cmphola-success-page2.png` - Final successful `CMPHOLA` build, second SDSF page showing LKED completion.

### CICS resource definition
- `12-ceda-define-program-hola.png` - `PROGRAM(HOLA)` defined in `GROUP(LAB19)`.
- `13-ceda-define-mapset-holamp.png` - `MAPSET(HOLAMP)` defined in `GROUP(LAB19)`.
- `14-ceda-define-transaction-hola.png` - `TRANSACTION(HOLA)` defined in `GROUP(LAB19)`.
- `15-ceda-install-group-lab19.png` - `INSTALL GROUP(LAB19)` completed successfully.
- `17-ceda-invalid-hola-command.png` - `CEDA HOLA` shown as an invalid direct command, useful as an operator note.
- `18-ceda-define-library-lab19lib.png` - `LIBRARY(LAB19LIB)` exposing `IBMUSER.CICS.LOAD` to CICS.

### Runtime verification
- `16-runtime-program-not-available.png` - Initial runtime failure before defining the CICS library.
- `19-final-transaction-screen-hola.png` - Final successful CICS screen rendered by transaction `HOLA`.

## Raw Word evidence

- `COBOL_CICS_final_map_build.docx` - BMS build and CEDA setup progression.
- `COBOL_CICS_holamp_cmphola_source.docx` - HOLAMP and CMPHOLA source/build work.
- `ERROR2_cobol_compile_debug.docx` - COBOL compile/debug evidence.
- `ERRORES_bms_debug.docx` - BMS/MAPASM troubleshooting evidence.

## Interpretation note

The screenshot set intentionally includes failed intermediate states. In this lab they are not noise; they document the real troubleshooting sequence needed to go from source member creation to a working CICS transaction.
