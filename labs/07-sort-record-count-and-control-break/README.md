# 07 - SORT: contar registros y corte de control

## Objetivo

Este lab documenta la continuación directa del Lab 06. Ahora se usa el archivo `CLIENTE`, ya ordenado por apellido, para hacer dos operaciones con `SORT`:

```text
1. Contar registros.
2. Hacer un corte de control por apellido y sumarizar importes.
```

## Entorno

```text
ADCD z/OS 1.11 sobre Hercules / zPDT
Usuario: IBMUSER
JCL: IBMUSER.ML.JCL
Datos: IBMUSER.COBOL.FILE80
```

## Datasets y miembros

| Rol | Dataset / miembro |
|---|---|
| Entrada ordenada | `IBMUSER.COBOL.FILE80(CLIENTE)` |
| Salida sumarizada | `IBMUSER.COBOL.FILE80(CLISUM)` |
| Job de conteo | `IBMUSER.ML.JCL(CONTREC)` |
| Job de corte de control | `IBMUSER.ML.JCL(CORTECLI)` |

## Flujo

```text
CLIENTE  ── CONTREC  ──> SYSOUT: NUMERO DE REGISTROS 00000018

CLIENTE  ── CORTECLI ──> CLISUM: 9 registros sumarizados
```

## Resultado conseguido

```text
CLIENTE = 18 registros
CLISUM  = 9 registros
```

## Evidencias

Las evidencias están en:

```text
evidence/screenshots/
evidence/raw/CLASE9.docx
```

Incluyen:

```text
CONTREC
salida SDSF con NUMERO DE REGISTROS: 00000018
CORTECLI
CLISUM con 9 registros sumarizados
```

## Resultado final esperado en CLISUM

```text
FERNANDEZ   CARLOS  MADRID  00000490
GARCIA      SILVIA  BURGOS  00001500
GOMEZ       CARLOS  BILBAO  00000910
LOPEZ       CARMEN  MOJACAR 00000820
MARADONA    DIEGO   LANUS   00000580
MESSI       LIONEL  ROSARIO 00000370
PEREZ       ALBERTO VIGO    00001120
RODRIGUEZ   ROBERTO CORDOBA 00000745
VAZQUEZ     MONICA  ALMERIA 00000956
```

## Nota de saneamiento

No se incluyen capturas procedentes del vídeo ni el archivo de vídeo. Solo se incluyen evidencias técnicas generadas en el entorno z/OS del lab.
