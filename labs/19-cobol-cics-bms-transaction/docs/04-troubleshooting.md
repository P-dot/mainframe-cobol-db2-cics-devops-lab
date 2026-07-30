# Troubleshooting notes

## BMS source issues

During manual entry of `HOLAMP`, several problems were diagnosed:

- Missing continuation `X` after a line ending with comma.
- Misspelled BMS macro `DFHDMI` instead of `DFHMDI`.
- Incorrect or incomplete final macro spelling around `DFHMSD TYPE=FINAL`.
- Confusion between the source currently shown in ISPF and old SDSF listings from previous job IDs.

## JCL issues in `CMPMAP`

The map assembler step originally had a wrong `SYSIN` where `SYSLIN` was required for the temporary object:

```jcl
//SYSLIN DD DSN=&&MAPOBJ,...
//SYSIN  DD DSN=IBMUSER.CICS.MAPS(HOLAMP),DISP=SHR
```

`SYSIN` is the input source. `SYSLIN` is the object stream passed to the binder/link-editor.

## COBOL CICS issues

The first COBOL source did not include the BMS symbolic copybook, so the compiler reported that `HOLAMPO` was not defined.

Fix:

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
COPY HOLAMP.
...
EXEC CICS SEND MAP('HOLAMP')
               MAPSET('HOLAMP')
               FROM(HOLAMPO)
               ERASE
END-EXEC.
```

## CICS runtime issue

The transaction was defined and installed, but failed with:

```text
DFHAC2016 CICS Transaction HOLA cannot run because program HOLA is not available.
```

Fix:

```text
CEDA DEFINE LIBRARY(LAB19LIB) GROUP(LAB19)
DSNAME01 = IBMUSER.CICS.LOAD
CEDA INSTALL GROUP(LAB19)
```
