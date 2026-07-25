# Lab 10 - COBOL controlled loops with PERFORM UNTIL

## Objective

Build, compile, link-edit and execute a structured COBOL batch program that repeats a processing paragraph a fixed number of times using `PERFORM ... UNTIL`.

The lab demonstrates:

- COBOL paragraph-based program structure.
- A numeric counter defined in `WORKING-STORAGE`.
- Counter initialization with `MOVE`.
- Controlled repetition with `PERFORM ... UNTIL`.
- Counter increment with `ADD`.
- SYSIN input and SYSOUT validation.
- A single JCL job that builds and runs the COBOL program.

## Environment

- Platform: z/OS ADCD 1.11 on Hercules / zPDT-style lab environment
- User: IBMUSER
- Source library: `IBMUSER.COBOL.SRC`
- Load library: `IBMUSER.COBOL.LOAD`
- JCL library: `IBMUSER.ML.JCL`
- Compiler procedure: `IGYWCL`
- Compiler prefix: `LNGPRFX='IGY420'`

## Members

| Type | Member | Purpose |
|---|---|---|
| COBOL source | `PARMLOP` | Controlled loop program |
| JCL | `LOPALL` | Compile, link-edit and run |
| SYSIN text | inline JCL | Input message repeated by the program |
| SYSOUT | SDSF output | Runtime validation |

## Program flow

```text
1000-INICIO
    initialize counter
    read SYSIN message
    display start message

2000-PROCESO
    display SYSIN message
    increment counter

3000-FIN
    stop program
```

The processing paragraph runs while `W-CONTADOR` is less than 5. The program starts with `W-CONTADOR = 0`, displays the input message, increments the counter, and stops when the counter reaches 5.

## Expected SYSOUT

```text
INICIO DEL PROGRAMA PARMLOP
MENSAJE REPETIDO DESDE SYSIN
MENSAJE REPETIDO DESDE SYSIN
MENSAJE REPETIDO DESDE SYSIN
MENSAJE REPETIDO DESDE SYSIN
MENSAJE REPETIDO DESDE SYSIN
```

## Validation

The evidence shows:

1. `PARMLOP` stored in `IBMUSER.COBOL.SRC`.
2. `LOPALL` stored in `IBMUSER.ML.JCL`.
3. Successful program output in SDSF.
4. One initialization line plus five repeated SYSIN messages.

## Operational note

This lab intentionally keeps the loop controlled. In production-style batch work, a missing counter increment can create an uncontrolled loop, rapidly growing SYSOUT and consuming JES spool. The increment statement is therefore part of the functional control logic, not decorative code.
