# Conditional message with IF/THEN/ENDIF

The final message is emitted only when `READMBR` succeeds:

```jcl
//        IF (READMBR.RC = 0) THEN
//MSGOK   EXEC PGM=IEBGENER
...
//        ENDIF
```

The message is supplied through `SYSUT1 DD *` and written to `SYSOUT` through `SYSUT2 DD SYSOUT=*`.

This produces a clear validation result:

```text
IBMUSER.COBOL.FILE80(CLIENTE1) EXISTE Y ES LEGIBLE
```
