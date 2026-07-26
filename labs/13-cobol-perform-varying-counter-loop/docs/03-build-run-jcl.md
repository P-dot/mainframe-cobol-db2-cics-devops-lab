# Build and run JCL

The job `VRYALL` has two steps:

| Step | Purpose |
|---|---|
| `BUILD` | Compile and link-edit `PARMVRY` using `IGYWCL` |
| `RUN` | Execute `PARMVRY` from `IBMUSER.COBOL.LOAD` |

Important DD statements:

```jcl
//COBOL.SYSIN DD DSN=IBMUSER.COBOL.SRC(PARMVRY),DISP=SHR
```

This points to the COBOL source member.

```jcl
//LKED.SYSLMOD DD DSN=IBMUSER.COBOL.LOAD(PARMVRY),DISP=SHR
```

This defines where the load module is written.

```jcl
//STEPLIB DD DSN=IBMUSER.COBOL.LOAD,DISP=SHR
```

This lets the run step find `PARMVRY`.
