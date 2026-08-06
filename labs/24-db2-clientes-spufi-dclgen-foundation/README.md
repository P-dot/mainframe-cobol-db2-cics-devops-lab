# Lab 24 - Db2 CLIENTES con SPUFI, catalogo, datos e DCLGEN

## Objetivo

Cerrar la primera parte del bloque **CICS/COBOL/Db2**: preparar una tabla Db2 real llamada `IBMUSER.CLIENTES`, validar su infraestructura en catalogo, cargar datos, probar consultas por DNI y generar el DCLGEN COBOL que servira para el siguiente laboratorio.

Este lab deja listo el punto de partida para la **Fase 9**, que ya pertenece a la segunda parte: CICS + Db2 + COBOL + precompilacion + BIND + transaccion `ALL4`.

## Entorno

- Plataforma: ADCD z/OS 1.11 sobre Hercules.
- Usuario: `IBMUSER`.
- Db2 subsystem: `DB9G` / catalogo `DSN910` en el entorno del laboratorio.
- Herramienta principal: DB2I / SPUFI.
- Dataset de trabajo SPUFI: `IBMUSER.DB2LAB.SPUFI`.
- Dataset de salida SPUFI: `IBMUSER.DB2LAB.SPUFO`.
- Dataset DCLGEN final: `IBMUSER.DB2LAB.DCLSEQ.COBOL`.

## Resultado final

```text
STOGROUP   DB2LABSG
DATABASE   DB2LABDB
TABLESPACE DB2LABTS
TABLE      IBMUSER.CLIENTES
INDEX      IBMUSER.CLIDNIX ON DNI
DATOS      3 clientes
DCLGEN     IBMUSER.DB2LAB.DCLSEQ.COBOL
```

## Fases cerradas

| Fase | Resultado |
|---|---|
| 3 | Inventario de catalogo Db2: STOGROUP, VCAT, volumnes y objetos existentes. |
| 4 | Creacion de `DB2LABSG`, `DB2LABDB` y `DB2LABTS`. |
| 5 | Creacion de tabla `IBMUSER.CLIENTES` e indice unico `IBMUSER.CLIDNIX`. |
| 6 | Carga de tres clientes de prueba con `INSERT`. |
| 7 | Consulta por DNI existente y DNI inexistente. |
| 8 | DCLGEN generado correctamente en dataset secuencial. |

## Estructura del repositorio

```text
24-db2-clientes-spufi-dclgen-foundation/
├── README.md
├── docs/
│   ├── 01-lab-summary.md
│   ├── 02-command-flow.md
│   ├── 03-troubleshooting.md
│   └── 04-phase09-preview.md
├── src/
│   ├── spufi/
│   └── dclgen/
├── evidence/
│   ├── raw/
│   └── images/
└── next/
    └── phase09-cics-db2-integration/
```

## Evidencias visuales

Las imagenes estan separadas por avance del laboratorio:

- `evidence/images/01-phase03-db2-inventory-and-objects/`: inventario y creacion de infraestructura Db2.
- `evidence/images/02-phase05-06-07-08-clientes-index-data-dclgen/`: tabla, indice, carga, consultas y DCLGEN.

## Corte correcto

Este lab termina en DCLGEN. La Fase 9 se inicia en el siguiente lab y usa como entrada este resultado:

```text
IBMUSER.CLIENTES
IBMUSER.CLIDNIX
IBMUSER.DB2LAB.DCLSEQ.COBOL
```
