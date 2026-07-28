# Build and run JCL

`TMSALL` contains two major steps:

| Step | Purpose |
|---|---|
| `BUILD` | Compile and link-edit `PARMTMS` using `IGYWCL` |
| `RUN` | Execute `PARMTMS` |

The final `RUN` step uses:

```jcl
//STEPLIB DD DSN=*.BUILD.LKED.SYSLMOD,DISP=SHR
```

This references the same load library/member allocation used by the link-edit step inside the `BUILD` procedure.
