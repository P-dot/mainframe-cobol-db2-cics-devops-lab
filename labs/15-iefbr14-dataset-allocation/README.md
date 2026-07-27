# Lab 15 - IEFBR14 dataset allocation

## Objective

This lab demonstrates how to allocate and catalog a sequential dataset in z/OS using a simple JCL step with `IEFBR14`.

The key point is that `IEFBR14` is a dummy program. The dataset allocation happens when z/OS processes the `DD` statement, especially `DISP`, `UNIT`, `SPACE` and `DCB`.

## Environment

- Platform: IBM z/OS ADCD 1.11 on Hercules / zPDT-style lab environment
- User: `IBMUSER`
- JCL library: `IBMUSER.ML.JCL`
- Dataset created: `IBMUSER.COBOL.NEW80`
- Validation: ISPF 3.4 / dataset list and job output

## Dataset definition

| Attribute | Value |
|---|---|
| Dataset name | `IBMUSER.COBOL.NEW80` |
| Organization | Sequential dataset (`DSORG=PS`) |
| Record format | Fixed blocked (`RECFM=FB`) |
| Logical record length | `LRECL=80` |
| Block size | `BLKSIZE=800` |
| Space | `SPACE=(TRK,(1,1))` |
| Unit | `SYSDA` |
| Disposition | `DISP=(NEW,CATLG,DELETE)` |

## Job flow

```text
CRNEW80
   |
   +-- STEP01 EXEC PGM=IEFBR14
          |
          +-- NEW80 DD allocates IBMUSER.COBOL.NEW80
```

## Expected result

The job ends successfully and the dataset appears cataloged as `IBMUSER.COBOL.NEW80`.

Expected dataset attributes:

```text
Organization . . . PS
Record format . . . FB
Record length . . . 80
Block size . . . . . 800
```

## Evidence

Evidence is included under:

```text
evidence/raw/IEFBR14.docx
evidence/screenshots/
```

## Professional value

This lab demonstrates a common z/OS administration pattern: allocating a dataset safely through JCL without touching system libraries. This is a foundational operation before using utilities such as `IEBGENER`, `SORT`, `IDCAMS` or COBOL batch programs.
