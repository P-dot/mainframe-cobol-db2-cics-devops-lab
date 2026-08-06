# 04 - Fase 9 preview: segunda parte del video

La siguiente fase ya no pertenece al cierre de este lab. Es la segunda parte: integrar CICS, COBOL y Db2.

## Lo que explica el autor en la segunda parte

1. Crear recursos CICS Db2 en grupo `ALL4`:
   - `DB2CONN`
   - `DB2ENTRY`
   - `DB2TRAN`

2. Crear/compilar mapa BMS `ALL4MP`.

3. Definir en CICS:
   - MAPSET / MAP
   - PROGRAM `ALL4`
   - TRANSACTION `ALL4`

4. Modificar COBOL:
   - sustituir lectura VSAM por SQL embebido.
   - usar DCLGEN `CLIENTES`.
   - controlar `SQLCODE`.

5. Compilar con JCL COBOL/CICS/Db2:
   - precompilador Db2.
   - traductor CICS.
   - compilador COBOL.
   - link-edit.
   - BIND PLAN.

6. Activar conexion CICS-Db2:
   - parametro `DB2CON=YES` en SIP.
   - reiniciar CICS.
   - validar mensajes `connecting to DB2 system DSN1`.

7. Ejecutar transaccion `ALL4` y comparar:
   - `ALL3`: lectura VSAM.
   - `ALL4`: consulta Db2.

## Punto de entrada para el siguiente lab

Partimos de:

```text
IBMUSER.CLIENTES             tabla cargada
IBMUSER.CLIDNIX              indice unico por DNI
IBMUSER.DB2LAB.DCLSEQ.COBOL  DCLGEN generado
```

El objetivo de la Fase 9 sera que CICS muestre por pantalla los datos de `CLIENTES` consultando Db2.
