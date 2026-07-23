# 01 - Visión general

Este lab prepara el terreno para programas COBOL que leerán archivos.

Hasta ahora el proyecto ya tenía:

```text
IBMUSER.COBOL.SRC   → programas COBOL
IBMUSER.COBOL.LOAD  → módulos ejecutables
IBMUSER.ML.JCL      → JCLs
```

Para trabajar con archivos de entrada necesitamos añadir:

```text
IBMUSER.COBOL.DATA  → datos de entrada
```

El vídeo usa una librería llamada `CURSO1.LIB.SOURCE(CONTA1)`. En este lab no se replica literalmente porque esa librería no existe en el sistema ADCD del usuario.

Adaptación oficial:

```text
CURSO1.LIB.SOURCE(CONTA1)
        ↓
IBMUSER.COBOL.DATA(ARCHI)
```

## Flujo del lab

```text
1. Crear `IBMUSER.COBOL.DATA`.
2. Preparar `ARCHI.txt` en Windows.
3. Salir de ISPF hasta TSO READY.
4. Usar File Transfer SEND.
5. Verificar `IBMUSER.COBOL.DATA(ARCHI)`.
6. Usar File Transfer RECEIVE.
7. Verificar `ARCHI_FROM_ZOS.txt` en Windows.
```
