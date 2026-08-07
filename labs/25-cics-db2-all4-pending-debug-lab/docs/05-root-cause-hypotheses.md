# Hipótesis de causa raíz pendientes

Basado en documentación oficial de IBM CICS/BMS y en las evidencias CEDF, las hipótesis más fuertes son:

## H1 — Mapa físico y mapa simbólico fuera de sincronía

El programa usa `COPY ALL4MP`, pero CICS ejecuta el mapset físico `ALL4MP` desde load library. Si el mapa físico cargado no coincide con la copy usada al compilar COBOL, los datos pueden no aparecer o aparecer desplazados.

Próxima prueba:

```text
CEDA INSTALL MAPSET(ALL4MP) GROUP(ALL4)
CEMT SET PROGRAM(ALL4MP) NEWCOPY
CEMT SET PROGRAM(ALL4) NEWCOPY
```

## H2 — Tratamiento de área simbólica BMS `ALL4MPO`

IBM documenta que en `SEND MAP`, BMS combina mapa físico y simbólico, y los datos de visualización salen de los subcampos con sufijo `O`. Hay que comprobar en CEDF/Working Storage si `ALL4MPO` contiene realmente `DNIO` y `MSGO` justo antes del `SEND`.

Próxima prueba:

```text
CEDF
PF5 WORKING STORAGE
localizar ALL4MPO / DNIO / MSGO antes del SEND MAP
```

## H3 — Uso de `LOW-VALUES` sobre mapa redefinido

`ALL4MPO REDEFINES ALL4MPI`. Limpiar el área equivocada en mal momento puede borrar datos recibidos. Ya se corrigió el orden `MOVE DNII TO CL1` antes de `MOVE LOW-VALUES TO ALL4MPO`, pero queda revisar todos los caminos.

## H4 — Necesidad de aislar BMS con `SEND TEXT`

Si `SEND TEXT` funciona pero `SEND MAP` no, el problema queda aislado en BMS/mapset/symbolic map.

Próxima prueba:

```cobol
EXEC CICS SEND TEXT
     FROM('DEBUG ALL4 EJECUTANDO SEND TEXT')
     LENGTH(31)
     ERASE
     FREEKB
END-EXEC.
```

## H5 — Probar envío `MAPONLY` + `DATAONLY`

Separar layout y datos permite ver si el problema está en el mapa físico o en el área dinámica.

Próxima prueba:

```cobol
EXEC CICS SEND MAP('ALL4MP') MAPSET('ALL4MP') MAPONLY ERASE FREEKB END-EXEC.
EXEC CICS SEND MAP('ALL4MP') MAPSET('ALL4MP') FROM(ALL4MPO) DATAONLY FREEKB END-EXEC.
```

## H6 — Campo de mensaje/atributos BMS

Si los campos se definieron sin atributos adecuados o con un estado inesperado, revisar `DFHMDF` para `NOMBRE`, `APELLID`, `DIRECCI` y `MSG`.

Próxima prueba: crear un mapa mínimo `A4DBG` con solo un campo output y un campo input.
