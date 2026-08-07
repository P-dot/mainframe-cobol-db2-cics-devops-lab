# Notas de investigación externa

Esta sección resume puntos documentados por IBM que ayudan a orientar la siguiente sesión.

## CEDF

CEDF permite interceptar programas de aplicación en la iniciación, en cada comando CICS y al terminar. Por eso la evidencia CEDF es fiable para confirmar que `RECEIVE MAP` y `SEND MAP` se alcanzan.

## BMS y SEND MAP

IBM documenta que en `SEND MAP` BMS construye la pantalla combinando mapa físico y mapa simbólico. Cuando se usa `ERASE`, el buffer de pantalla se limpia; en el caso típico, BMS envía componentes de los campos del mapa y obtiene datos de los subcampos de salida con sufijo `O`.

## FREEKB

`FREEKB` es una opción relevante de `SEND MAP`: en este lab desbloqueó el teclado 3270 que quedaba en `X SYSTEM`.

## Siguiente enfoque técnico

La evidencia apunta a investigar BMS/mapset/symbolic map antes de seguir con Db2. El plan recomendado es:

1. refrescar mapset físico,
2. probar `SEND TEXT`,
3. probar `MAPONLY`/`DATAONLY`,
4. inspeccionar `ALL4MPO` en CEDF Working Storage.
