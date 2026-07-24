# 02 - Contar registros con SORT

## Job

```text
jcl/CONTREC.jcl
```

## Entrada

```text
IBMUSER.COBOL.FILE80(CLIENTE)
```

## Salida

```text
SYSOUT
```

## Control statements de SORT

```jcl
  OPTION COPY
  OUTFIL REMOVECC,NODETAIL,
         TRAILER1=('NUMERO DE REGISTROS: ',COUNT=(M11,LENGTH=8))
```

## Explicación

`OPTION COPY` procesa la entrada sin ordenar.

`NODETAIL` evita listar todos los registros.

`TRAILER1` genera una línea final con el contador.

## Resultado observado

```text
NUMERO DE REGISTROS: 00000018
```
