# Storyboard del lab

## 1. Preparación de librerías COBOL

Se crea una estructura mínima para prácticas COBOL/JCL:

- `IBMUSER.COBOL.SRC`: fuentes COBOL.
- `IBMUSER.COBOL.LOAD`: módulos ejecutables.
- `IBMUSER.ML.JCL`: miembros JCL.

Evidencia:

![Librerías COBOL](../evidence/screenshots/01-cobol-libraries-src-load.png)

## 2. Primer programa: HELLO

Se crea `IBMUSER.COBOL.SRC(HELLO)` con un programa COBOL mínimo:

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.
       PROCEDURE DIVISION.
           DISPLAY 'WELCOME TO IBMUSER COBOL'.
           STOP RUN.
```

Evidencia:

![HELLO source](../evidence/screenshots/03-hello-source-browse.png)

## 3. Compilación HELLO con IGYWCLG

Se usa un JCL tipo Compile + Link + Go.

Punto administrativo importante: la PROC `IGYWCLG` existe, pero fue necesario adaptar el prefijo del compilador a la librería real del sistema:

- Buscado inicialmente por la PROC: `IGY.V4R2M0.SIGYCOMP`.
- Encontrado en el sistema: `IGY420.SIGYCOMP`.
- Corrección usada: `LNGPRFX='IGY420'`.

Evidencias:

![PROC expandida](../evidence/screenshots/07-cmphello-igywclg-proc-expanded.png)

![Librería compilador](../evidence/screenshots/05-igy420-sigycomp-compiler-library.png)

## 4. Diagnósticos reales durante HELLO

Errores encontrados y resueltos:

1. `JOB NOT RUN - JCL ERROR`: error de sintaxis JCL.
2. `STEPLIB - DATA SET NOT FOUND`: la PROC apuntaba a una librería de compilador no existente en este ADCD.
3. `LNGRFX was not used`: parámetro mal escrito; el correcto era `LNGPRFX`.
4. Error de columna 7 COBOL: fuente no respetaba formato fijo.

Evidencias:

![JOB NOT RUN](../evidence/screenshots/06-cmphello-job-not-run-jcl-error.png)

![STEPLIB not found](../evidence/screenshots/08-cmphello-steplib-dataset-not-found.png)

![Typo LNGPRFX](../evidence/screenshots/09-cmphello-lngprfx-typo.png)

![COBOL column error](../evidence/screenshots/10-cmphello-cobol-column-error.png)

## 5. Compilación y link-edit correctos

Tras corregir JCL, PROC y columnas COBOL, el job llega a condición correcta.

Evidencia:

![Compile link success](../evidence/screenshots/11-cmphello-compile-link-success.png)

## 6. Segundo programa: PARMES

Se crea `IBMUSER.COBOL.SRC(PARMES)`, que lee una línea desde `SYSIN` y la muestra por `SYSOUT`.

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PARMES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  W-MES                 PIC X(80).
       PROCEDURE DIVISION.
           ACCEPT W-MES.
           DISPLAY W-MES.
           STOP RUN.
```

Evidencia:

![PARMES source](../evidence/screenshots/04-parmes-source-edit.png)

## 7. Compilar y link-editar PARMES

El vídeo separa compilación/link-edit de ejecución. Por eso se usa `IGYWCL`, no `IGYWCLG`.

JCL final limpio:

- `COBOL.SYSIN` apunta al fuente.
- `LKED.SYSLMOD` apunta a la LOADLIB.
- No se ejecuta todavía.

Errores encontrados:

- JCL error por líneas de continuación.
- Confusión inicial con `SYSIN DD DUMMY` dentro de la PROC.
- Solución: simplificar DDs en una línea y dejar el JCL mínimo necesario.

Evidencias:

![CMPARM JCL error](../evidence/screenshots/12-cmparm-job-not-run-jcl-error.png)

![IGYWCL PROC expanded](../evidence/screenshots/13-cmparm-igywcl-proc-expanded.png)

![Missing SYSIN diagnostic](../evidence/screenshots/14-cmparm-missing-sysin-diagnostic.png)

![Continuation error](../evidence/screenshots/15-cmparm-continuation-error.png)

## 8. Ejecutar PARMES con SYSIN/SYSOUT

Se crea `RUNPARM`, que ejecuta el módulo `PARMES` desde `IBMUSER.COBOL.LOAD`.

Entrada por `SYSIN`:

```jcl
//SYSIN DD *
DICIEMBRE
/*
```

Salida esperada por `SYSOUT`:

```text
DICIEMBRE
```

Evidencia:

![RUNPARM SYSOUT](../evidence/screenshots/16-runparm-sysout-diciembre.png)

## 9. Estado final del lab

Miembros principales en `IBMUSER.ML.JCL`:

- `CRCOBOL`
- `CMPHELLO`
- `CMPARM`
- `RUNPARM`

Evidencia:

![JCL library members](../evidence/screenshots/02-jcl-library-members.png)
