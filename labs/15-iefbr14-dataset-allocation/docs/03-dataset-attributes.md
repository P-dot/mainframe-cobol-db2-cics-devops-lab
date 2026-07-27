# Dataset attributes

The DCB defines the physical record structure:

```jcl
DCB=(DSORG=PS,RECFM=FB,LRECL=80,BLKSIZE=800)
```

- `DSORG=PS`: physical sequential dataset
- `RECFM=FB`: fixed blocked records
- `LRECL=80`: 80-byte logical records
- `BLKSIZE=800`: 800-byte physical blocks
