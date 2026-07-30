# DB2 and CICS address-space verification

SDSF `DA` and the activity display show DB2/CICS-related address spaces.

Relevant examples observed in the evidence:

```text
D9G1MSTR
D9G1IRLM
D9GDBM1
D9GDIST
CICSA
```

Interpretation:

- `D9G1MSTR` is the DB2 master address space.
- `D9G1IRLM` is the DB2 lock/resource manager component.
- `D9GDBM1` and `D9GDIST` indicate additional DB2 components.
- `CICSA` indicates the CICS region is present.

This validates that the runtime environment has more than the base TSO/ISPF stack active.
