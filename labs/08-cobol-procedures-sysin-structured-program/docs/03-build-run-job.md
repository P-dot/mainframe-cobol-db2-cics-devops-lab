# 03 - Build and run job

The `THRALL` JCL performs the full lifecycle for `PARMTHR`:

1. `BUILD` step: compile and link-edit through `IGYWCL`.
2. `RUN` step: execute the generated load module.

The run step uses:

```jcl
//RUN     EXEC PGM=PARMTHR,COND=(0,NE)
```

The `COND=(0,NE)` condition prevents execution when the previous build step did not finish with return code zero. This avoids accidentally running an older load module after a failed compile.
