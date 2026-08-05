# Final Status

## Completed

- `IBMUSER.DB2LAB.SPUFI` used as SQL input library.
- `IBMUSER.DB2LAB.SPUFO` used as SPUFI output dataset.
- Existing Storage Groups inventoried.
- Existing Storage Group volumes inventoried.
- `VCATNAME = DSN910` identified for Db2 lab objects.
- `VOLID = SBDB91` identified for Db2 lab objects.
- `DB2LABSG` checked free, created and verified.
- `DB2LABDB` checked free, created and verified.
- `DB2LABTS` checked free, created and verified.
- `IBMUSER.CLIENTES` checked free, created and verified.

## Stop point

The lab stops before:

```text
Fase 5.3 - unique index by DNI
```

## Next first command

```sql
SELECT CREATOR, NAME, TBCREATOR, TBNAME
FROM SYSIBM.SYSINDEXES
WHERE CREATOR = 'IBMUSER'
  AND NAME    = 'CLIDNIX';
```
