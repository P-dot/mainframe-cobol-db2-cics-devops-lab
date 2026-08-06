# 02 - Flujo de comandos SPUFI

Los miembros SPUFI quedan reconstruidos en `src/spufi/`.

## Orden de ejecucion

```text
SPU001-SPU006  Inventario y comprobacion previa
SPU007         CREATE STOGROUP DB2LABSG
SPU008         Verificacion de STOGROUP
SPU009         CREATE DATABASE DB2LABDB
SPU010         Verificacion de DATABASE
SPU011         Comprobacion previa de TABLESPACE
SPU012         CREATE TABLESPACE DB2LABTS
SPU013         Verificacion de TABLESPACE
SPU014         Comprobacion previa de CLIENTES
SPU015         CREATE TABLE IBMUSER.CLIENTES
SPU016         Verificacion de tabla
SPU018         Comprobacion previa de indice
SPU019         CREATE UNIQUE INDEX IBMUSER.CLIDNIX
SPU020-SPU022  Verificacion de indice y columna DNI
SPU023         COUNT inicial
SPU024         Intento batch original, con rollback por comillas
SPU024A-C      Inserciones individuales seguras
SPU025         COUNT final = 3
SPU026         SELECT completo
SPU027         SELECT por DNI existente
SPU028         SELECT por DNI inexistente
```

## Resultado funcional

```sql
SELECT NOMBRE, APELLIDOS, DIRECCION
FROM IBMUSER.CLIENTES
WHERE DNI = '23456789B';
```

Resultado esperado:

```text
LUIS  MARTINEZ  TERUEL
```

## Caso negativo

```sql
SELECT NOMBRE, APELLIDOS, DIRECCION
FROM IBMUSER.CLIENTES
WHERE DNI = '99999999Z';
```

Resultado esperado:

```text
NUMBER OF ROWS DISPLAYED IS 0
SQLCODE IS 100
```

Este caso prepara la futura logica COBOL:

```text
SQLCODE = 0     cliente encontrado
SQLCODE = +100  cliente no encontrado
SQLCODE < 0     error Db2 real
```
