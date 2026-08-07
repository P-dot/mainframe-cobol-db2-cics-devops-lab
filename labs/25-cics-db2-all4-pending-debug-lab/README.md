# Lab 25 — CICS + Db2 ALL4: integración compilada, BIND correcto y fallo runtime pendiente

## Estado

**Pendiente / en investigación.**

Este laboratorio documenta un caso real de aprendizaje: una transacción CICS `ALL4` con BMS + COBOL + Db2 fue construida casi completa, pero quedó pendiente de resolver un fallo de presentación/runtime. Se sube al repositorio porque los errores también son evidencia profesional: muestran diagnóstico, método, trazabilidad y capacidad de aislamiento.

## Objetivo técnico

Construir una transacción CICS que consulte la tabla Db2 `IBMUSER.CLIENTES` mediante COBOL con SQL embebido.

Flujo previsto:

```text
Usuario CICS
  -> TRANSACTION ALL4
  -> PROGRAM ALL4
  -> MAPSET ALL4MP
  -> DB2TRAN ALL4TRAN
  -> DB2ENTRY ALL4 / PLAN ALL4P
  -> DB2CONN CICSDB2 / DB2ID DB9G
  -> IBMUSER.CLIENTES
```

## Lo que quedó conseguido

- Tabla `IBMUSER.CLIENTES` creada y cargada previamente.
- `DB2CONN CICSDB2` verificada contra `DB9G`.
- `DB2ENTRY ALL4` definida con `PLAN ALL4P`.
- `DB2TRAN ALL4TRAN` definida para `TRANSID ALL4`.
- Mapa BMS `ALL4MP` compilado: `MAPASM`, `LINKMAP`, `DSECT` correctos.
- Programa `ALL4` precompilado/traducido/compilado/linkedado.
- DBRM `IBMUSER.DB2LAB.DBRMLIB(ALL4)` generado.
- `BIND PLAN(ALL4P)` correcto.
- `PROGRAM(ALL4)`, `TRANSACTION(ALL4)`, `LIBRARY(ALL4LIB)` definidos e instalados.
- `NEWCOPY` aplicado correctamente.
- `CEDF` confirmó que `RECEIVE MAP` recibe el DNI y que `SEND MAP` llega a ejecutarse.

## Fallo pendiente

La transacción muestra el mapa `ALL4MP` y recibe el DNI, pero el resultado no se pinta correctamente. En un momento se observó una salida parcial tipo `CLIENTE N`; después, al añadir pruebas de depuración, el mapa seguía sin mostrar los campos esperados.

El laboratorio queda cerrado como **fallido-controlado**, con una hipótesis de investigación para la siguiente sesión: posible desalineación entre mapa físico y mapa simbólico, problema de refresco de mapset, tratamiento BMS de área simbólica `ALL4MPO`, uso de `LOW-VALUES`, o necesidad de probar `SEND TEXT`/`MAPONLY`/`DATAONLY` para aislar la capa BMS.

## Valor profesional

Este lab demuestra una ruta completa de diagnóstico mainframe:

- análisis de errores de precompilador Db2,
- corrección de `SYSUT1/SYSUT2`,
- corrección de `SQLCA`,
- resolución de errores `IGY...`,
- corrección de link-edit con Language Environment,
- BIND PLAN Db2,
- instalación CICS,
- uso de `CEDF`, `CEMT`, `CEDA`, SDSF y consola.

## Próxima sesión

Continuar desde `docs/06-next-session-runbook.md`.
