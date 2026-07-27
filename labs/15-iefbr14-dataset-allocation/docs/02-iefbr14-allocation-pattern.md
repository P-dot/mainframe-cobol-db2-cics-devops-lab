# IEFBR14 allocation pattern

The job step is intentionally simple:

```jcl
//STEP01 EXEC PGM=IEFBR14
```

The program does not perform business processing. It allows z/OS to process the DD statement.

`DISP=(NEW,CATLG,DELETE)` means: create a new dataset, catalog it if successful, and delete it if creation fails.
