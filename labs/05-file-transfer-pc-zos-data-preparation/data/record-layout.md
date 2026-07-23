# Layout del registro `ARCHI`

Archivo plano de longitud fija.

```text
Longitud total: 43 caracteres
RECFM: FB
LRECL: 43
```

| Posiciones | Campo | Longitud | Ejemplo |
|---:|---|---:|---|
| 1-7 | Código | 7 | `0000010` |
| 8-19 | Apellido | 12 | `FERNANDEZ   ` |
| 20-27 | Nombre | 8 | `CARLOS  ` |
| 28-35 | Ciudad | 8 | `MADRID  ` |
| 36-43 | Importe | 8 | `00000190` |

Reglas:

- No usar tabuladores.
- Usar espacios normales.
- Una línea equivale a un registro.
- Mantener longitud fija para que el dataset `FB,LRECL=43` reciba los datos correctamente.
