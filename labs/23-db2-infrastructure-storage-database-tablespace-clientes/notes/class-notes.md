# Class Notes - What this lab means

## Relation to the source video

The source lesson explains the preparation required before a CICS transaction can move from VSAM-style access to Db2 access.

The author’s path is:

```text
prepare working datasets
use SPUFI
create Storage Group
create Database
create Tablespace
create Table
insert rows
use QMF
generate DCLGEN
later connect CICS and Db2
```

This lab implements the infrastructure part in the local ADCD/Hercules environment and stops before the index/data/DCLGEN phase.

## Why we did inventory first

The author creates a Storage Group in his own environment because he already knows his volume and VCAT.

In this lab the safer approach was:

```text
catalog inventory
volume discovery
VCAT discovery
name availability check
object creation
catalog verification
```

That avoids accidentally using system defaults or QMF/sample objects.

## Storage Group

A Storage Group is not a table and does not hold business rows directly.

It tells Db2 where it may allocate physical datasets for objects that need storage.

For this lab:

```text
DB2LABSG -> SBDB91 / DSN910
```

## Database

In Db2 for z/OS, a database is a logical container.

For this lab:

```text
DB2LABDB uses DB2LABSG and BP0
```

## Tablespace

The tablespace is the storage area where table data will live.

For this lab:

```text
DB2LABTS is inside DB2LABDB
DB2LABTS uses DB2LABSG
DB2LABTS uses BP0
LOCKSIZE ANY appears as LOCKRULE A
```

## CLIENTES table

The table created here is the future data source for a CICS/COBOL/Db2 program.

Columns:

```text
DNI        CHAR(9)
NOMBRE     CHAR(20)
APELLIDOS  CHAR(30)
DIRECCION  CHAR(35)
```

Future application flow:

```text
CICS BMS map receives DNI
COBOL moves DNI to host variable
EXEC SQL SELECT reads IBMUSER.CLIENTES
CICS sends response map with the customer data
```

## Why the lab stops at Fase 5.2

The next logical unit is access optimization and application-readiness:

```text
unique index by DNI
insert test rows
query data
DCLGEN
COBOL host variables
DBRM
BIND
CICS-Db2 connection
```

That deserves its own lab section.
