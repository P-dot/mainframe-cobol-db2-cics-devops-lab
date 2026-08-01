# Theory - COBOL sequential file input

## From SYSIN to physical datasets

Earlier labs used `SYSIN`, where records were embedded directly inside the JCL. In this lab the input lives in a real z/OS dataset:

```text
IBMUSER.COBOL.ENTR50
```

The program does not know the dataset name directly. Instead, it knows a logical file name and a DDNAME.

## The COBOL side

The key declaration is:

```cobol
SELECT FICHERO-ENT ASSIGN TO S-ENTRADA
    ORGANIZATION IS SEQUENTIAL
    ACCESS MODE IS SEQUENTIAL
    FILE STATUS IS FS-ESTADO.
```

Meaning:

- `FICHERO-ENT` is the internal COBOL file name.
- `S-ENTRADA` tells Enterprise COBOL 4.2 to use the external DDNAME `ENTRADA` for the sequential file.
- `ORGANIZATION IS SEQUENTIAL` states that records are processed in physical order.
- `ACCESS MODE IS SEQUENTIAL` states that the program reads one record after another.
- `FILE STATUS IS FS-ESTADO` captures the result of file operations.

## The JCL side

The execution JCL provides the external file with:

```jcl
//ENTRADA DD DSN=IBMUSER.COBOL.ENTR50,DISP=SHR
```

This is the bridge between COBOL and z/OS allocation.

## File status

The final working version uses:

```cobol
01  FS-ESTADO             PIC XX VALUE '00'.
```

and compares it as a character code:

```cobol
PERFORM 2000-PROCESO UNTIL FS-ESTADO = '10'.
```

The important statuses in this lab are:

```text
'00' = normal operation
'10' = end of file
```

## Read pattern

The program performs a first read in `1000-INICIO`, then processes the current record and reads the next record inside `2000-PROCESO`.

```text
OPEN
READ first record
PERFORM until EOF
    DISPLAY current record
    READ next record
CLOSE
```

This avoids processing an empty or non-existent record after EOF.
