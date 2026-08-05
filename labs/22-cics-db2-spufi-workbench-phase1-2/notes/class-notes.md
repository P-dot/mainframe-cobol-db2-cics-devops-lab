# Clase técnica - Lab 22 Fases 1 y 2

## Qué enseña el autor en esta parte

El autor no empieza programando COBOL ni CICS. Empieza preparando el terreno de Db2. Su idea es transformar una transacción que antes consultaba VSAM en otra que consulte Db2. Para poder llegar a una transacción CICS/Db2, antes tiene que existir un entorno donde escribir SQL, guardar salidas, generar declaraciones y almacenar piezas que usará la compilación.

## Por qué esto importa

En mainframe no basta con escribir `SELECT` dentro de COBOL. Antes hay que entender las piezas que rodean a Db2:

```text
SQL de administración
SPUFI/QMF
catálogo Db2
DCLGEN
DBRM
BIND
plan/package
conexión CICS-Db2
```

Las fases 1 y 2 solo preparan las dos primeras piezas: datasets de trabajo y validación de SPUFI.

## Fase 1: banco de trabajo Db2

Se crearon datasets bajo `IBMUSER.DB2LAB.*`.

La decisión de usar `IBMUSER.DB2LAB` separa el laboratorio del sistema base. No toca librerías del producto Db2 ni objetos críticos.

### SPUFI

`IBMUSER.DB2LAB.SPUFI` es una PDS FB 80. Sirve para guardar miembros SQL. Es equivalente, conceptualmente, a una carpeta de scripts `.sql`, pero en formato mainframe.

### SPUFO

`IBMUSER.DB2LAB.SPUFO` es secuencial VB 4092. Sirve para recibir la salida de SPUFI: texto de la sentencia, SQLCODE, SQLSTATE, mensajes DSN y resultados.

### DCLGEN

`IBMUSER.DB2LAB.DCLGEN` queda preparada para una fase posterior. Ahí se guardará la copy COBOL generada desde una tabla Db2.

Analogía con el lab anterior:

```text
BMS ALL2MP  -> COPY ALL2MP para pantalla CICS
DCLGEN      -> COPY CLIENTES para tabla Db2
```

### DBRMLIB

`IBMUSER.DB2LAB.DBRMLIB` se usará cuando haya COBOL con SQL embebido. El DBRM representa las peticiones SQL extraídas del programa y será necesario para el BIND.

### BIND

`IBMUSER.DB2LAB.BIND` queda preparada para comandos o JCL de BIND. El BIND será la unión lógica entre el programa SQL y Db2 mediante plan o package.

## Fase 2: validación SPUFI

El objetivo no era crear tablas. Era demostrar que la herramienta funciona.

Primero se probaron sentencias inocuas, pero dieron errores útiles:

- `SYSIBM.SYSDUMMY1` produjo `SQLCODE -204`.
- `VALUES CURRENT DATE` produjo `SQLCODE -142`.

La conclusión correcta no era “Db2 no funciona”. La conclusión era más fina: SPUFI estaba enviando SQL a Db2 y Db2 estaba respondiendo, pero esas sentencias concretas no eran válidas en este entorno.

La prueba final correcta fue consultar el catálogo:

```sql
SELECT COUNT(*)
FROM SYSIBM.SYSTABLES;
```

Esto demostró que:

```text
SPUFI lee el miembro SQL.
SPUFI escribe la salida.
Db2 responde.
El catálogo es consultable.
```

## Resultado técnico de la fase 2

El resultado fue `619`, es decir, el catálogo contenía 619 entradas visibles en `SYSIBM.SYSTABLES` para esa consulta.

SPUFI mostró `NUMBER OF ROWS DISPLAYED IS 1` y luego `SQLCODE 100`, que en este contexto indica fin de filas después del SELECT. El COMMIT final terminó con SQLCODE 0.

## Qué queda fuera de este cierre

Queda pendiente para la fase 3 en adelante:

```text
inventario de Storage Groups
inventario de volúmenes Db2
decidir si se crea o reutiliza STOGROUP
crear DATABASE
crear TABLESPACE
crear TABLE CLIENTES
crear índice
insertar datos
consultar con QMF/SPUFI
generar DCLGEN
preparar ALL4 CICS/Db2
```
