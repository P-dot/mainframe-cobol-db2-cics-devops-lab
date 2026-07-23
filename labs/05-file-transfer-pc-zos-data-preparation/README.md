# 05 - File Transfer PC ↔ z/OS para preparación de datos COBOL

## Objetivo

Este lab documenta el uso de **File Transfer en wx3270** para mover un archivo plano entre Windows y z/OS.

El caso práctico adapta el ejemplo del vídeo a un entorno ADCD z/OS 1.11 / Hercules:

| Elemento | Vídeo | Lab adaptado |
|---|---|---|
| Archivo Windows | `C:\FICHEROS\ARCH.TXT` | `C:\CANAL_ZOS\ARCHI.txt` |
| Dataset z/OS | `CURSO1.LIB.SOURCE(CONTA1)` | `IBMUSER.COBOL.DATA(ARCHI)` |
| Librería de datos | usada dentro de SOURCE en el vídeo | separada como `IBMUSER.COBOL.DATA` |
| Transferencia 1 | PC → z/OS | `SEND to host` |
| Transferencia 2 | z/OS → PC | `RECEIVE from host` |

## Qué demuestra este lab

- Creación de una librería de datos COBOL con `IEFBR14`.
- Separación limpia entre fuente, load, JCL y datos.
- Transferencia de archivo plano desde Windows a z/OS.
- Verificación del miembro en ISPF 3.4.
- Transferencia inversa desde z/OS a Windows.
- Diagnóstico de errores habituales de ruta local y uso del prompt de wx3270.

## Estructura

```text
05-file-transfer-pc-zos-data-preparation/
  README.md
  data/
    ARCHI.txt
    ARCHI_FROM_ZOS_expected.txt
    record-layout.md
  jcl/
    CRDATA.jcl
  docs/
    01-overview.md
    02-create-cobol-data-library.md
    03-send-pc-to-zos.md
    04-receive-zos-to-pc.md
    05-troubleshooting.md
    06-evidence-index.md
  evidence/
    SCREENSHOTS.md
    screenshots/
    raw/
  notes/
    IBMUSER.HARDEN.CNTL-FILETRF.txt
  ops/
    github-add-lab-commands.md
```

## Resultado esperado

Al finalizar el lab, el ciclo debe quedar probado así:

```text
Windows:
C:\CANAL_ZOS\ARCHI.txt

        SEND to host

z/OS:
IBMUSER.COBOL.DATA(ARCHI)

        RECEIVE from host

Windows:
C:\CANAL_ZOS\ARCHI_FROM_ZOS.txt
```

## Regla administrativa

No meter datos en `IBMUSER.ML.JCL` ni en `IBMUSER.COBOL.SRC`.

```text
IBMUSER.ML.JCL      → JCL
IBMUSER.COBOL.SRC   → programas COBOL
IBMUSER.COBOL.LOAD  → módulos ejecutables
IBMUSER.COBOL.DATA  → archivos de datos
```
