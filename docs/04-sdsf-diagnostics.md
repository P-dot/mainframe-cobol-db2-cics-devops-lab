# Diagnóstico con SDSF

## Método usado

1. Submit del JCL.
2. Revisión del job en SDSF.
3. Si aparece `JOB NOT RUN`, revisar `JESJCL` y `JESYSMSG`.
4. Si el compilador arranca y falla, revisar el listado COBOL.
5. Si los pasos terminan con `CC 0000`, revisar `SYSOUT`.

## Errores reales encontrados

### 1. JOB NOT RUN - JCL ERROR

El job no llegó a ejecutar ningún step. Diagnóstico: leer JESJCL/JESYSMSG.

### 2. STEPLIB DATA SET NOT FOUND

La PROC COBOL buscaba una librería de compilador no catalogada. Se localizó la librería real `IGY420.SIGYCOMP` y se corrigió con `LNGPRFX='IGY420'`.

### 3. Parámetro mal escrito

`LNGRFX` no era reconocido. Corrección: `LNGPRFX`.

### 4. Error de columnas COBOL

El compilador arrancó, pero el fuente no respetaba formato fijo. Corrección: situar divisiones en Área A y sentencias ejecutables en Área B.

### 5. Error de continuación JCL

Una línea terminaba en coma y la continuación no fue recibida correctamente. Corrección: simplificar DDs en una sola línea cuando sea posible.
