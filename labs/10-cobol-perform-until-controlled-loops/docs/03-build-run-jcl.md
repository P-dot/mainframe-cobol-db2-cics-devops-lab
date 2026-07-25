# Build and run JCL

The lab uses a single job, `LOPALL`, with two logical phases:

1. `BUILD`: compile and link-edit `PARMLOP`.
2. `RUN`: execute the load module if the build completed successfully.

```jcl
//BUILD   EXEC IGYWCL,LNGPRFX='IGY420'
```

This uses the COBOL compile/link procedure available in the ADCD environment.

```jcl
//RUN     EXEC PGM=PARMLOP,COND=(0,NE)
```

The run step is protected by `COND=(0,NE)`, so the program is not executed when the build step fails.

`SYSIN DD *` passes the input message to the program, and `SYSOUT DD SYSOUT=*` captures the displayed output in SDSF.
