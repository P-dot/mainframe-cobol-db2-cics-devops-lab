# Runbook para la siguiente sesión

## Objetivo de continuación

No tocar Db2 al principio. Aislar BMS.

## Paso 1 — recuperar versión estable

1. Confirmar que `CMPA4DB` sigue dando:

```text
COBOL RC 0
LKED  RC 0
```

2. Aplicar:

```text
CEMT SET PROGRAM(ALL4) NEWCOPY
```

## Paso 2 — refrescar mapset físico

Ejecutar:

```text
CEDA INSTALL MAPSET(ALL4MP) GROUP(ALL4)
CEMT SET PROGRAM(ALL4MP) NEWCOPY
CEMT SET PROGRAM(ALL4) NEWCOPY
```

## Paso 3 — prueba SEND TEXT

Cambiar temporalmente `8000-ENVIAR-MAPA` por:

```cobol
       8000-ENVIAR-MAPA.

           EXEC CICS SEND TEXT
                FROM('DEBUG ALL4 EJECUTANDO SEND TEXT')
                LENGTH(31)
                ERASE
                FREEKB
           END-EXEC.
```

Compilar, `NEWCOPY`, ejecutar `ALL4`.

Resultado esperado:

```text
DEBUG ALL4 EJECUTANDO SEND TEXT
```

## Paso 4 — si SEND TEXT funciona

Volver a `SEND MAP` y probar `MAPONLY`/`DATAONLY`.

## Paso 5 — CEDF con Working Storage

En CEDF, justo antes del `SEND MAP`, usar PF5 Working Storage y verificar:

```text
ALL4MPO
DNIO
NOMBREO
APELLIDO
DIRECCIO
MSGO
```

## Paso 6 — si sigue fallando

Crear un mapa mínimo nuevo, no reutilizar `ALL4MP`:

```text
A4DBG
```

con un solo input y un solo output. El objetivo será descartar una mala generación BMS previa.
