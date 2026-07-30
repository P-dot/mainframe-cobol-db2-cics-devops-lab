# Overview

The source video explains how ADCD startup profiles can be used to prepare and run DB2/CICS-enabled environments. In this local system, the important finding is that the machine already uses `LOADDB`.

Therefore, the lab does not repeat startup sequencing. It verifies the active profile and confirms the availability of DB2 and CICS from several viewpoints:

```text
Console /D A,L
Console /D IPLINFO
SDSF DA
DB2I menu
CICS welcome screen
```
