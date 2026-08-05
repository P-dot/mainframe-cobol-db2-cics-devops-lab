# Troubleshooting Notes

## SPUFI CCSID warning

A CCSID warning appeared during SPUFI execution:

```text
DSNE345I WARNING: DB2 DATA CORRUPTION CAN RESULT ...
```

In this lab the SQL used uppercase object names and simple ASCII characters only. No accented literals or special characters were inserted.

Operational note:

```text
Avoid accents, ñ, and non-basic characters in SPUFI SQL literals while this warning exists.
```

## SQLCODE 100 after SELECT in SPUFI

Some successful SELECT statements ended with:

```text
SQLCODE IS 100
```

In SPUFI this can appear after the rows have already been displayed and no more rows remain to fetch. It is not the same as a failed create statement.

The evidence was accepted when the output also showed:

```text
NUMBER OF ROWS DISPLAYED IS ...
COMMIT PERFORMED, SQLCODE IS 0
```

## SQLCODE -206 on `CLOSE`

The verification query:

```sql
SELECT NAME, DBNAME, BPOOL, LOCKRULE, LOCKMAX, CLOSE
FROM SYSIBM.SYSTABLESPACE
WHERE DBNAME = 'DB2LABDB'
  AND NAME   = 'DB2LABTS';
```

returned:

```text
SQLCODE = -206
CLOSE IS NOT VALID IN THE CONTEXT WHERE IT IS USED
```

Interpretation:

- The tablespace creation was correct.
- The failing point was the catalog query column `CLOSE`.
- The corrected query removed `CLOSE`.

Corrected query:

```sql
SELECT NAME, DBNAME, BPOOL, LOCKRULE, LOCKMAX
FROM SYSIBM.SYSTABLESPACE
WHERE DBNAME = 'DB2LABDB'
  AND NAME   = 'DB2LABTS';
```

## Display width limitations

Several SPUFI outputs showed only the first columns clearly. When a needed value was shifted off-screen, the query was rewritten with the important column first.

Examples:

```sql
SELECT VOLID, SGNAME
FROM SYSIBM.SYSVOLUMES
ORDER BY VOLID, SGNAME;
```

```sql
SELECT VCATNAME, NAME, CREATOR
FROM SYSIBM.SYSSTOGROUP
ORDER BY VCATNAME, NAME;
```

```sql
SELECT DBNAME, TSNAME, NAME, CREATOR
FROM SYSIBM.SYSTABLES
WHERE CREATOR = 'IBMUSER'
  AND NAME    = 'CLIENTES';
```
