# Build and run JCL

`CTLALL` uses two steps:

| Step | Purpose |
|---|---|
| `BUILD` | Compile and link-edit `PARMCTL` |
| `RUN` | Execute `PARMCTL` |

The `RUN` step passes multiple lines through `SYSIN`.
