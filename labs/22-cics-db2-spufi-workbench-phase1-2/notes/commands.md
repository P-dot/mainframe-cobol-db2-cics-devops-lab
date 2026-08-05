# Comandos y acciones ejecutadas

## Fase 1 - Crear banco de trabajo Db2

Miembro JCL creado:

```text
IBMUSER.ML.JCL(CRDB2WK)
```

Acción:

```text
SAVE
SUB
```

Verificación en ISPF 3.4:

```text
IBMUSER.DB2LAB.*
```

Datasets observados:

```text
IBMUSER.DB2LAB.BIND
IBMUSER.DB2LAB.DBRMLIB
IBMUSER.DB2LAB.DCLGEN
IBMUSER.DB2LAB.OUT
IBMUSER.DB2LAB.SPUFI
IBMUSER.DB2LAB.SPUFO
```

## Fase 2 - Validar SPUFI

Miembro SQL final:

```text
IBMUSER.DB2LAB.SPUFI(SPU000)
```

SQL correcto:

```sql
SELECT COUNT(*)
FROM SYSIBM.SYSTABLES;
```

Panel SPUFI:

```text
Input  ===> DB2LAB.SPUFI(SPU000)
Output ===> DB2LAB.SPUFO
Execute ===> YES
Autocommit ===> YES
Browse output ===> YES
```

Resultado observado:

```text
COUNT(*) = 619
NUMBER OF ROWS DISPLAYED IS 1
COMMIT PERFORMED, SQLCODE IS 0
```
