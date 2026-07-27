# Lab 16 - COBOL multi-line SYSIN processing with sentinel control

## Objective

This lab demonstrates how to process multiple in-stream input records from JCL `SYSIN` using COBOL and a sentinel control character.

The program reads one input line at a time. The first character of each line is treated as a control field. The remaining characters are treated as text. Processing continues until the control character is `%`.

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
| COBOL source | `IBMUSER.COBOL.SRC(PARMCTL)` |
| Build/run JCL | `IBMUSER.ML.JCL(CTLALL)` |
| Load module | `IBMUSER.COBOL.LOAD(PARMCTL)` |

## Technical scope

- COBOL grouped data item with level `05` fields
- `INITIALIZE`, `ACCEPT`, `DISPLAY`
- Multi-line `SYSIN`
- Sentinel-controlled loop with `PERFORM ... UNTIL`
- Priming read pattern
- One JCL job for compile, link-edit and execution

## Input model

Each `SYSIN` line is interpreted as:

| Position | COBOL field | Meaning |
|---|---|---|
| 1 | `W-CTRL` | Control character |
| 2-51 | `W-TEXTO` | Text payload |

Example:

```text
+PRIMER MENSAJE DESDE SYSIN
+SEGUNDO MENSAJE DESDE SYSIN
+TERCER MENSAJE DESDE SYSIN
%
```

The `%` line terminates the loop and is not printed.

## Expected result

```text
INICIO DEL PROGRAMA PARMCTL
PRIMER MENSAJE DESDE SYSIN
SEGUNDO MENSAJE DESDE SYSIN
TERCER MENSAJE DESDE SYSIN
FIN DEL PROGRAMA PARMCTL
```

## Evidence

Evidence is included under `evidence/raw/BUCLE.docx`, `evidence/screenshots/`, and `evidence/output/expected-sysout.txt`.

## Professional value

This lab demonstrates a common batch-processing pattern: data-driven looping. Instead of hardcoding the number of iterations inside COBOL, the JCL input stream controls how many records are processed.
