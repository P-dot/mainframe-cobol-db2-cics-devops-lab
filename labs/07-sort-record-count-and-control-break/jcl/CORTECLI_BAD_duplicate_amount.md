# Variante incorrecta documentada: importe duplicado

En el vídeo se muestra un error conceptual: incluir manualmente el campo de importe en la salida cuando SORT ya lo añade como campo sumarizado.

La idea equivocada sería construir una salida que mete de nuevo el importe original y después conserva también el importe sumarizado.

En nuestro lab se evita usando:

```jcl
  SORT FIELDS=(8,12,CH,A)
  SUM FIELDS=(36,8,ZD)
  OUTREC FIELDS=(8,28,36,8)
```

La salida final correcta queda con:

```text
APELLIDO + NOMBRE + CIUDAD + IMPORTE_TOTAL
```

sin duplicar el campo de importe.
