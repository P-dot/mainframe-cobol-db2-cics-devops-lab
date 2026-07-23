# 06 - Índice de evidencias

Las evidencias del lab están en:

```text
evidence/screenshots/
evidence/raw/
```

## Evidencias esperadas

| Evidencia | Qué demuestra |
|---|---|
| `01-wx3270-file-transfer-form.png` | Formulario File Transfer de wx3270 |
| `02-wx3270-prompt-not-cmd.png` | Error de usar el prompt interno de wx3270 como CMD |
| Imágenes extraídas de `FILE_TRANSFER(1).docx` | Creación de `CRDATA` y aparición de `IBMUSER.COBOL.DATA` |
| Imágenes extraídas de `FILE_TRANSFER(3).docx` | Transferencia PC → z/OS completada |
| Imágenes extraídas de `FILE_TRANSFER(4).docx` | Transferencia z/OS → PC / cierre de evidencia |

## Evidencia mínima para README de GitHub

1. Archivo de datos `data/ARCHI.txt` incluido como referencia limpia, sin captura del vídeo.
2. Dataset `IBMUSER.COBOL.DATA` creado.
3. Miembro `IBMUSER.COBOL.DATA(ARCHI)` creado.
4. Formulario File Transfer con `Send to host`.
5. Miembro `ARCHI` abierto en ISPF con registros.
6. Formulario File Transfer con `Receive from host`.
7. Archivo `ARCHI_FROM_ZOS.txt` abierto en Windows.
