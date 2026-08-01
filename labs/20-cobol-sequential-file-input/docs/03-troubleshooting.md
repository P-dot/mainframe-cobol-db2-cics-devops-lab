# Troubleshooting notes

## `ASSIGN TO ENTRADA` rejected

In this ADCD / Enterprise COBOL 4.2 environment, `ASSIGN TO ENTRADA` was rejected during compilation.

Working form used in this lab:

```cobol
SELECT FICHERO-ENT ASSIGN TO S-ENTRADA
```

The execution JCL still uses:

```jcl
//ENTRADA DD DSN=IBMUSER.COBOL.ENTR50,DISP=SHR
```

## `REG-ENTRADA` not defined

Cause: typing the data-name without the hyphen, for example:

```cobol
01  REG ENTRADA PIC X(50).
```

Correct form:

```cobol
01  REG-ENTRADA PIC X(50).
```

## `FS-ESTAOO` not defined

Cause: final letter `O` typed instead of `D`.

Correct form:

```cobol
FS-ESTADO
```

## `A period was required before WORKING-STORAGE SECTION`

Cause: missing full stop after the `01 REG-ENTRADA` definition.

Correct form:

```cobol
01  REG-ENTRADA           PIC X(50).

WORKING-STORAGE SECTION.
```

## `'10' was not defined as a data-name`

The final working code treats file status as a two-character code:

```cobol
01  FS-ESTADO             PIC XX VALUE '00'.
```

Therefore EOF must be handled as:

```cobol
MOVE '10' TO FS-ESTADO
```

not as:

```cobol
MOVE 10 TO FS-ESTADO
```

This was the final compile error before the successful `COND CODE 0000`.
