# Lab 08 - COBOL procedures, SYSIN and structured batch execution

## Objective

This lab demonstrates how to structure simple COBOL batch programs using paragraph-based procedures and how to pass input data from JCL through `SYSIN`.

Two COBOL styles are documented:

1. Direct paragraph execution with `PERFORM paragraph-name`.
2. Explicit paragraph ranges with `PERFORM paragraph-name THRU paragraph-end-name`.

The lab also includes a single JCL job that compiles, link-edits and executes the COBOL program in one controlled flow.

## Environment

- Platform: IBM ADCD z/OS 1.11 on Hercules / zPDT-style lab environment
- User: `IBMUSER`
- COBOL compiler procedure: `IGYWCL`
- Compiler prefix used in this environment: `LNGPRFX='IGY420'`
- Source library: `IBMUSER.COBOL.SRC`
- Load library: `IBMUSER.COBOL.LOAD`
- JCL library: `IBMUSER.ML.JCL`
- Output validation: SDSF / `SYSOUT`

## Programs

| Program | Source member | Purpose |
|---|---|---|
| `PARMPRC` | `IBMUSER.COBOL.SRC(PARMPRC)` | Structured COBOL with simple paragraph `PERFORM` calls. |
| `PARMTHR` | `IBMUSER.COBOL.SRC(PARMTHR)` | Structured COBOL with `PERFORM ... THRU ...` paragraph ranges. |

## JCL members

| JCL member | Purpose |
|---|---|
| `CMPPRC` | Compile and link-edit `PARMPRC`. |
| `RUNPRC` | Execute `PARMPRC` and pass input through `SYSIN`. |
| `THRALL` | Compile, link-edit and execute `PARMTHR` in one job. |

## Execution flow

```text
JCL SYSIN
   -> COBOL ACCEPT W-MES
   -> WORKING-STORAGE variable
   -> COBOL DISPLAY
   -> SYSOUT in SDSF
```

For the `PARMTHR` version, the main procedure flow is:

```cobol
       PROCEDURE DIVISION.
           PERFORM 1000-INICIO THRU 1000-INICIO-F.
           PERFORM 2000-PROCESO THRU 2000-PROCESO-F.
           PERFORM 3000-FIN THRU 3000-FIN-F.
```

## Validation

The final successful `SYSOUT` for `PARMTHR` shows:

```text
INICIO DEL PROGRAMA
TEXTO RECIBIDO DESDE SYSIN:
ESTE TEXTO VIENE DESDE EL JCL THRU
```

## Troubleshooting summary

During the lab, `THRALL` initially ended with `COND CODE 0012`. The compile listing was reviewed in SDSF and the COBOL diagnostics were used to correct the source.

Issues corrected:

- Invalid `PIC`/`PICTURE` clause caused by incorrect punctuation on `01 W-MES PIC X(80).`.
- Paragraph-name mismatch: `2000-PROCESO` must match exactly in both the `PERFORM` statement and the paragraph definition.
- Missing period before the first paragraph after the main `PERFORM` sequence.
- Incorrect statement terminator: COBOL source must use a period, not a semicolon, to close the data declaration.

## Professional value

This lab shows a complete COBOL batch lifecycle:

- Source creation in a PDS member.
- Compile and link-edit with JCL.
- Load module generation.
- Runtime input through `SYSIN`.
- Output validation through `SYSOUT` in SDSF.
- Diagnosis of compile errors using COBOL compiler messages.

It is a small lab, but it demonstrates the working pattern used in larger COBOL batch systems.
