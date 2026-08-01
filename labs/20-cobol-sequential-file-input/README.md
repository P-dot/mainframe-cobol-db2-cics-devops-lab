# Lab 20 - COBOL Sequential File Input with JCL DDNAME

## Objective

Create and execute a COBOL batch program that reads a physical sequential dataset through a JCL DDNAME.

The lab moves from previous `SYSIN` examples to a real z/OS dataset:

```text
IBMUSER.COBOL.ENTR50
```

The program reads fixed-length records from that dataset and writes them to `SYSOUT`.

## Environment

- Platform: z/OS ADCD 1.11 on Hercules
- User: `IBMUSER`
- COBOL compiler procedure: `IGYWCL`
- Compiler level observed in evidence: IBM Enterprise COBOL for z/OS 4.2.0
- JCL library: `IBMUSER.ML.JCL`
- COBOL source library: `IBMUSER.COBOL.SRC`
- COBOL load library: `IBMUSER.COBOL.LOAD`
- Input dataset: `IBMUSER.COBOL.ENTR50`

## Dataset design

The input dataset is sequential and fixed-length:

```text
DSORG=PS
RECFM=FB
LRECL=50
BLKSIZE=500
```

This matches the COBOL record definition:

```cobol
01  REG-ENTRADA           PIC X(50).
```

## Logical-to-physical file binding

The COBOL program uses an internal file name:

```cobol
SELECT FICHERO-ENT ASSIGN TO S-ENTRADA
```

The JCL execution step supplies the external DDNAME:

```jcl
//ENTRADA DD DSN=IBMUSER.COBOL.ENTR50,DISP=SHR
```

Therefore, the runtime chain is:

```text
COBOL internal file name: FICHERO-ENT
        ↓
ASSIGN TO S-ENTRADA
        ↓
JCL DDNAME: ENTRADA
        ↓
Physical dataset: IBMUSER.COBOL.ENTR50
```

## Build and run flow

1. `CRIN50` creates `IBMUSER.COBOL.ENTR50` as `FB 50`.
2. ISPF edit loads five sample records into the dataset.
3. `PRUEBA3` declares the file in `ENVIRONMENT DIVISION` and `FILE SECTION`.
4. `CMPPRU3` compiles and link-edits the COBOL program.
5. `RUNPRU3` executes the program and connects the file with `//ENTRADA DD`.
6. `SYSOUT` shows the five records read from the dataset.

## Final validation

The final `RUNPRU3` output shows all five records printed in `SYSOUT`:

```text
REGISTRO 01 - HOLA DESDE FICHERO SECUENCIAL
REGISTRO 02 - COBOL LEE ESTE DATASET
REGISTRO 03 - DDNAME ENTRADA DESDE JCL
REGISTRO 04 - FILE STATUS CONTROLARA EL EOF
REGISTRO 05 - FIN DE DATOS DE PRUEBA
```

## Learning value

This lab demonstrates a classic COBOL batch pattern used constantly in mainframe work:

- physical sequential dataset allocation;
- fixed-record data design;
- `SELECT` and `ASSIGN` binding;
- `FD` and record layout;
- `OPEN`, `READ`, `AT END`, `CLOSE` lifecycle;
- `FILE STATUS` handling;
- JCL DDNAME-to-program integration;
- SDSF verification of compile, link-edit, execution, and `SYSOUT`.

## Evidence

Evidence is organized under:

```text
evidence/screenshots/
evidence/screenshots/debug/
evidence/output/
evidence/raw/
```

The debug screenshots are intentionally preserved because they show the real error path: `ASSIGN`, spelling, missing periods, and `FILE STATUS` literals.
