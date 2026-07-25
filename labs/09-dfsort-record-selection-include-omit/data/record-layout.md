# Record layout used in this lab

Input member:

```text
IBMUSER.COBOL.FILE80(CLIENTE1)
```

Relevant fields reused from the previous DFSORT labs:

| Field | Start | Length | Usage |
|---|---:|---:|---|
| Customer surname | 8 | 12 | Copied to output with `8,12` |
| Amount | 36 | 8 | Compared by `INCLUDE` / `OMIT` and copied to output |

The input member belongs to `IBMUSER.COBOL.FILE80`, a fixed-length 80-byte PDS used for the COBOL/JCL utility exercises.
