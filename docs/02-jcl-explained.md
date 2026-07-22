# JCL explicado

## CRCOBOL

Objetivo: crear las librerías base para COBOL.

- `IEFBR14`: programa usado para que z/OS procese las DD y cree datasets.
- `DISP=(NEW,CATLG,DELETE)`: crear, catalogar si va bien, borrar si falla.
- `DSORG=PO`: librería particionada con miembros.
- `RECFM=FB,LRECL=80`: formato de fuente COBOL/JCL.
- `RECFM=U`: formato de LOADLIB para módulos ejecutables.

Archivo: [`../jcl/CRCOBOL.jcl`](../jcl/CRCOBOL.jcl)

## CMPHELLO

Objetivo: compilar, link-editar y ejecutar `HELLO`.

- `EXEC IGYWCLG`: PROC de COBOL para Compile + Link + Go.
- `LNGPRFX='IGY420'`: adapta la PROC a la librería real `IGY420.SIGYCOMP`.
- `COBOL.SYSIN`: fuente que entra al compilador.
- `LKED.SYSLMOD`: destino del módulo en LOADLIB.
- `GO.SYSOUT`: salida del programa.

Archivo: [`../jcl/CMPHELLO.jcl`](../jcl/CMPHELLO.jcl)

## CMPARM

Objetivo: compilar y link-editar `PARMES`, sin ejecutarlo.

- `EXEC IGYWCL`: PROC de COBOL para Compile + Link.
- No usa `GO`, porque la ejecución se hace en otro JCL.
- `COBOL.SYSIN`: fuente `PARMES`.
- `LKED.SYSLMOD`: módulo `PARMES` en `IBMUSER.COBOL.LOAD`.

Archivo: [`../jcl/CMPARM.jcl`](../jcl/CMPARM.jcl)

## RUNPARM

Objetivo: ejecutar `PARMES` pasando un dato por `SYSIN`.

- `EXEC PGM=PARMES`: ejecuta el load module.
- `STEPLIB`: indica dónde buscar el módulo ejecutable.
- `SYSIN DD *`: datos in-stream.
- `/*`: fin de datos in-stream.
- `SYSOUT DD SYSOUT=*`: salida al spool.

Archivo: [`../jcl/RUNPARM.jcl`](../jcl/RUNPARM.jcl)
