# Inline PERFORM

The inline block is:

```cobol
           PERFORM 5 TIMES
              DISPLAY 'HOLA'
              DISPLAY 'HOLA OTRA VEZ'
              DISPLAY 'HOLA DE NUEVO'
           END-PERFORM.
```

This does not call a separate paragraph. The instructions are written directly between `PERFORM` and `END-PERFORM`.

A key punctuation rule is used here: the individual `DISPLAY` statements inside the inline block do not end with periods. The period is placed after `END-PERFORM`.
