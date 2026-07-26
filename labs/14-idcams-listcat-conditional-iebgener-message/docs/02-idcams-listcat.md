# IDCAMS LISTCAT

The first step uses `IDCAMS`:

```jcl
//CATCHK  EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
  LISTCAT ENT('IBMUSER.COBOL.FILE80') ALL
/*
```

`LISTCAT` checks the catalog entry for `IBMUSER.COBOL.FILE80`.

A return code of `0` indicates that the dataset was found and the step completed successfully.
