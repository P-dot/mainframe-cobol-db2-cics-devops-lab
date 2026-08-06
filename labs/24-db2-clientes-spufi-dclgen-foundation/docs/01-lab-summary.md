# 01 - Resumen del lab

Este laboratorio cierra la primera parte del video de Db2: preparar estructuras Db2 desde SPUFI para que posteriormente puedan ser usadas desde CICS/COBOL.

## Concepto principal

Antes de escribir un programa CICS/COBOL/Db2, hay que preparar tres capas:

1. Capa fisica/logica Db2: `STOGROUP`, `DATABASE`, `TABLESPACE`.
2. Capa de datos: tabla `IBMUSER.CLIENTES`, indice unico por `DNI`, registros de prueba.
3. Capa COBOL: DCLGEN que traduce la definicion de la tabla a variables COBOL.

## Por que se corta aqui

El DCLGEN es el cierre natural de la preparacion Db2. A partir de aqui ya no estamos haciendo SQL puro, sino integracion de aplicacion:

```text
Db2 preparado -> DCLGEN generado -> COBOL/Db2 puede empezar
```

La segunda parte del video empieza justo con esa integracion: CICS define recursos Db2, el programa ALL4 sustituye lectura VSAM por SQL embebido, y el JCL anade precompilador Db2, compilacion CICS/COBOL, link-edit y BIND PLAN.
