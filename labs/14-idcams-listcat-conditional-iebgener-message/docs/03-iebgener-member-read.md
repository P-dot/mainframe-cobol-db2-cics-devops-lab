# IEBGENER member read check

The second step uses `IEBGENER` to validate that `CLIENTE1` can be read:

```jcl
//READMBR EXEC PGM=IEBGENER,COND=(0,NE,CATCHK)
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=IBMUSER.COBOL.FILE80(CLIENTE1),DISP=SHR
//SYSUT2   DD DUMMY
//SYSIN    DD DUMMY
```

`SYSUT1` is the input member.

`SYSUT2 DD DUMMY` discards the copied output because this step is used only as a readability test.

`COND=(0,NE,CATCHK)` prevents this step from running if the catalog check did not end with return code 0.
