# LAB — Administración COBOL/JCL en ADCD z/OS 1.11

## Objetivo

Montar una práctica de administración y desarrollo COBOL/JCL en un entorno ADCD z/OS 1.11 sobre Hercules/zPDT, documentando no solo el caso exitoso, sino también los errores reales encontrados y su diagnóstico con SDSF.

Este lab corresponde a la semana de **COBOL + JCL**. La integración con **DB2 y CICS** queda prevista para la siguiente fase.

## Fuentes de aprendizaje usadas

- Vídeos/transcripciones del canal Carlos Arabito sobre introducción JCL, primera compilación COBOL y `SYSIN`/`SYSOUT`.
- Tom Taulli, *Modern Mainframe Development*: flujo de entorno mainframe, datasets, JCL, COBOL y SDSF.
- IBM zPDT / Hercules Redbook: contexto de ejecución en entorno emulado, DASD y 3270.
- IBM z/OS V1R11 Implementation: contexto de JES2, SDSF e ISPF.

Solo se han usado ampliaciones relacionadas directamente con los vídeos trabajados.

## Entorno

- Sistema: ADCD z/OS 1.11.
- Usuario: `IBMUSER`.
- Librería JCL: `IBMUSER.ML.JCL`.
- Librerías COBOL creadas:
  - `IBMUSER.COBOL.SRC`
  - `IBMUSER.COBOL.LOAD`
- Compilador COBOL localizado en:
  - `IGY420.SIGYCOMP`
- PROC usada:
  - `IGYWCLG` para Compile + Link + Go.
  - `IGYWCL` para Compile + Link.

## Estructura del lab

```text
lab-cobol-jcl-administration-adcd/
├── README.md
├── cobol/
│   ├── HELLO.cbl
│   └── PARMES.cbl
├── jcl/
│   ├── CRCOBOL.jcl
│   ├── CMPHELLO.jcl
│   ├── CMPARM.jcl
│   └── RUNPARM.jcl
├── docs/
│   ├── 01-storyboard.md
│   ├── 02-jcl-explained.md
│   ├── 03-cobol-explained.md
│   └── 04-sdsf-diagnostics.md
├── notes/
│   └── IBMUSER.HARDEN.CNTL-COBOLJCL.txt
└── evidence/
    ├── SCREENSHOTS.md
    ├── raw/
    └── screenshots/
```

## Flujo realizado

### 1. Crear librerías COBOL

Se ejecuta `CRCOBOL` para crear:

- `IBMUSER.COBOL.SRC`: fuente COBOL, `RECFM=FB`, `LRECL=80`.
- `IBMUSER.COBOL.LOAD`: módulos ejecutables, `RECFM=U`.

Evidencia:

![COBOL libraries](evidence/screenshots/01-cobol-libraries-src-load.png)

### 2. Crear y compilar `HELLO`

Se crea `HELLO` como primer programa COBOL mínimo.

Evidencia:

![HELLO source](evidence/screenshots/03-hello-source-browse.png)

Se prepara `CMPHELLO` con `IGYWCLG` para compilar, link-editar y ejecutar.

JCL final:

```jcl
//CMPHELLO JOB (ACCT),'HELLO COBOL',CLASS=A,MSGCLASS=X
//*
//* COMPILA, LINK-EDITA Y EJECUTA EL PROGRAMA COBOL HELLO
//* FUENTE : IBMUSER.COBOL.SRC(HELLO)
//* LOAD   : IBMUSER.COBOL.LOAD(HELLO)
//*
//COBRUN   EXEC IGYWCLG,LNGPRFX='IGY420'
//COBOL.SYSIN DD DSN=IBMUSER.COBOL.SRC(HELLO),DISP=SHR
//LKED.SYSLMOD DD DSN=IBMUSER.COBOL.LOAD(HELLO),DISP=SHR
//GO.SYSOUT DD SYSOUT=*
```

### 3. Diagnóstico real de `CMPHELLO`

Durante la adaptación al sistema aparecieron errores reales:

- Error JCL por nombre de dataset mal escrito.
- `STEPLIB DATA SET NOT FOUND` porque la PROC buscaba otro prefijo de compilador.
- Parámetro `LNGRFX` mal escrito; el correcto era `LNGPRFX`.
- Error COBOL por columnas/formato fijo.

La librería real del compilador fue localizada como `IGY420.SIGYCOMP`.

Evidencia:

![Compiler library](evidence/screenshots/05-igy420-sigycomp-compiler-library.png)

### 4. Crear `PARMES`

`PARMES` lee desde `SYSIN` y escribe en `SYSOUT`.

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

![PARMES source](evidence/screenshots/04-parmes-source-edit.png)

### 5. Compilar y link-editar `PARMES`

Se usa `CMPARM` con `IGYWCL`, sin ejecución.

JCL final:

```jcl
//CMPARM  JOB (ACCT),'PARMES C-L',CLASS=A,MSGCLASS=X
//*
//* COMPILA Y LINK-EDITA EL PROGRAMA PARMES
//* FUENTE : IBMUSER.COBOL.SRC(PARMES)
//* LOAD   : IBMUSER.COBOL.LOAD(PARMES)
//*
//COBRUN   EXEC IGYWCL,LNGPRFX='IGY420'
//COBOL.SYSIN DD DSN=IBMUSER.COBOL.SRC(PARMES),DISP=SHR
//LKED.SYSLMOD DD DSN=IBMUSER.COBOL.LOAD(PARMES),DISP=SHR
```

Resultado final reportado: `COND CODE 0000`.

### 6. Ejecutar `PARMES` con `SYSIN`

Se usa `RUNPARM` para ejecutar el load module y pasar `DICIEMBRE` por `SYSIN`.

```jcl
//RUNPARM JOB (ACCT),'RUN PARMES',CLASS=A,MSGCLASS=X
//*
//* EJECUTA PARMES Y PASA UN DATO POR SYSIN
//* PROGRAMA: IBMUSER.COBOL.LOAD(PARMES)
//*
//STEP01   EXEC PGM=PARMES
//STEPLIB  DD DSN=IBMUSER.COBOL.LOAD,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SYSIN    DD *
DICIEMBRE
/*
```

Evidencia final:

![RUNPARM SYSOUT](evidence/screenshots/16-runparm-sysout-diciembre.png)

## Resultado

El lab demuestra:

- Creación limpia de librerías COBOL.
- Separación de fuente, load modules y JCL.
- Compilación COBOL con PROC catalogada.
- Adaptación de PROC a librería real del compilador.
- Uso de `SYSIN`/`SYSOUT` en ejecución batch.
- Diagnóstico real con SDSF.
- Evidencias reutilizables para portfolio/GitHub.

## Próxima fase

Semana siguiente:

- COBOL + DB2.
- COBOL + CICS.
- CICS + DB2.
