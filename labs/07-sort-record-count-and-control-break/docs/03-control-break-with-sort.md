# 03 - Corte de control con SORT

## Job

```text
jcl/CORTECLI.jcl
```

## Entrada

```text
IBMUSER.COBOL.FILE80(CLIENTE)
```

## Salida

```text
IBMUSER.COBOL.FILE80(CLISUM)
```

## Control statements de SORT

```jcl
  SORT FIELDS=(8,12,CH,A)
  SUM FIELDS=(36,8,ZD)
  OUTREC FIELDS=(8,28,36,8)
```

## Explicación

`SORT FIELDS=(8,12,CH,A)` ordena/agrupa por apellido.

`SUM FIELDS=(36,8,ZD)` suma los importes de los registros con la misma clave.

`OUTREC FIELDS=(8,28,36,8)` construye la salida quitando el número inicial de cliente y dejando:

```text
apellido + nombre + ciudad + importe sumarizado
```
