# Lab 09 - DFSORT record selection with INCLUDE and OMIT

## Objective

Demonstrate DFSORT record selection and output formatting on ADCD z/OS using two complementary approaches:

1. `INCLUDE COND` to select records that meet a condition.
2. `OMIT COND` to exclude records that meet a condition.

Both jobs read from `IBMUSER.COBOL.FILE80(CLIENTE1)` and generate formatted output members containing the current date, surname, currency marker and amount.

## Environment

- Platform: ADCD z/OS 1.11 on Hercules / zPDT-style lab environment
- User: `IBMUSER`
- Input PDS: `IBMUSER.COBOL.FILE80`
- JCL library: `IBMUSER.ML.JCL`
- Utility: DFSORT via `PGM=SORT`

## Datasets and members

| Purpose | Member |
|---|---|
| Input file | `IBMUSER.COBOL.FILE80(CLIENTE1)` |
| Output for INCLUDE < 600 | `IBMUSER.COBOL.FILE80(CLI600)` |
| Output for OMIT >= 400 | `IBMUSER.COBOL.FILE80(CLI399)` |
| INCLUDE job | `IBMUSER.ML.JCL(SEL600)` |
| OMIT job | `IBMUSER.ML.JCL(OMT400)` |

## Part 1 - INCLUDE condition

`SEL600` keeps only records whose amount is lower than `00000600`.

```text
SORT FIELDS=COPY
INCLUDE COND=(36,8,CH,LT,C'00000600')
OUTREC FIELDS=(DATE1,C' ',8,12,C' $',36,8)
```

Output member:

```text
IBMUSER.COBOL.FILE80(CLI600)
```

## Part 2 - OMIT condition

`OMT400` omits records whose amount is greater than or equal to `00000400`. Therefore, the output keeps only records below `00000400`.

```text
SORT FIELDS=COPY
OMIT COND=(36,8,CH,GE,C'00000400')
OUTREC FIELDS=(DATE,C' ',8,12,C' $',36,8)
```

Output member:

```text
IBMUSER.COBOL.FILE80(CLI399)
```

## Validation

The lab evidence confirms:

- `CLI600` was created.
- `SEL600` was coded using `INCLUDE COND`.
- `CLI600` contains formatted records with amounts lower than 600.
- `CLI399` was created.
- `OMT400` was coded using `OMIT COND`.
- `CLI399` contains formatted records after excluding amounts greater than or equal to 400.

## Professional value

This lab shows a common batch-processing pattern: read a fixed-length input file, apply selection criteria, reformat the selected records and create a downstream file for another process.
