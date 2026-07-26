# Lab 13 - COBOL PERFORM VARYING counter-controlled loop

## Objective

This lab demonstrates a COBOL batch loop controlled directly by the `PERFORM VARYING ... FROM ... BY ... UNTIL` syntax.

Unlike previous loop examples where the counter was initialized with `MOVE` and incremented with `ADD`, this program defines the initial value, increment and termination condition inside the `PERFORM` statement itself.

## Environment

- Platform: IBM z/OS ADCD 1.11 on Hercules / zPDT-style lab environment
- User: `IBMUSER`
- Source library: `IBMUSER.COBOL.SRC`
- Load library: `IBMUSER.COBOL.LOAD`
- JCL library: `IBMUSER.ML.JCL`
- Validation: SDSF / SYSOUT

## Dataset and members

| Type | Member |
|---|---|
| COBOL source | `IBMUSER.COBOL.SRC(PARMVRY)` |
| Build/run JCL | `IBMUSER.ML.JCL(VRYALL)` |
| Load module | `IBMUSER.COBOL.LOAD(PARMVRY)` |

## Technical scope

This lab covers:

- COBOL paragraph-based program structure
- `PERFORM VARYING`
- Counter-controlled loop syntax
- `FROM`, `BY` and `UNTIL`
- Batch input with `SYSIN`
- Batch output with `SYSOUT`
- One JCL job for compile, link-edit and execution
- Diagnosis of typical JCL/source reference mistakes

## Expected result

The program reads a line from `SYSIN`, displays an initialization message and then repeats the input message five times.

```text
INICIO DEL PROGRAMA PARMVRY
MENSAJE CON PERFORM VARYING DESDE SYSIN
MENSAJE CON PERFORM VARYING DESDE SYSIN
MENSAJE CON PERFORM VARYING DESDE SYSIN
MENSAJE CON PERFORM VARYING DESDE SYSIN
MENSAJE CON PERFORM VARYING DESDE SYSIN
```

## Evidence

Evidence is included under:

```text
evidence/raw/CLASE18-final-evidence.docx
evidence/screenshots/
evidence/output/expected-sysout.txt
```

The captured evidence shows:

1. `VRYALL` JCL.
2. `PARMVRY` COBOL source.
3. Final SDSF `SYSOUT` output.

## Professional value

This lab demonstrates a cleaner COBOL loop pattern where initialization and increment logic are embedded in `PERFORM VARYING`. It also reinforces the difference between source input (`COBOL.SYSIN`) and load output (`LKED.SYSLMOD`) in compile/link JCL.
