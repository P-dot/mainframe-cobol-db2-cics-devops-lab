# Overview

This lab continues the DFSORT sequence after basic sorting, counting, control-break processing, `INCLUDE`, and `OMIT`.

It introduces two advanced record transformation techniques:

1. `INREC BUILD` to construct a new output record layout.
2. `INREC IFTHEN` with `OVERLAY` to write conditional flags into a selected output position.

Both jobs read `IBMUSER.COBOL.FILE80(CLIENTE1)` and write new members in the same PDS.
