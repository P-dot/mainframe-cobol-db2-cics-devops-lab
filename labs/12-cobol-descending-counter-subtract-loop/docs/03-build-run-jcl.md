# Build and run JCL

The job `DCALL` has two steps:

| Step | Purpose |
|---|---|
| `BUILD` | Compile and link-edit `PARMDEC` using `IGYWCL` |
| `RUN` | Execute `PARMDEC` from `IBMUSER.COBOL.LOAD` |

The `RUN` step includes:

```jcl
//STEPLIB DD DSN=IBMUSER.COBOL.LOAD,DISP=SHR
//SYSOUT  DD SYSOUT=*
//SYSIN   DD *
MENSAJE CON CONTADOR DESCENDENTE DESDE SYSIN
/*
```

`STEPLIB` locates the load module, `SYSIN` provides input, and `SYSOUT` receives the program output.
