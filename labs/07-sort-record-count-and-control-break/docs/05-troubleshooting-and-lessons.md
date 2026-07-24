# 05 - Troubleshooting y lecciones

## Error conceptual del vídeo

En el vídeo se muestra y se corrige un error: duplicar el campo de importe en la salida del corte de control.

La causa es mezclar dos ideas:

```text
1. Copiar campos de entrada a salida.
2. Dejar que SORT escriba el campo sumarizado.
```

En este lab se deja documentado y corregido.

## Regla práctica

Cuando uses `SUM FIELDS`, revisa cuidadosamente el layout final para no escribir dos veces el mismo campo.

## Validación final

Comprobaciones realizadas:

```text
CONTREC -> NUMERO DE REGISTROS: 00000018
CORTECLI -> CLISUM con 9 registros
CLISUM -> importes sumarizados correctamente
```
