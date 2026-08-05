# Source Notes

This lab is based on the video sequence where the author prepares Db2 infrastructure for a future CICS/COBOL/Db2 transaction.

The relevant source idea is:

```text
Previous program: ALL3 using VSAM.
Target program: ALL4 using Db2.
This phase: prepare Db2 objects before connecting CICS and COBOL to Db2.
```

The lab adapts the author’s sequence to the local ADCD/Hercules environment:

```text
M.CORNER naming       -> IBMUSER.DB2LAB naming
author's VCAT/volume -> discovered local DSN910 / SBDB91
author's BP1 path    -> safe BP0 path for this environment
```

The lab intentionally avoids altering buffer pools.
