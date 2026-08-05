# Lab 22 - CICS/Db2 SPUFI Workbench Setup and Validation

## Objetivo

Preparar el banco de trabajo Db2 necesario para continuar la evolución desde CICS/VSAM hacia CICS/Db2, siguiendo el enfoque del vídeo de Mainframe Corner pero adaptado al entorno `IBMUSER` del laboratorio.

Este cierre cubre solo:

```text
Fase 1: creación de datasets de trabajo IBMUSER.DB2LAB.*
Fase 2: validación de SPUFI contra catálogo Db2
```

La fase 3 y siguientes quedan aplazadas.

## Contexto

El vídeo parte de una idea profesional: transformar una transacción que antes leía VSAM en una transacción CICS/Db2. Antes de programar el futuro `ALL4`, el autor prepara librerías Db2, scripts SPUFI, salida SPUFI, DCLGEN, DBRMLIB y material de BIND.

En este laboratorio se ha adaptado ese enfoque a:

```text
IBMUSER.DB2LAB.SPUFI
IBMUSER.DB2LAB.SPUFO
IBMUSER.DB2LAB.DCLGEN
IBMUSER.DB2LAB.DBRMLIB
IBMUSER.DB2LAB.BIND
IBMUSER.DB2LAB.OUT
```

## Fase 1 - Datasets de trabajo

Miembro JCL:

```text
IBMUSER.ML.JCL(CRDB2WK)
```

Programa usado:

```text
IEFBR14
```

Resultado observado en ISPF 3.4:

```text
IBMUSER.DB2LAB.BIND
IBMUSER.DB2LAB.DBRMLIB
IBMUSER.DB2LAB.DCLGEN
IBMUSER.DB2LAB.OUT
IBMUSER.DB2LAB.SPUFI
IBMUSER.DB2LAB.SPUFO
```

## Fase 2 - Validación de SPUFI

Miembro SQL final:

```text
IBMUSER.DB2LAB.SPUFI(SPU000)
```

SQL final ejecutado:

```sql
SELECT COUNT(*)
FROM SYSIBM.SYSTABLES;
```

Resultado observado:

```text
619
NUMBER OF ROWS DISPLAYED IS 1
STATEMENT EXECUTION WAS SUCCESSFUL, SQLCODE IS 100
COMMIT PERFORMED, SQLCODE IS 0
```

Interpretación:

- SPUFI funcionó.
- Db2 respondió.
- El catálogo `SYSIBM.SYSTABLES` fue consultable.
- El `SQLCODE 100` en este contexto de SELECT indica fin de filas después de mostrar el resultado, no un fallo funcional.

## Errores útiles documentados

### `SYSIBM.SYSDUMMY1` no definido

```sql
SELECT CURRENT DATE
FROM SYSIBM.SYSDUMMY1;
```

Resultado:

```text
SQLCODE = -204
SYSIBM.SYSDUMMY1 IS AN UNDEFINED NAME
```

Lectura: la sentencia llegó a Db2, pero el objeto no estaba disponible/resuelto en este entorno.

### `VALUES CURRENT DATE` no soportado

```sql
VALUES CURRENT DATE;
```

Resultado:

```text
SQLCODE = -142
THE SQL STATEMENT IS NOT SUPPORTED
```

Lectura: esa forma de sentencia no estaba soportada por este entorno Db2/SPUFI.

### Doble prefijo `IBMUSER`

Síntoma:

```text
IBMUSER.IBMUSER.DB2LAB.SPUFO
```

Corrección usada:

```text
Input  ===> DB2LAB.SPUFI(SPU000)
Output ===> DB2LAB.SPUFO
```

## Valor profesional

Este lab demuestra una forma correcta de trabajar en mainframe:

```text
no crear objetos Db2 a ciegas
preparar librerías de trabajo
validar SPUFI con una consulta no destructiva
leer SQLCODE y mensajes DSN
documentar errores y correcciones
separar laboratorio de librerías de sistema
```

## Pendiente para fase 3+

```text
Inventario de SYSIBM.SYSSTOGROUP
Inventario de SYSIBM.SYSVOLUMES
Decidir storage group
Crear database
Crear tablespace
Crear tabla CLIENTES
Crear índice
Insertar datos
Consultar datos
Generar DCLGEN
Preparar compilación COBOL CICS Db2
```

## Referencias

- IBM Db2 for z/OS - SPUFI panel and output behavior.
- IBM Db2 for z/OS - SQLCODE handling.
- IBM Db2 for z/OS - DCLGEN.
- Vídeo/transcripción de Mainframe Corner sobre entorno Db2 para futura transacción CICS/Db2.
