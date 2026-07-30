# LOADDB and IPLINFO verification

The key evidence is the `D IPLINFO` output.

Observed values:

```text
USED LOADDB IN SYS1.IPLPARM ON 0A82
IEASYS LIST = DB
IPL DEVICE = 0A80
```

Interpretation:

- The active IPL profile is `LOADDB`.
- The system parameter list in use is associated with `DB`.
- The current IPL device is `0A80`.

This means the system is not running a minimal cold-start profile. It is already in the DB-enabled profile needed for DB2/CICS verification.
