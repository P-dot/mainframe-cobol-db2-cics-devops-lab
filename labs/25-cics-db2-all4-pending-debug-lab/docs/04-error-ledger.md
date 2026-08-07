# Registro de errores y aprendizaje

## PCDB2 RC 16

Síntoma:

```text
DSNH061I DSNMAIN FILE SYSUT1 COULD NOT BE OPENED
DSNH061I DSNMAIN FILE SYSUT2 COULD NOT BE OPENED
RETURN CODE IS 16
```

Corrección: añadir `SYSUT1` y `SYSUT2` al paso `PCDB2`.

## SQLCA / SQLCODE no definidos

Síntoma:

```text
SQLCA was not defined as a data-name
SQLCODE was not defined as a data-name
```

Corrección: crear `IBMUSER.CICS.COPY(SQLCA)` y asegurar que `IBMUSER.CICS.COPY` está en el `SYSLIB` del compilador COBOL.

## LKED RC 8 por símbolos LE

Síntoma:

```text
IGZCBSO unresolved
CEESTART unresolved
CEEBETBL unresolved
CEESG005 unresolved
```

Corrección: añadir `CEE.SCEELKED` al `SYSLIB` del paso `LKED`.

## INSTALL GROUP parcial

Síntoma:

```text
Install of DB2CONN CICSDB2 failed because a DB2CONN is already installed and is in use.
GROUP ALL4 has been partially installed.
```

Tratamiento: no reinstalar `DB2CONN`; instalar individualmente `MAPSET`, `LIBRARY`, `PROGRAM`, `TRANSACTION`, `DB2ENTRY`, `DB2TRAN`.

## X SYSTEM

Síntoma: pantalla bloqueada con `X SYSTEM`.

Corrección aplicada: añadir `FREEKB` al `EXEC CICS SEND MAP`.

## Output BMS no pintado

Síntoma: `RECEIVE MAP` correcto, `SEND MAP` ejecutado, pero no aparecen los datos esperados.

Estado: pendiente.
