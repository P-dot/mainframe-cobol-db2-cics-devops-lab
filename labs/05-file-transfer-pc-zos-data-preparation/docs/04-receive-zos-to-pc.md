# 04 - RECEIVE: z/OS → Windows

## Objetivo

Descargar desde z/OS:

```text
'IBMUSER.COBOL.DATA(ARCHI)'
```

a Windows como:

```text
C:\CANAL_ZOS\ARCHI_FROM_ZOS.txt
```

Esto valida el ciclo completo:

```text
PC → z/OS → PC
```

## Antes de transferir

Salir de ISPF hasta:

```text
READY
```

## Parámetros en wx3270

```text
Local File:
C:\CANAL_ZOS\ARCHI_FROM_ZOS.txt

Host File:
'IBMUSER.COBOL.DATA(ARCHI)'

Direction:
Receive from host

Host type:
TSO

If destination file exists:
Replace it

Transfer mode:
ASCII text

ASCII options:
Add/remove CRs      marcado
Map character set   marcado
Windows code page   1252
```

## Verificación en Windows

Abrir:

```text
C:\CANAL_ZOS\ARCHI_FROM_ZOS.txt
```

Debe coincidir con:

```text
data/ARCHI_FROM_ZOS_expected.txt
```

## Comprobación visual

Debe contener los registros de:

```text
FERNANDEZ
RODRIGUEZ
VAZQUEZ
GARCIA
LOPEZ
PEREZ
GOMEZ
MESSI
MARADONA
```
