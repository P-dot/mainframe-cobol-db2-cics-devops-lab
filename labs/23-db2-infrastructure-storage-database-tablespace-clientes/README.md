# Lab 23 - Db2 Infrastructure for CICS/COBOL: Storage Group, Database, Tablespace and CLIENTES Table

## Objective

Build the first real Db2 infrastructure layer required before moving a CICS/COBOL transaction from VSAM-style data access to Db2 table access.

This lab covers the safe provisioning path up to the `IBMUSER.CLIENTES` table:

1. Inventory existing Db2 storage definitions.
2. Create a dedicated Storage Group.
3. Create a dedicated Database.
4. Create a dedicated Tablespace.
5. Create and verify the `IBMUSER.CLIENTES` table.

The lab stops intentionally before index creation. The next phase starts at **Fase 5.3 - unique index by DNI**.

---

## Environment

| Component | Value |
|---|---|
| Platform | ADCD / Hercules lab environment |
| z/OS user | `IBMUSER` |
| Db2 subsystem shown in SPUFI | `DB9G` |
| SPUFI input library | `IBMUSER.DB2LAB.SPUFI` |
| SPUFI output dataset | `IBMUSER.DB2LAB.SPUFO` |
| Db2 catalog tables used | `SYSIBM.SYSSTOGROUP`, `SYSIBM.SYSVOLUMES`, `SYSIBM.SYSDATABASE`, `SYSIBM.SYSTABLESPACE`, `SYSIBM.SYSTABLES` |

---

## Scope

Included:

- Storage Group inventory.
- Volume and VCAT discovery.
- Safe name availability checks.
- `CREATE STOGROUP DB2LABSG`.
- `CREATE DATABASE DB2LABDB`.
- `CREATE TABLESPACE DB2LABTS`.
- `CREATE TABLE IBMUSER.CLIENTES`.
- Catalog verification after each create.
- Troubleshooting evidence for one catalog-query error.

Not included:

- Unique index creation.
- Inserts into `CLIENTES`.
- QMF validation.
- DCLGEN.
- COBOL SQL program.
- DBRM generation.
- BIND PLAN/PACKAGE.
- CICS DB2CONN / DB2ENTRY / DB2TRAN.

---

## Technical Flow

```text
Existing ADCD Db2 catalog
        |
        v
Inventory SYSIBM.SYSSTOGROUP
        |
        v
Inventory SYSIBM.SYSVOLUMES
        |
        v
Discover VOLID = SBDB91 and VCATNAME = DSN910
        |
        v
CREATE STOGROUP DB2LABSG
        |
        v
CREATE DATABASE DB2LABDB
        |
        v
CREATE TABLESPACE DB2LABTS
        |
        v
CREATE TABLE IBMUSER.CLIENTES
```

Final structure:

```text
SBDB91
  ↓
VCAT DSN910
  ↓
STOGROUP DB2LABSG
  ↓
DATABASE DB2LABDB
  ↓
TABLESPACE DB2LABTS
  ↓
TABLE IBMUSER.CLIENTES
```

---

## Db2 Objects Created

### Storage Group

```sql
CREATE STOGROUP DB2LABSG
  VOLUMES (SBDB91)
  VCAT DSN910;
```

Verified through:

```sql
SELECT NAME, CREATOR, VCATNAME
FROM SYSIBM.SYSSTOGROUP
WHERE NAME = 'DB2LABSG';
```

and:

```sql
SELECT VOLID, SGNAME
FROM SYSIBM.SYSVOLUMES
WHERE SGNAME = 'DB2LABSG';
```

Observed result:

```text
VOLID  = SBDB91
SGNAME = DB2LABSG
```

---

### Database

```sql
CREATE DATABASE DB2LABDB
  STOGROUP DB2LABSG
  BUFFERPOOL BP0;
```

Verified through:

```sql
SELECT STGROUP, BPOOL, NAME, CREATOR
FROM SYSIBM.SYSDATABASE
WHERE NAME = 'DB2LABDB';
```

Observed result:

```text
STGROUP = DB2LABSG
NAME    = DB2LABDB
CREATOR = IBMUSER
```

---

### Tablespace

```sql
CREATE TABLESPACE DB2LABTS
  IN DB2LABDB
  USING STOGROUP DB2LABSG
  PRIQTY 12
  SECQTY 12
  ERASE NO
  FREEPAGE 0
  PCTFREE 10
  BUFFERPOOL BP0
  LOCKSIZE ANY
  LOCKMAX SYSTEM
  CLOSE YES;
```

Verified through:

```sql
SELECT NAME, DBNAME, BPOOL, LOCKRULE, LOCKMAX
FROM SYSIBM.SYSTABLESPACE
WHERE DBNAME = 'DB2LABDB'
  AND NAME   = 'DB2LABTS';
```

Observed result:

```text
NAME     = DB2LABTS
DBNAME   = DB2LABDB
BPOOL    = BP0
LOCKRULE = A
```

`LOCKRULE = A` corresponds to `LOCKSIZE ANY`.

---

### Table

```sql
CREATE TABLE IBMUSER.CLIENTES
 (
   DNI        CHAR(9)  NOT NULL,
   NOMBRE     CHAR(20) NOT NULL,
   APELLIDOS  CHAR(30) NOT NULL,
   DIRECCION  CHAR(35) NOT NULL
 )
 IN DB2LABDB.DB2LABTS;
```

Verified through:

```sql
SELECT DBNAME, TSNAME, NAME, CREATOR
FROM SYSIBM.SYSTABLES
WHERE CREATOR = 'IBMUSER'
  AND NAME    = 'CLIENTES';
```

Observed result:

```text
DBNAME = DB2LABDB
TSNAME = DB2LABTS
NAME   = CLIENTES
```

---

## Evidence Summary

Evidence is stored under:

```text
evidence/screenshots/
evidence/raw/
```

Key screenshots show:

- Existing Storage Groups listed from `SYSIBM.SYSSTOGROUP`.
- Storage Group volumes listed from `SYSIBM.SYSVOLUMES`.
- `SBDB91` identified as the target volume.
- `DSN910` identified as the VCAT for Db2 lab objects.
- `DB2LABSG` confirmed absent, then created and verified.
- `DB2LABDB` confirmed absent, then created and verified.
- `DB2LABTS` confirmed absent, then created and verified.
- `IBMUSER.CLIENTES` confirmed absent, then created and verified.
- `SQLCODE -206` caused by querying the invalid catalog column `CLOSE`, then corrected by removing that column.

---

## Professional Value

This lab demonstrates a safe Db2 provisioning workflow on z/OS:

- inspect existing Db2 catalog state before modification;
- avoid using system/default objects blindly;
- create dedicated lab objects with controlled names;
- verify each object through catalog queries;
- preserve SQL members and screenshots as repeatable evidence;
- stop cleanly before the next logical phase.

This is the infrastructure foundation for the next CICS/COBOL/Db2 lab, where the `CLIENTES` table will receive an index, test rows, DCLGEN declarations, and later a COBOL CICS program with embedded SQL.

---

## Continuation Point

The lab stops before Fase 5.3.

Next step:

```sql
SELECT CREATOR, NAME, TBCREATOR, TBNAME
FROM SYSIBM.SYSINDEXES
WHERE CREATOR = 'IBMUSER'
  AND NAME    = 'CLIDNIX';
```

If no rows are returned, the next lab can create:

```sql
CREATE UNIQUE INDEX IBMUSER.CLIDNIX
  ON IBMUSER.CLIENTES (DNI);
```
