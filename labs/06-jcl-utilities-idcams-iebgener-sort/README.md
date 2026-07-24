# 06 - JCL Utilities: IDCAMS, IEBGENER y SORT

## Objetivo

Este lab documenta una práctica de administración JCL sobre ADCD z/OS 1.11 / Hercules usando utilitarios clásicos:

```text
IDCAMS    → verificar catálogo/dataset
IEBGENER  → leer, copiar y concatenar miembros
SORT      → ordenar registros
```

La práctica adapta el vídeo del curso a tu entorno:

| Elemento | Vídeo | Lab adaptado |
|---|---|---|
| Dataset de trabajo | `CURSO1.ARCHIVOS.PRUEBAS` | `IBMUSER.COBOL.FILE80` |
| Archivo 1 | `CLIENTE1` | `IBMUSER.COBOL.FILE80(CLIENTE1)` |
| Archivo 2 | `CLIENTE2` | `IBMUSER.COBOL.FILE80(CLIENTE2)` |
| Concatenado | `CLIENTE3` | `IBMUSER.COBOL.FILE80(CLIENTE3)` |
| Ordenado final | `CLIENTE` | `IBMUSER.COBOL.FILE80(CLIENTE)` |

## Resultado conseguido

```text
CRFILE8   → crea IBMUSER.COBOL.FILE80
VERCLI1   → verifica que CLIENTE1 existe y es legible
CATCLI    → concatena CLIENTE1 + CLIENTE2 en CLIENTE3
SORTCLI   → ordena CLIENTE3 en CLIENTE
```

También se documenta un error real:

```text
ICE056A SORTOUT NOT DEFINED
COND CODE 0016
```

Causa: se codificó una segunda DD `SORTIN` en vez de `SORTOUT`.

## Flujo técnico

```text
CLIENTE1 ┐
         ├─ IEBGENER ─→ CLIENTE3 ── SORT ─→ CLIENTE
CLIENTE2 ┘
```

## Validaciones

- `VERCLI1` terminó con `CC 0000`.
- `CATCLI` generó `CLIENTE3` con 18 registros.
- `SORTCLI` falló primero por `SORTOUT NOT DEFINED`.
- `SORTCLI` corregido terminó con `CC 0000`.
- `CLIENTE` quedó ordenado por apellido.
