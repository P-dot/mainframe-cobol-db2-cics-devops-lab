# Lab 14 - IDCAMS LISTCAT and conditional IEBGENER message

## Objective

This lab demonstrates how to verify a z/OS dataset and member using batch utilities, evaluate return codes, and emit a clear operator-facing message in `SYSOUT`.

The job uses:

- `IDCAMS LISTCAT` to verify that the PDS is cataloged.
- `IEBGENER` to verify that a member can be read.
- JCL `IF/THEN/ENDIF` to emit a confirmation message only when the read step succeeds.

## Environment

- Platform: IBM z/OS ADCD 1.11 on Hercules / zPDT-style lab environment
- User: `IBMUSER`
- JCL library: `IBMUSER.ML.JCL`
- Data library: `IBMUSER.COBOL.FILE80`
- Validation: SDSF / SYSOUT

## Dataset and members

| Type | Name |
|---|---|
| JCL | `IBMUSER.ML.JCL(VERCLIM)` |
| Cataloged PDS checked | `IBMUSER.COBOL.FILE80` |
| Member checked | `IBMUSER.COBOL.FILE80(CLIENTE1)` |

## Technical scope

This lab covers:

- `IDCAMS`
- `LISTCAT`
- `IEBGENER`
- `COND`
- JCL `IF/THEN/ENDIF`
- `SYSPRINT`
- `SYSUT1`
- `SYSUT2`
- `SYSIN DD DUMMY`
- `SYSOUT` validation through SDSF

## Job flow

```text
CATCHK  -> IDCAMS LISTCAT validates IBMUSER.COBOL.FILE80
READMBR -> IEBGENER attempts to read IBMUSER.COBOL.FILE80(CLIENTE1)
MSGOK   -> IEBGENER emits a confirmation message when READMBR.RC = 0
```

## Expected result

The final `SYSOUT` message is:

```text
IBMUSER.COBOL.FILE80(CLIENTE1) EXISTE Y ES LEGIBLE
```

## Evidence

Evidence is included under:

```text
evidence/raw/VERCLIM.docx
evidence/screenshots/
evidence/output/expected-sysout.txt
```

## Professional value

This lab shows a production-style JCL pattern: validate input availability, check return codes, and provide a clear message for an operator or reviewer. It is more robust than relying only on a final condition code because it confirms both catalog availability and member readability.
