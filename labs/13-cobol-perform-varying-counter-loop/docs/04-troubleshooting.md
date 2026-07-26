# Troubleshooting

## Wrong source/load reference

A common error is to point `COBOL.SYSIN` to the load library instead of the source library.

Incorrect:

```jcl
//COBOL.SYSIN DD DSN=IBMUSER.COBOL.LOAD(PARMVRY),DISP=SHR
```

Correct:

```jcl
//COBOL.SYSIN DD DSN=IBMUSER.COBOL.SRC(PARMVRY),DISP=SHR
```

`COBOL.SYSIN` must feed source code to the compiler.

## Misspelled counter name

If the variable is declared as:

```cobol
       01  W-CONTADOR            PIC 9(02).
```

then every reference must use the same name:

```cobol
              UNTIL W-CONTADOR = 6.
```

A typo such as `W-ONTADOR` causes a compiler message indicating that the data-name was not defined.

## Punctuation in multi-line PERFORM

Correct:

```cobol
           PERFORM 2000-PROCESO
              VARYING W-CONTADOR FROM 1 BY 1
              UNTIL W-CONTADOR = 6.
```

Do not place a period after `2000-PROCESO` because the statement continues on the following lines.
