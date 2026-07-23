# 03 - SEND: Windows → z/OS

## Objetivo

Enviar el archivo local:

```text
C:\CANAL_ZOS\ARCHI.txt
```

al miembro z/OS:

```text
'IBMUSER.COBOL.DATA(ARCHI)'
```

## Ruta del entorno

En el ordenador compartido:

```text
\\192.168.1.128\canal_zos\ARCHI.txt
```

En el ordenador donde corre el emulador wx3270:

```text
C:\CANAL_ZOS\ARCHI.txt
```

## Antes de transferir

Salir de ISPF hasta ver:

```text
READY
```

File Transfer se lanza desde TSO, no desde ISPF.

## Parámetros en wx3270

```text
Local File:
C:\CANAL_ZOS\ARCHI.txt

Host File:
'IBMUSER.COBOL.DATA(ARCHI)'

Direction:
Send to host

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

## Verificación

Volver a ISPF:

```text
ISPF
```

Ir a:

```text
3.4
```

Abrir:

```text
IBMUSER.COBOL.DATA(ARCHI)
```

Registros esperados:

```text
0000010FERNANDEZ   CARLOS  MADRID  00000190
0000020RODRIGUEZ   ROBERTO CORDOBA 00000345
0000030VAZQUEZ     MONICA  ALMERIA 00000456
...
0000090MARADONA    DIEGO   LANUS   00000380
```
