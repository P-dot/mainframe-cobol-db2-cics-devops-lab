# 05 - Troubleshooting

## Error: `No such file or directory`

Ejemplo:

```text
Local file 'C:\CANAL_ZOS\ARCHI.txt': No such file or directory
```

Causa probable:

```text
wx3270 no encuentra el archivo en el ordenador donde está corriendo el emulador.
```

Soluciones:

```text
1. Usar el botón Browse en File Transfer.
2. Confirmar si el archivo se llama ARCHI, ARCHI.txt o ARCHI.txt.txt.
3. Confirmar que existe en C:\CANAL_ZOS.
4. Si está en red, copiarlo desde \\192.168.1.128\canal_zos al C:\CANAL_ZOS del emulador.
```

## Error: usar el prompt interno de wx3270 como si fuera CMD

Síntoma:

```text
wx3270> dir C:\CANAL_ZOS\ARCHI* /a
Unknown action: dir
```

Explicación:

```text
Ese prompt no es CMD de Windows.
Es el prompt interno de acciones de wx3270.
```

Solución:

```text
No usar dir/cd/ls ahí.
Usar el botón Browse del formulario File Transfer,
o abrir CMD/PowerShell fuera de wx3270.
```

## Error: dirección incorrecta

Para subir PC → z/OS:

```text
Send to host
```

Para bajar z/OS → PC:

```text
Receive from host
```

## Error: destino incorrecto

No usar:

```text
IBMUSER.ML.JCL(ARCHI)
```

Usar:

```text
IBMUSER.COBOL.DATA(ARCHI)
```

## Error: `Keep it`

Si el miembro ya existe y se selecciona `Keep it`, la transferencia puede no reemplazar el contenido.

Para este lab usar:

```text
Replace it
```
