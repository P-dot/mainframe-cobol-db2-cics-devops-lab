# Estado conocido correcto

## Correcto

```text
DB2CONN CICSDB2 -> DB9G
DB2ENTRY ALL4 -> PLAN ALL4P
DB2TRAN ALL4TRAN -> TRANSID ALL4
MAPSET ALL4MP definido
LIBRARY ALL4LIB -> IBMUSER.CICS.LOAD
PROGRAM ALL4 definido/enabled
TRANSACTION ALL4 definido/enabled
BIND PLAN ALL4P successful
COBOL compile RC 0
LKED RC 0
NEWCOPY RESPONSE NORMAL
CEDF RECEIVE MAP RESPONSE NORMAL
```

## Evidencia funcional parcial

- El mapa inicial `CLIENTES DB2` aparece.
- El campo `DNI` acepta entrada.
- `CEDF` muestra que el `RECEIVE MAP` recibe `23456789B`.
- `SEND MAP` se alcanza.
- `FREEKB` corrigió el bloqueo `X SYSTEM`.

## No correcto / pendiente

- Los campos de salida `DNIO`, `NOMBREO`, `APELLIDO`, `DIRECCIO`, `MSGO` no se visualizan de forma fiable.
- La prueba de depuración forzando valores antes del `SEND MAP` no mostró los datos esperados.
- Queda pendiente aislar si el problema está en mapa físico, mapa simbólico, refresco de mapset o tratamiento de área BMS.
