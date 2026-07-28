# TIMES and nested loops

The program repeats work at three levels:

```cobol
           PERFORM 2000-PROCESO 4 TIMES.
```

Inside `2000-PROCESO`:

```cobol
           PERFORM 2100-IMPRIME-TEXTO 2 TIMES.
```

Inside `2100-IMPRIME-TEXTO`:

```cobol
           PERFORM 5 TIMES
              DISPLAY 'HOLA'
              DISPLAY 'HOLA OTRA VEZ'
              DISPLAY 'HOLA DE NUEVO'
           END-PERFORM.
```

The multiplication is:

```text
4 process executions
x 2 paragraph executions
x 5 inline loop executions
x 3 DISPLAY lines
= 120 generated message lines
```

The program also writes a start line and an end line.
