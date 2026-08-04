# 06 - Troubleshooting notes

## BMS continuation error

Symptom:

```text
ASMA431W Continuation statement may be in error
ASMA141E Bad character in operation code
Highest Severity Code 8
```

Cause:

The BMS continuation `X` was not in column 72. The assembler interpreted the next line as a new operation instead of a continuation.

Fix:

Use `COLS` in ISPF and place each continuation `X` in column 72.

## JCL COND period error

Symptom:

```text
IEFC621I INCORRECT USE OF PERIOD IN THE COND FIELD
```

Cause:

A period was used in a `COND` expression instead of commas.

Correct examples:

```jcl
COND=(4,LT,TRN)
COND=(4,LT,COBOL)
```

## COBOL hyphen error

Symptom:

```text
"MAPA" was not defined as a data-name
"8000-ENVIAR" was not defined as a procedure-name
```

Cause:

A paragraph reference was typed with a space instead of a hyphen.

Correct:

```cobol
PERFORM 8000-ENVIAR-MAPA.
```

## MAPFAIL is expected

`MAPFAIL` is not a broken transaction in this lab. It is expected when the user presses Enter without sending modified map data.

The program handles it with:

```cobol
WHEN DFHRESP(MAPFAIL)
     PERFORM 4000-FALLO-MAPA
```

## CEDF Enter behavior

In CEDF, pressing Enter advances the debugger through CICS commands. It may take multiple Enter presses to reach the final visible user screen.
